import 'dart:async';

import 'package:time_tracker/models/email_sign_in_model.dart';
import 'package:time_tracker/services/auth_service.dart';

class EmailSignInBloc {
  final Auth auth;

  EmailSignInBloc({required this.auth});

  final StreamController<EmailSignInModel> _modelController =
      StreamController<EmailSignInModel>();

  Stream<EmailSignInModel> get modelStream => _modelController.stream;
  final EmailSignInModel _model = EmailSignInModel();

  void dispose() {
    _modelController.close();
  }

  Future<void> submit() async {
    updateWith(isLoading: true, submitted: true);
    try {
      if (_model.formType == EmailSignInType.register) {
        await auth.createUserWithEmailAndPassword(
            _model.email, _model.password);
      } else {
        await auth.signInWithEmailAndPassword(_model.email, _model.password);
      }
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  void onChangeMode() {
    final formType = _model.formType == EmailSignInType.signIn
        ? EmailSignInType.register
        : EmailSignInType.signIn;
    updateWith(
        email: '',
        password: '',
        isLoading: false,
        formType: formType,
        submitted: false);
  }

  void updateEmail(String email) => updateWith(email: email);

  void updatePassword(String password) => updateWith(password: password);

  void updateWith({
    String? email,
    String? password,
    EmailSignInType? formType,
    bool? isLoading,
    bool? submitted,
  }) {
    _model.copyWith(
        email: email,
        password: password,
        formType: formType,
        isLoading: isLoading,
        submitted: submitted);
    _modelController.add(_model);
  }
}
