import 'package:flutter/material.dart';
import '../services/colors.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Unique AppBar for the Account Page or no AppBar
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: AppColors.primary, // Optional: Customize color
      ),

      // Main body of the Account Page
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle, size: 100, color: AppColors.primary),
            SizedBox(height: 20),
            Text(
              'Welcome to Your Account!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Manage your personal information here.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Add navigation to profile settings or other actions
              },
              child: Text('Edit Profile'),
              style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            ),
            ElevatedButton(
              onPressed: () {
                // Add functionality for logging out or other actions
              },
              child: Text('Log Out'),
              style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
