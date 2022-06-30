import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth_provider.dart';
import 'package:time_tracker/utils/validator.dart';
import 'package:time_tracker/widgets/custom_dialog.dart';
import 'package:time_tracker/widgets/form_submit_button.dart';

enum EmailSignInType { signIn, register }

class EmailSignInForm extends StatefulWidget with EmailAndPasswordValidators {
  EmailSignInForm({super.key});

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

  bool _isSubmitted = false;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    setState(() {
      _isSubmitted = false;
    });
  }

  void _submit() async {
    final auth = AuthProvider.of(context);
    setState(() {
      _isLoading = true;
      _isSubmitted = true;
    });
    try {
      if (_formType == EmailSignInType.register) {
        await auth.createUserWithEmailAndPassword(_email, _password);
      } else {
        await auth.signInWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
      showAlertDialog(context,
          title: 'Sign in failed',
          content: e.toString(),
          defaultActionText: 'OK');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _emailEditingComplete() {
    final newFocus = widget.emailValidator.isValid(_email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _onChange() {
    setState(() {});
  }

  void _onChangeMode() {
    setState(() {
      _isSubmitted = false;
      if (_formType == EmailSignInType.signIn) {
        _formType = EmailSignInType.register;
      } else {
        _formType = EmailSignInType.signIn;
      }
      _emailController.clear();
      _passwordController.clear();
    });
  }

  List<Widget> _buildChildren(BuildContext context) {
    final primaryText =
        _formType == EmailSignInType.signIn ? 'Sign in' : 'Create an account';
    final secondaryText = _formType == EmailSignInType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign in';

    bool isValid = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password);

    return [
      _buildEmailTextField(),
      const SizedBox(
        height: 8.0,
      ),
      _buildPasswordTextField(context),
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
          onPressed: _isLoading ? null : _onChangeMode,
          child: Text(secondaryText))
    ];
  }

  TextField _buildPasswordTextField(BuildContext context) {
    bool isNotValid = _isSubmitted &&
        !widget.passwordValidator.isValid(_password) &&
        !_isLoading;
    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'yourpassword',
          enabled: !_isLoading,
          errorText: isNotValid ? widget.invalidPasswordText : null),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onEditingComplete: _submit,
      onChanged: (_) => _onChange,
    );
  }

  TextField _buildEmailTextField() {
    bool isNotValid = _isSubmitted && !widget.emailValidator.isValid(_email);
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'test@test.com',
          enabled: !_isLoading,
          errorText: isNotValid ? widget.invalidEmailText : null),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onEditingComplete: _emailEditingComplete,
      onChanged: (_) => _onChange,
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
