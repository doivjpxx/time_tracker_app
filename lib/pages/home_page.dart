import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/services/auth_provider.dart';
import 'package:time_tracker/widgets/custom_dialog.dart';

import '../services/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<Auth>(context, listen: false);
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
        await _signOut(context);
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
