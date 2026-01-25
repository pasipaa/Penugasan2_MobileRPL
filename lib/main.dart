import 'package:flutter/material.dart';
import 'package:semester2_postman/views/dashboard.dart';
import 'package:semester2_postman/views/login_view.dart';
import 'package:semester2_postman/views/register_user_view.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterUserView(),
        '/dashboard': (context) => const DashboardView(),
      },
    ),
  );
}
