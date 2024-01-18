import 'package:flutter/material.dart';
import 'package:online_voting_admin/auth_service.dart';
import 'package:provider/provider.dart';
import 'candidate_registration.dart'; // Import the CandidateRegistrationScreen

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Provider.of<AuthService>(context, listen: false).signOut();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                    (route) => false,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Admin Panel Content'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the screen for creating nominees
                Navigator.pushNamed(context, '/createNominee');
              },
              child: Text('Create Nominee'),
            ),
          ],
        ),
      ),
    );
  }
}
