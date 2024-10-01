import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'product_model.dart'; // Import the product model

class ProductGrid extends StatefulWidget {
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  final String baseUrl =
      'http://127.0.0.1:8000'; // Change this to your backend's URL

  List<Product> _products = []; // List to hold fetched products
  bool _isLoading = true; // Tracks loading state

  @override
  void initState() {
    super.initState();
    fetchProducts(); // Fetch products when the widget is built
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse(
        '$baseUrl/api/craft-items/')); // Replace with your Django API URL
    if (response.statusCode == 200) {
      final List<dynamic> productData = json.decode(response.body);
      setState(() {
        _products = productData.map((data) => Product.fromJson(data)).toList();
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child:
                CircularProgressIndicator()) // Show loading indicator while fetching data
        : GridView.builder(
            padding: EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 2 / 3,
            ),
            itemCount: _products.length, // Use fetched products length
            itemBuilder: (context, index) {
              final product = _products[index]; // Get the product at index
              return Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        child: Image.network(
                          product.imageUrl, // Use product image URL
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '\$${product.price}', // Use product price
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: 5),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 2,
                            ),
                            onPressed: () {
                              // Add functionality for adding to cart
                            },
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
