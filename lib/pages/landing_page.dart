import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/pages/home_page.dart';
import 'package:time_tracker/pages/sign_in_page.dart';
import 'package:time_tracker/services/auth_service.dart';

class LandingPage extends StatefulWidget {
  final Auth auth;

  const LandingPage({super.key, required this.auth});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User? _user;

  @override
  void initState() {
    super.initState();
    widget.auth.authStateChanges().listen((user) {
      print('uid: ${user?.uid}');
    });
    _updateUser(widget.auth.currentUser);
  }

  void _updateUser(User? user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.auth.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final Object? user = snapshot.data;
            if (user == null) {
              return SignInPage(
                onSignIn: _updateUser,
                auth: widget.auth,
              );
            }
            return HomePage(
              onSignOut: () => _updateUser(null),
              auth: widget.auth,
            );
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        }));
  }
}
