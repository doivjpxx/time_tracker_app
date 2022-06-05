import 'package:flutter/material.dart';
import 'package:time_tracker/pages/widgets/email_sign_in_form.dart';
import 'package:time_tracker/services/auth_service.dart';

class EmailSignInPage extends StatelessWidget {
  final Auth auth;
  const EmailSignInPage({super.key, required this.auth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign in with email')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: EmailSignInForm(auth: auth),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
