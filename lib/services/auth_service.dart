import 'package:firebase_auth/firebase_auth.dart';

abstract class Auth {
  User? get currentUser;
  Future<User?> signInAnonymously();
  Future<void> signOut();
}

class AuthService implements Auth {
  final instance = FirebaseAuth.instance;

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
