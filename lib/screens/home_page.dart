import 'package:flutter/material.dart';
import '../services/colors.dart';
import 'product_grid.dart';
import 'account_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    ProductGrid(), // Main product page
    Center(child: Text('Custom')), // Placeholder for custom page
    Center(child: Text('Favorites')), // Placeholder for favorites page
    AccountPage(), // Account page
  ];
  int _currentIndex = 0; // Keeps track of the current page index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the current page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor:
            AppColors.primary, // Bottom navigation background color
        selectedItemColor: AppColors.accent, // Icon color when selected
        unselectedItemColor: AppColors.secondary, // Icon color when unselected
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.design_services), label: 'Custom'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }
}
