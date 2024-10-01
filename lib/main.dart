import 'package:flutter/material.dart';
import 'screens/home_page.dart'; // Import the HomePage from homepage.dart

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
      home: HomePage(), // Set the HomePage as the landing page
      // custom: CustomPage(),
      // favorite: FavroritePage(),
    );
  }
}
