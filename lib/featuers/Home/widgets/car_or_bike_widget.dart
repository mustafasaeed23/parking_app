import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_app/core/theme/Colors.dart';
import 'package:parking_app/core/theme/Styles.dart';

class CarOrBikeWidget extends StatelessWidget {
  const CarOrBikeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.spMax, vertical: 30.h),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.darkGreenColor, width: 1.5.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blueAccent, width: 2.w)),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25.r,
                  child: Icon(
                    Icons.directions_car,
                    color: Colors.blueAccent,
                    size: 30.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "سيارة",
                style: getMain16Style600().copyWith(
                  color: AppColors.blackColor,
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.orangeAccent, width: 2.w)),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25.r,
                  child: Icon(
                    Icons.electric_bike,
                    color: Colors.orangeAccent,
                    size: 30.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "دراجة نارية",
                style: getMain16Style600().copyWith(
                  color: AppColors.blackColor,
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.purple, width: 2.w)),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25.r,
                  child: Icon(
                    Icons.bus_alert,
                    color: Colors.purple,
                    size: 30.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "حافلة",
                style: getMain16Style600().copyWith(
                  color: AppColors.blackColor,
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
