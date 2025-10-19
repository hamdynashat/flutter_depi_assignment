import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:encrypt_shared_preferences/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/firebase_services/auth_repo.dart';
import 'package:flutter_app/firebase_services/firestore_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo = AuthRepo();
  late final StreamSubscription<User?> authState;

  AuthCubit() : super(AuthInitial()) {
    authState = authRepo.authStateChanges().listen((user) {
      if (user == null) {
        emit(const AuthUnAuthenticated());
      } else {
        emit(AuthAuthenticated(user));
      }
    });
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  final GlobalKey<FormState> SignupKey = GlobalKey<FormState>();
  final GlobalKey<FormState> LoginKey = GlobalKey<FormState>();

  Future<bool> signIn(String email, String pass) async {
    if (LoginKey.currentState!.validate()) {
      emit(const AuthLoading());
      try {
        await authRepo.signInWithEmailAndPass(email, pass);
        var auth_prefs = await EncryptedSharedPreferences.getInstance();
        await auth_prefs.setString("username", usernameController.text.trim());
        await auth_prefs.setString("email", emailController.text.trim());
        return true;
      } on FirebaseAuthException catch (e) {
        emit(AuthUnAuthenticated(e.toString()));
        return false;
      }
    }
    return false;
  }

  Future<bool> signUp() async {
    if (SignupKey.currentState!.validate()) {
      emit(const AuthLoading());
      try {
        await authRepo.signUpWithEmailAndPass(
          emailController.text.trim(),
          passwordController.text.trim(),
        );
        await FireStoreService().signUpCollection(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          username: usernameController.text.trim(),
          firstName: firstNameController.text.trim(),
          secondName: secondNameController.text.trim(),
          lastName: lastNameController.text.trim(),
        );
        var auth_prefs = await EncryptedSharedPreferences.getInstance();
        await auth_prefs.setString("username", usernameController.text.trim());
        await auth_prefs.setString("email", emailController.text.trim());
        return true;

      } on FirebaseAuthException catch (e) {
        emit(AuthUnAuthenticated(e.toString()));
        return false;
      }
    }return false;
  }

  signOut() async {
    await authRepo.signOut();
    emit(const AuthUnAuthenticated());
    var auth_prefs = await EncryptedSharedPreferences.getInstance();
  }

  resetPassword(String email) async {
    await authRepo.resetPassword(email);
  }

  @override
  Future<void> close() {
    authState.cancel();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
