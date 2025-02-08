import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_app/core/theme/Colors.dart';
import 'package:parking_app/core/theme/Styles.dart';


class ActiveCompanies extends StatelessWidget {
  const ActiveCompanies({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> companies = [
      {"logo": "assets/images/logo-removebg-preview.png", "name": "SCG"},
      {"logo": "assets/images/logo-removebg-preview.png", "name": "SCG"},
      {"logo": "assets/images/logo-removebg-preview.png", "name": "SCG"},
      {"logo": "assets/images/logo-removebg-preview.png", "name": "SCG"},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Active Compaines",
            style: getMain16Style600(),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 170.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: Colors.grey.shade200, width: 2.5),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 1,
                    spreadRadius: 0,
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0, 0)),
              ]),
          child: CarouselSlider(
            items: companies.map((company) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Image.asset(company["logo"]!),
                      ),
                      Positioned(
                          top: 1,
                          child: Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(15.r)),
                            child: Icon(
                              Icons.star,
                              color: AppColors.yellowColor,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    company["name"]!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            }).toList(),
            options: CarouselOptions(
              height: 200,
              autoPlay: false,
              // aspectRatio: 0.9,
              viewportFraction: 0.3,
            ),
          ),
        ),
      ],
    );
  }
}
