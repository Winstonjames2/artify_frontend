import 'package:flutter/material.dart';
import '../../services/colors.dart'; // Adjust the import according to your project structure
import '../../widgets/carousel_slide.dart';

class LoggedOutView extends StatelessWidget {
  final List<String> imageUrls = [
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Center(
            child: Container(
              padding:
                  const EdgeInsets.all(8), // Add some padding to the content
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msMpy.img'),
                  fit: BoxFit.cover,
                ),
                color: AppColors.white, // Set your desired background color
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Join us to access all our unique handcrafted items.',
                    style: TextStyle(color: AppColors.accent),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to login screen
                      Navigator.pushNamed(context, '/account');
                    },
                    child: const Text(
                      'Log In',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          _buildCarouselSection(
            context,
            "Home Made",
            '',
            imageUrls,
            () {
              print("Navigating to details for Home Made");
            },
          ),
          const SizedBox(height: 25),
          _buildCarouselSection(
            context,
            "Fancy Items",
            '',
            imageUrls,
            () {
              print("Navigating to details for Fancy Items");
            },
          ),
          const SizedBox(height: 25),
          _buildCarouselSection(
            context,
            "Extraordinary Design",
            'Made By Winston',
            imageUrls,
            () {
              print("Navigating to details for Extraordinary Design");
            },
          ),
        ],
      ),
    );
  }

  // Mock implementation of _buildCarouselSection
  Widget _buildCarouselSection(BuildContext context, String title, String? desc,
      List<String> imageUrls, VoidCallback onTitleClick) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.accent, // Background color
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            child: TextButton(
              onPressed: onTitleClick,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text and desc
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.start, // Aligns text and icon
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.white, // Adjust color as needed
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      ),
                      Icon(
                        Icons.arrow_forward, // The arrow icon
                        size: 18,
                        color: AppColors.white, // Same color as the text
                      ),
                    ],
                  ),
                  if (desc != null &&
                      desc.isNotEmpty) // Conditionally render the description
                    Text(
                      desc,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.white, // Adjust color as needed
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        CarouselSlide(imageUrls: imageUrls), // Your CarouselSlide widget
      ],
    );
  }
}
