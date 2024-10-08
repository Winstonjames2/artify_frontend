import 'package:flutter/material.dart';
import '../services/colors.dart';

class SmallCarouselSlide extends StatelessWidget {
  final List<String> recentlyViewed; // List of image URLs
  final String title; // Title for the carousel

  // Constructor accepting parameters
  const SmallCarouselSlide({
    Key? key,
    required this.recentlyViewed,
    this.title = 'Recently Viewed', // Default title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: recentlyViewed.map((imageUrl) {
                return Padding(
                  padding: const EdgeInsets.only(
                      right: 8.0), // Spacing between cards
                  child: Card(
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Item Name', // Update with actual item name if available
                          style:
                              TextStyle(fontSize: 12, color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
