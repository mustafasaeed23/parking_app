import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_app/core/routes/routes.dart';
import 'package:parking_app/core/theme/Colors.dart';
import 'package:parking_app/core/theme/Styles.dart';
import 'package:parking_app/core/widgets/custom_eleveted_button.dart';
import 'package:parking_app/core/widgets/drawer_item.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        width: 55.w,
        color: Colors.white24,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/logo-removebg-preview.png",
                  width: 80.w,
                  height: 80.h,
                  fit: BoxFit.contain,
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                  iconSize: 30.sp,
                  color: AppColors.greyColor,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            DrawerItem(
              imagePath: "assets/icons/notifications.svg",
              title: "Notifications",
              onTap: () {
                // Navigator.of(context).pushNamed(Routes.notificationsScreen);
              },
            ),
            DrawerItem(
              imagePath: "assets/icons/google-maps.svg",
              title: "Maps",
              onTap: () {
                Navigator.of(context).pushNamed(Routes.mapsScreen);
              },
            ),
            DrawerItem(
              imagePath: "assets/icons/language.svg",
              title: "Language",
              onTap: () {
                // Navigator.of(context).pushNamed(Routes.languageScreen);
              },
            ),
            DrawerItem(
              imagePath: "assets/icons/settings-sharp.svg",
              title: "Settings",
              onTap: () {
                // Navigator.of(context).pushNamed(Routes.settingsScreen);
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomElevetedButton(
                      onPressed: () {},
                      text: "Register".tr(),
                      textColor: AppColors.greyColor,
                      buttonColor: AppColors.whiteColor,
                      width: 70,
                      borderColor: Colors.grey,
                      height: 40,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: CustomElevetedButton(
                      onPressed: () {},
                      text: "Login".tr(),
                      textColor: AppColors.greyColor,
                      buttonColor: AppColors.whiteColor,
                      width: 70,
                      height: 40,
                      borderColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Divider(
                height: 5.h,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.call,
                    size: 25.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "Contact us",
                    style: getMediumGrey13(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Divider(
                height: 5.h,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
