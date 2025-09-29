import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/firebase_services/auth_repo.dart';


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

  final GlobalKey<FormState> SignupKey = GlobalKey<FormState>();
  final GlobalKey<FormState> LoginKey = GlobalKey<FormState>();

  Future<bool> signIn(String email, String pass) async {
    if (LoginKey.currentState!.validate()) {
      emit(const AuthLoading());
      try {
        await authRepo.signInWithEmailAndPass(email, pass);
        return true;
      } on FirebaseAuthException catch (e) {
        emit(AuthUnAuthenticated(e.toString()));
        return false;
      }
    } return false;
  }

  Future<bool> signUp(String email, String pass) async {
    if (SignupKey.currentState!.validate()) {
      emit(const AuthLoading());
      try {
        await authRepo.signUpWithEmailAndPass(email, pass);
        return true;
      } on FirebaseAuthException catch (e) {
        emit(AuthUnAuthenticated(e.toString()));
        return false;
      }
    } return false;
  }

  signOut() async {
    await authRepo.signOut();
    emit(const AuthUnAuthenticated());
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
