import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_app/core/theme/Styles.dart';

class CustomElevetedButton extends StatelessWidget {
  const CustomElevetedButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.textColor,
    required this.buttonColor,
    required this.width,
    required this.height,
    required this.borderColor,
  });

  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color buttonColor;
  final double width;
  final double height;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
          ),
          onPressed: onPressed,
          child: Text(
            text.tr(),
            style: getMain16Style600().copyWith(color: textColor),
          )),
    );
  }
}
