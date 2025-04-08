import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_app/core/theme/Styles.dart';
import 'package:parking_app/core/widgets/appbar_widget.dart';
import 'package:parking_app/core/widgets/search_widget.dart';
import 'package:parking_app/featuers/Home/widgets/car_or_bike_widget.dart';
import 'package:parking_app/featuers/Home/widgets/nearby_parking.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "الرئيسية",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 25.h,
              ),
              // SearchWidget(),
              SizedBox(
                height: 40.h,
              ),
              CarOrBikeWidget(),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "الحجوزات ألأكثر خدمة",
                style: getMain16Style600().copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 15.h,
              ),
              NearbyParking(
                spotId: "1",
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              NearbyParking(
                spotId: "2",
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              NearbyParking(
                spotId: "3",
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
