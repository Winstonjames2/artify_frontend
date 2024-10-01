import 'package:flutter/material.dart';
import 'product_grid.dart';
import '../widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool _isSearching = false;
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomSearchBar(
          isSearching: _isSearching,
          onCancelSearch: () {
            setState(() {
              _isSearching = false;
              _searchQuery = "";
            });
          },
          onSearch: (query) {
            setState(() {
              _searchQuery = query;
            });
          },
        ),
        actions: [
          if (!_isSearching)
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                setState(() {
                  _isSearching = true;
                });
              },
            ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white), // Cart icon
            onPressed: () {
              // Add cart functionality here
            },
          ),
        ],
        backgroundColor: Colors.orange,
      ),
      body: _isSearching ? _buildSearchResults() : ProductGrid(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.orange, // Bottom navigation background color
        selectedItemColor: Colors.black, // Icon color when selected
        unselectedItemColor: Colors.white, // Icon color when unselected
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

  Widget _buildSearchResults() {
    return Center(
      child: Text("Displaying results for: $_searchQuery"),
    );
  }
}
