import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/pages/widgets/sign_in_button.dart';
import 'package:time_tracker/services/auth_service.dart';

class SignInPage extends StatelessWidget {
  final void Function(User?) onSignIn;
  final Auth auth;

  const SignInPage({super.key, required this.onSignIn, required this.auth});

  Future<void> _signInAnonymously() async {
    try {
      final user = await auth.signInAnonymously();
      onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Tracker'),
        elevation: 2.0,
      ),
      backgroundColor: Colors.grey.shade200,
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 48.0),
            SignInButton(
              imageLink: 'images/google-logo.png',
              text: 'Sign in with Google',
              textColor: Colors.black87,
              color: Colors.white,
              onPressed: _signInWithGoogle,
            ),
            const SizedBox(height: 8.0),
            SignInButton(
              imageLink: 'images/facebook-logo.png',
              text: 'Sign in with Facebook',
              textColor: Colors.white,
              color: const Color(0xFF334D92),
              onPressed: _signInWithGoogle,
            ),
            const SizedBox(height: 8.0),
            SignInButton(
                text: 'Sign in with Email',
                color: Colors.teal.shade700,
                textColor: Colors.white,
                onPressed: () {}),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              'or',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, color: Colors.black87),
            ),
            const SizedBox(
              height: 8.0,
            ),
            SignInButton(
                text: 'Go Anonymous',
                color: Colors.lime,
                textColor: Colors.black,
                onPressed: _signInAnonymously),
          ]),
    );
  }

  void _signInWithGoogle() {
    // TODO: Auth with Google
  }
}
