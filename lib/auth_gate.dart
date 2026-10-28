import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'pages/login_page.dart';
import 'pages/user_home.dart';
import 'pages/admin_home.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  Future<bool> _isAdmin(User user) async {
    final idToken = await user.getIdTokenResult(true);
    return idToken.claims?['admin'] == true;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snapshot.data;
        if (user == null) return LoginPage();

        return FutureBuilder<bool>(
          future: _isAdmin(user),
          builder: (context, roleSnap) {
            if (!roleSnap.hasData) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            return roleSnap.data! ? const AdminHome() : const UserHome();
          },
        );
      },
    );
  }
}
