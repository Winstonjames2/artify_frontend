import 'package:flutter/material.dart';
import '../../services/colors.dart';
// import '../../widgets/search_bar.dart';
// import 'package:provider/provider.dart';
// import '../../models/login_state.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int _quantity = 1;
  Color _selectedColor = Colors.black; // Default color
  final List<Color> _availableColors = [Colors.black, Colors.blue, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        backgroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: Image.network(
                'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img', // Replace with actual image URL
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),

            // Product Price
            Text(
              '\$99.99', // Replace with dynamic price
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accent),
            ),

            // Product Name
            SizedBox(height: 8),
            Text(
              'Product Name', // Replace with dynamic name
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            // Product Description
            SizedBox(height: 8),
            Text(
              'This is a great product that you will love!', // Replace with dynamic description
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),

            Divider(height: 32),

            // Color Options
            Text("Color"),
            Row(
              children: _availableColors.map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = color;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: color == _selectedColor
                            ? AppColors.accent
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            // Quantity Selector
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Quantity"),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (_quantity > 1) {
                      setState(() {
                        _quantity--;
                      });
                    }
                  },
                ),
                Text('$_quantity'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                ),
              ],
            ),

            // Add to Cart Button
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add to cart functionality
              },
              child: Text("Add to Cart"),
              style: ElevatedButton.styleFrom(
                // primary: AppColors.accent,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
            ),

            Divider(height: 32),

            // Review Block
            _buildReviewBlock(),

            Divider(height: 32),

            // Item Details Block
            _buildItemDetailsBlock(),

            Divider(height: 32),

            // Seller Info Block
            _buildSellerInfoBlock(),

            Divider(height: 32),

            // Related Items Block
            _buildRelatedItemsBlock(),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reviews",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
            "Customer reviews will appear here."), // Replace with actual review data
      ],
    );
  }

  Widget _buildItemDetailsBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Item Details",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
            "Made from high-quality materials."), // Replace with dynamic material info
        SizedBox(height: 4),
        Text("Durable and sustainable."),
      ],
    );
  }

  Widget _buildSellerInfoBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Seller Info",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text("Seller name: John Doe"), // Replace with dynamic seller info
        Text("Location: California, USA"),
      ],
    );
  }

  Widget _buildRelatedItemsBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Related Items",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        // Display related items in a horizontal list
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              5,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://example.com/related-item-$index.jpg'), // Replace with actual image URLs
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
