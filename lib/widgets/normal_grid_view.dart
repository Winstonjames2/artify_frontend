import 'package:flutter/material.dart';
import '../services/colors.dart'; // Adjust the import according to your project structure

class NormalGridView extends StatelessWidget {
  final List<String> featuredItemsImages;

  const NormalGridView({super.key, required this.featuredItemsImages});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Featured Items',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.builder(
            shrinkWrap:
                true, // Ensures that GridView doesn't take infinite height
            physics:
                const NeverScrollableScrollPhysics(), // Prevents nested scrolling conflicts
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two items per row
              crossAxisSpacing: 25.0, // Spacing between items horizontally
              mainAxisSpacing: 25.0, // Spacing between items vertically
              childAspectRatio: 1.25, // Adjusts item size (width/height ratio)
            ),
            itemCount: featuredItemsImages.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(featuredItemsImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
