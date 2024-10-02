import 'package:flutter/material.dart';
import '../services/colors.dart';
import '../services/product_service.dart';
import '../widgets/search_bar.dart';

class ProductGrid extends StatefulWidget {
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  final ProductService _productService = ProductService();
  late Future<List<dynamic>> _products;
  bool _isSearching = false; // Manages search state
  String _searchQuery = ""; // Stores search query

  @override
  void initState() {
    super.initState();
    _products = _productService.fetchProducts();
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
            icon: Icon(Icons.shopping_cart,
                color: AppColors.secondary), // Cart icon
            onPressed: () {
              // Add cart functionality here
            },
          ),
        ],
        backgroundColor: AppColors.primary, // AppBar background color
      ),
      body: _isSearching
          ? _buildSearchResults()
          : FutureBuilder<List<dynamic>>(
              future: _products,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  final products = snapshot.data!;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Image.network(products[index]['image_url'],
                                fit: BoxFit.cover),
                            Text(products[index]['title']),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: Text('No products found'));
                }
              },
            ),
    );
  }

  Widget _buildSearchResults() {
    return Center(
      child: Text("Displaying results for: $_searchQuery"),
    );
  }
}
