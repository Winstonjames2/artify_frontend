import 'package:flutter/material.dart';
import '../services/colors.dart';
// import '../services/product_service.dart';
import '../widgets/search_bar.dart';
import '../widgets/carousel_slide.dart';

class ProductGrid extends StatefulWidget {
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  // final ProductService _productService = ProductService();
  // late Future<List<dynamic>> _products;
  bool _isSearching = false; // Manages search state
  String _searchQuery = ""; // Stores search query

  final List<String> imageUrls = [
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    // Add more image URLs as needed...
  ];

  @override
  void initState() {
    super.initState();
    // _products = _productService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    fontSize: 28,
                    fontWeight: FontWeight.normal)),
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
        backgroundColor: AppColors.primary,
      ),
      body: _isSearching
          ? _buildSearchResults()
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 25),
                  CarouselSlide(imageUrls: imageUrls),
                  SizedBox(height: 25),
                  CarouselSlide(imageUrls: imageUrls),
                  SizedBox(height: 25),
                  CarouselSlide(imageUrls: imageUrls),
                ],
              ),
            ),
    );
  }

  Widget _buildSearchResults() {
    return Center(
      child: Text("Displaying results for: $_searchQuery"),
    );
  }
}
