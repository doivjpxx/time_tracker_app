import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/pages/home_page.dart';
import 'package:time_tracker/pages/sign_in_page.dart';
import 'package:time_tracker/services/auth_service.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);

    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final Object? user = snapshot.data;
            if (user == null) {
              return SignInPage.create(context);
            }
            return const HomePage();
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        }));
  }
}
