import 'package:flutter/material.dart';
// import '../../services/colors.dart'; // Adjust this import based on your project structure
import '../../widgets/categroy_view.dart'; // Import your CategoryView file
import '../../widgets/normal_grid_view.dart'; // Import your NormalGridView file
import '../../widgets/small_carousel_slide.dart'; // Import your SmallCarouselSlide file

class LoggedInView extends StatelessWidget {
  final List<String> featuredItemsImages = [
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
  ];

  final List<String> categories = [
    'Home Decor',
    'Jewelry',
    'Art',
    'Fashion',
    'Toys',
    'Vintage',
    'Craft Supplies',
    'More',
  ];

  final List<String> recentlyViewed = [
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msOP5.img',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recently Viewed Items Section
          if (recentlyViewed.isNotEmpty)
            SmallCarouselSlide(
              title: 'Recently Viewed',
              recentlyViewed: recentlyViewed,
            ),
          SizedBox(height: 15),

          CategoryView(title: 'Shop by Categorys', categories: categories),
          SizedBox(height: 15),

          // Featured Items Grid View
          NormalGridView(featuredItemsImages: featuredItemsImages),

          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
