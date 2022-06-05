import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'dart:async';

import 'package:google_sign_in/google_sign_in.dart';

abstract class Auth {
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<User?> signInAnonymously();
  Future<User?> signInWithGoogle();
  Future<User?> signInWithFacebook();
  Future<User?> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<User?> createUserWithEmailAndPassword(String email, String password);
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
  Future<User?> signInWithFacebook() async {
    final fb = FacebookLogin();
    final response = await fb.logIn(permissions: [
      FacebookPermission.email,
      FacebookPermission.publicProfile
    ]);

    switch (response.status) {
      case FacebookLoginStatus.success:
        final accessToken = response.accessToken;
        if (accessToken != null) {
          final userCredential = await instance.signInWithCredential(
              FacebookAuthProvider.credential(accessToken.token));

          return userCredential.user;
        }
        return null;
      case FacebookLoginStatus.cancel:
        throw FirebaseAuthException(code: 'ERROR_ABORTED_BY_USER');
      case FacebookLoginStatus.error:
        throw FirebaseAuthException(code: 'ERROR_FACEBOOK_LOGIN_FAIL');

      default:
        throw UnimplementedError();
    }
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
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await instance.signInWithCredential(
        EmailAuthProvider.credential(email: email, password: password));

    return userCredential.user;
  }

  @override
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await instance.createUserWithEmailAndPassword(
        email: email, password: password);

    return userCredential.user;
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    final facebookSignIn = FacebookLogin();
    await googleSignIn.signOut();
    await facebookSignIn.logOut();
    await instance.signOut();
  }
}
