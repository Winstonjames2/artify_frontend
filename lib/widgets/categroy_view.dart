import 'package:flutter/material.dart';
import '../services/colors.dart'; // Adjust the import according to your project structure

class CategoryView extends StatelessWidget {
  final List<String> categories;
  final String title; // Title for the carousel

  const CategoryView({
    Key? key,
    required this.categories,
    this.title = 'Recently Viewed',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildCategoryGrid();
  }

  // Build the Category Grid
  Widget _buildCategoryGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title, // Use the title parameter
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          GridView.builder(
            shrinkWrap: true, // Important to make GridView fit inside a Column
            physics:
                const NeverScrollableScrollPhysics(), // Disable scrolling for GridView
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Number of categories per row
              childAspectRatio: 0.8, // Adjust the height/width ratio of items
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to category-specific page
                  print("Navigating to category: ${categories[index]}");
                  // Add navigation logic here if needed
                },
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.accent, // Category item background
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons
                            .category, // Replace with custom icons per category
                        color: AppColors.white,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      categories[index],
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 15, color: AppColors.black),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
