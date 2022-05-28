import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

abstract class Auth {
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<User?> signInAnonymously();
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
  Future<void> signOut() async {
    await instance.signOut();
  }
}
