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

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  EmailSignInType _formType = EmailSignInType.signIn;

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  void _submit() async {
    try {
      if (_formType == EmailSignInType.register) {
        await widget.auth.createUserWithEmailAndPassword(_email, _password);
      } else {
        await widget.auth.signInWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
  }

  void _emailEditingComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  List<Widget> _buildChildren(BuildContext context) {
    final primaryText =
        _formType == EmailSignInType.signIn ? 'Sign in' : 'Create an account';
    final secondaryText = _formType == EmailSignInType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign in';

    return [
      _buildEmailTextField(),
      const SizedBox(
        height: 8.0,
      ),
      _buildPasswordTextField(),
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

  TextField _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      decoration: const InputDecoration(
          labelText: 'Password', hintText: 'yourpassword'),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onEditingComplete: _submit,
    );
  }

  TextField _buildEmailTextField() {
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration:
          const InputDecoration(labelText: 'Email', hintText: 'test@test.com'),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onEditingComplete: _emailEditingComplete,
    );
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
