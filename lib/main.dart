import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'admin_panel.dart';
import 'candidate_registration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: MaterialApp(
        title: 'Your App Name',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/adminPanel': (context) => AdminPanel(),
          '/createNominee': (context) => CandidateRegistrationScreen(),
        },
      ),
    );
  }
}
