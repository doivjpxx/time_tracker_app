import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth_service.dart';
import 'package:time_tracker/widgets/custom_dialog.dart';

class HomePage extends StatelessWidget {
  final Auth auth;

  const HomePage({super.key, required this.auth});

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      return;
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    try {
      final confirmSignOut = await showAlertDialog(context,
          title: 'Log out',
          content: 'Are you want to log out ?',
          defaultActionText: 'Log out',
          cancelActionText: 'Cancel');

      if (confirmSignOut) {
        _signOut();
      }
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        actions: <Widget>[
          MaterialButton(
            onPressed: () => _confirmSignOut(context),
            child: const Text(
              'Logout',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
