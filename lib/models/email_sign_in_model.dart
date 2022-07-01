import 'package:time_tracker/utils/validator.dart';

enum EmailSignInType { signIn, register }

class EmailSignInModel with EmailAndPasswordValidators {
  final String email;
  final String password;
  final EmailSignInType formType;
  final bool isLoading;
  final bool submitted;

  EmailSignInModel(
      {this.email = '',
      this.password = '',
      this.formType = EmailSignInType.signIn,
      this.isLoading = false,
      this.submitted = false});

  String get primaryText =>
      formType == EmailSignInType.signIn ? 'Sign in' : 'Create an account';

  String get secondaryText => formType == EmailSignInType.signIn
      ? 'Need an account? Register'
      : 'Have an account? Sign in';

  bool get canSubmit =>
      emailValidator.isValid(email) && passwordValidator.isValid(password);

  bool get isInValid =>
      submitted && !passwordValidator.isValid(password) && !isLoading;

  bool get emailIsInValid => submitted && !emailValidator.isValid(email);

  EmailSignInModel copyWith({
    String? email,
    String? password,
    EmailSignInType? formType,
    bool? isLoading,
    bool? submitted,
  }) {
    return EmailSignInModel(
      email: email ?? this.email,
      password: password ?? this.password,
      formType: formType ?? this.formType,
      isLoading: isLoading ?? this.isLoading,
      submitted: submitted ?? this.submitted,
    );
  }
}
