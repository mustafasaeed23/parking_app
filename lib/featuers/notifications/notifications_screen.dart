import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_app/core/theme/Colors.dart';
import 'package:parking_app/core/theme/Styles.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الاشعارات",
          style: getBoldWhite15Style(),
        ),
        centerTitle: true,
        backgroundColor: AppColors.darkGreenColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                "يوم الاحد 10/10/2021",
                style: getMain16Style600().copyWith(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    backgroundColor: AppColors.goldColor,
                    child: Icon(
                      Icons.notification_add,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(
                      textAlign: TextAlign.end,
                      "لقد تم حجز مكان رقم 10 في موقف رقم 7",
                      style: getMain16Style600().copyWith(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    backgroundColor: AppColors.goldColor,
                    child: Icon(
                      Icons.notification_add,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(
                      textAlign: TextAlign.end,
                      "لقد تمت مغادرتك منذ 10 دقائق",
                      style: getMain16Style600().copyWith(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
