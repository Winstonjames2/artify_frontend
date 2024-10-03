import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSlide extends StatefulWidget {
  final List<String> imageUrls;
  CarouselSlide({required this.imageUrls});

  @override
  _CarouselSlideState createState() => _CarouselSlideState();
}

class _CarouselSlideState extends State<CarouselSlide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 150, // Adjust height as needed
          viewportFraction: 0.9, // Adjust for the number of items to be visible
          initialPage: 1,
          enableInfiniteScroll: false,
          autoPlay: false,
        ),
        items: [
          for (int i = 0; i < widget.imageUrls.length; i += 2)
            Builder(
              builder: (BuildContext context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // First image in the slide
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            widget.imageUrls[i],
                            fit: BoxFit.cover,
                            height: 250, // Adjust based on your design
                          ),
                        ),
                      ),
                    ),
                    // Second image in the slide (if it exists)
                    if (i + 1 < widget.imageUrls.length)
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              widget.imageUrls[i + 1],
                              fit: BoxFit.cover,
                              height: 250, // Adjust based on your design
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
        ],
      ),
    );
  }
}
