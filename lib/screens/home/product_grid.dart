import 'package:flutter/material.dart';
import '../../services/colors.dart';
import '../../widgets/search_bar.dart';
import 'package:provider/provider.dart';
import '../../models/login_state.dart';
import 'logged_out_view.dart';
import 'logged_in_view.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  bool _isSearching = false; // Manages search state
  String _searchQuery = ""; // Stores search query

  final List<String> imageUrls = [
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);

    return Scaffold(
      appBar: AppBar(
        elevation:
            6.0, // Controls the shadow (higher values create a deeper shadow)
        shadowColor:
            Colors.black.withOpacity(0.4), // Set shadow color if needed
        title: _isSearching
            ? CustomSearchBar(
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
              )
            : Text('Artify',
                style: TextStyle(
                    color: AppColors.secondary,
                    fontSize: 29,
                    fontWeight: FontWeight.w500)),
        actions: [
          if (!_isSearching)
            IconButton(
              icon: Icon(Icons.search, color: AppColors.secondary),
              onPressed: () {
                setState(() {
                  _isSearching = true;
                });
              },
            ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: AppColors.secondary),
            onPressed: () {
              // Add cart functionality here
            },
          ),
        ],
        backgroundColor: AppColors.white,
      ),

      // Change the view based on the login status
      body: _isSearching
          ? _buildSearchResults()
          : loginState.isLoggedIn
              ? LoggedInView() // Show content if logged in
              : LoggedInView(), // Show login prompt if not logged in
    );
  }

  // Method to build the section with title and carousel

  Widget _buildSearchResults() {
    return Center(
      child: Text("Displaying results for: $_searchQuery"),
    );
  }
}
