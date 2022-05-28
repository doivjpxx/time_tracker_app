import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/pages/home_page.dart';
import 'package:time_tracker/pages/sign_in_page.dart';
import 'package:time_tracker/services/auth_service.dart';

class LandingPage extends StatelessWidget {
  final Auth auth;

  User? _user;

  LandingPage({super.key, required this.auth});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final Object? user = snapshot.data;
            if (user == null) {
              return SignInPage(
                auth: auth,
              );
            }
            return HomePage(
              auth: auth,
            );
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        }));
  }
}
