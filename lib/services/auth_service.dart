import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:google_sign_in/google_sign_in.dart';

abstract class Auth {
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<User?> signInAnonymously();
  Future<User?> signInWithGoogle();
  Future<void> signOut();
}

class AuthService implements Auth {
  final instance = FirebaseAuth.instance;

  @override
  Stream<User?> authStateChanges() => FirebaseAuth.instance.authStateChanges();

  @override
  User? get currentUser => instance.currentUser;

  @override
  Future<User?> signInAnonymously() async {
    final userCredential = await instance.signInAnonymously();
    return userCredential.user;
  }

  @override
  Future<User?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await instance.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken));

        return userCredential.user;
      }
    } else {
      throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user');
    }
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await instance.signOut();
  }
}
