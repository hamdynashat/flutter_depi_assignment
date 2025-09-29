import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> authStateChanges() => auth.authStateChanges();

  User? get currentUser => auth.currentUser;

  Future<UserCredential>signInWithEmailAndPass(String email,String pass){
    return auth.signInWithEmailAndPassword(email: email, password: pass);
  }
  Future<UserCredential>signUpWithEmailAndPass(String email,String pass){
    return auth.createUserWithEmailAndPassword(email: email, password: pass);
  }
  Future<void>signOut()async{
    await auth.signOut();
  }
  Future<void>resetPassword(String email)async{
    await auth.sendPasswordResetEmail(email: email);
  }

}