import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parking_app/core/routes/routes.dart';
import 'package:parking_app/core/theme/Colors.dart';
import 'package:parking_app/core/theme/Styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    required this.title,
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        GestureDetector(
          onTap: () {
            // context.pushNamedTransition(
            //     routeName: Routes.notificationsScreen,
            //     type: PageTransitionType.fade);
          },
          child: Container(
            margin: EdgeInsets.only(right: 20.w),
            child: Container(
              width: 40.w,
              height: 35.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.goldColor,
              ),
              child: Icon(
                Icons.notifications,
                color: AppColors.whiteColor,
                size: 30,
              ),
            ),
          ),
        )
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
      ),
      toolbarHeight: 120.h,
      backgroundColor: AppColors.darkGreenColor,
      title: Text(
        title,
        style: getBoldWhite15Style(),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120.h);
}
