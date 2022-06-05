import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth_service.dart';
import 'package:time_tracker/widgets/form_submit_button.dart';

enum EmailSignInType { signIn, register }

class EmailSignInForm extends StatefulWidget {
  final Auth auth;

  const EmailSignInForm({super.key, required this.auth});

  @override
  State<EmailSignInForm> createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  EmailSignInType _formType = EmailSignInType.signIn;

  void _submit() {
    print('email: ${_emailController.text}');
    print('email: ${_passwordController.text}');
  }

  List<Widget> _buildChildren(BuildContext context) {
    final primaryText =
        _formType == EmailSignInType.signIn ? 'Sign in' : 'Create an account';
    final secondaryText = _formType == EmailSignInType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign in';

    return [
      TextField(
        controller: _emailController,
        decoration: const InputDecoration(
            labelText: 'Email', hintText: 'test@test.com'),
      ),
      const SizedBox(
        height: 8.0,
      ),
      TextField(
        controller: _passwordController,
        decoration: const InputDecoration(
            labelText: 'Password', hintText: 'yourpassword'),
        obscureText: true,
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        width: double.infinity,
        child: FormSubmitButton(
            text: primaryText,
            color: Theme.of(context).primaryColor,
            onPressed: _submit),
      ),
      const SizedBox(
        height: 8.0,
      ),
      TextButton(
          onPressed: () {
            setState(() {
              if (_formType == EmailSignInType.signIn) {
                _formType = EmailSignInType.register;
              } else {
                _formType = EmailSignInType.signIn;
              }
              _emailController.clear();
              _passwordController.clear();
            });
          },
          child: Text(secondaryText))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(context),
      ),
    );
  }
}
