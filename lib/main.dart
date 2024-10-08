import 'package:flutter/material.dart';
import 'package:nameless/screens/login_page.dart';
import 'package:nameless/services/colors.dart';
import 'screens/home_page.dart'; // Import the HomePage from home_page.dart
import 'package:provider/provider.dart';
import 'models/login_state.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LoginState(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artify',
      theme: ThemeData(
        primarySwatch: Colors.orange, // Primary theme color
        scaffoldBackgroundColor: AppColors.canvas,
        // Text theme to control fonts globally
        textTheme: GoogleFonts.afacadTextTheme(
          Theme.of(context).textTheme.copyWith(
                bodyLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                bodyMedium:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
                bodySmall:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
              ),
        ),

        // Button theme to control buttons globally
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.white, // Default background color
            foregroundColor: AppColors.black,
            textStyle: TextStyle(
              fontFamily: 'Afacad Flux',
              fontSize: 18, // Button text size
              fontWeight: FontWeight.normal, // Button text weight.
              color: Colors.white, // Button text color
            ),
            side: BorderSide(
                color: AppColors.black, width: 1.5, style: BorderStyle.solid),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ), // Button padding
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.orange, // Default text color
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: AppColors.white,
            ),
          ),
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.orange, // Text color
            side: BorderSide(color: Colors.orange), // Border color
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      initialRoute: '/', // Set the initial route (home page)
      routes: {
        '/': (context) => HomePage(), // HomePage route
        '/account': (context) => LoginPage(), // AccountPage route
      },
    );
  }
}
