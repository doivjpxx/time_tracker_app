import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth_service.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        actions: <Widget>[
          MaterialButton(
            onPressed: _signOut,
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
