import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_tracker/services/auth_service.dart';

class SignInBloc {
  final Auth auth;
  SignInBloc({required this.auth});

  final StreamController<bool> _isLoadingController = StreamController<bool>();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  void dispose() {
    _isLoadingController.close();
  }

  void _setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

  Future<User?> _signIn(Future<User?> Function() signInMethod) async {
    try {
      _setIsLoading(true);
      return await signInMethod();
    } catch (e) {
      _setIsLoading(false);
      rethrow;
    } // no need to finally here, bloc auto dispose when move to next page
  }

  Future<User?> signInAnonymously() async =>
      await _signIn(() => auth.signInAnonymously());

  Future<User?> signInWithGoogle() async =>
      await _signIn(() => auth.signInWithGoogle());

  Future<User?> signInWithFacebook() async =>
      await _signIn(() => auth.signInWithFacebook());
}
