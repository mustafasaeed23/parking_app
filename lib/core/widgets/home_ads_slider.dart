import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_app/core/theme/Colors.dart';

class HomeCarouselAdsWidget extends StatefulWidget {
  const HomeCarouselAdsWidget({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HomeCarouselAdsWidgetState createState() => _HomeCarouselAdsWidgetState();
}

class _HomeCarouselAdsWidgetState extends State<HomeCarouselAdsWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Hardcoded image path
    final List<String> images = [
      "assets/images/ads.png",
      "assets/images/ads.png",
      "assets/images/ads.png",
    ];

    return Column(
      children: [
        CarouselSlider(
          items: images.map((imagePath) {
            return Center(
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => setState(() {
                _currentIndex = entry.key;
              }),
              child: Container(
                width: 10.w,
                height: 10.h,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? AppColors.mainColor
                      : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
