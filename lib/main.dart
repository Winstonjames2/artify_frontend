import 'package:flutter/material.dart';
import 'screens/home_page.dart'; // Import the HomePage from home_page.dart
import 'screens/account_page.dart'; // Import the AccountPage from account_page.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artify',
      theme: ThemeData(
        primarySwatch: Colors.orange, // Primary theme color
      ),
      initialRoute: '/', // Set the initial route (home page)
      routes: {
        '/': (context) => HomePage(), // HomePage route
        '/account': (context) => AccountPage(), // AccountPage route
        // '/custom': (context) => CustomPage(), // Uncomment for custom page
        // '/favorite': (context) => FavoritePage(), // Uncomment for favorite page
      },
    );
  }
}
