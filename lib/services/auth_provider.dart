import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth_service.dart';

class AuthProvider extends InheritedWidget {
  final Auth auth;

  const AuthProvider({super.key, required super.child, required this.auth});
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static Auth of(BuildContext context) {
    AuthProvider provider =
        context.dependOnInheritedWidgetOfExactType<AuthProvider>()!;
    return provider.auth;
  }
}
