import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_app/core/theme/Colors.dart';
import 'package:parking_app/core/theme/Styles.dart';

class NearbyParking extends StatelessWidget {
  const NearbyParking({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            "assets/IMG-20250204-WA0006.jpg",
            width: 70.w,
            height: 70.h,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "موقف رقم 1 : موقع السيارة",
                  style: getMain16Style600().copyWith(
                    color: AppColors.mainColor,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  "12 - 3 - 2023",
                  style: getMain16Style600().copyWith(
                    color: Colors.black,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  "10:00 - 12:00 صباحا",
                  style: getMain16Style600().copyWith(
                    color: Colors.black,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),

          ),
        ],
      ),
    );
  }
}
