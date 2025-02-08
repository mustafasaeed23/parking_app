import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parking_app/core/theme/Colors.dart';
import 'package:parking_app/core/theme/Styles.dart';


class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.onTap});

  final String imagePath;
  final String title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    title.tr(),
                    style: getMain16Style600().copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 4,
                  child: SvgPicture.asset(
                    imagePath,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
