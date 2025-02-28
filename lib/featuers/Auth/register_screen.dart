import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parking_app/core/routes/routes.dart';
import 'package:parking_app/core/theme/Colors.dart';
import 'package:parking_app/core/theme/Styles.dart';
import 'package:parking_app/core/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: Text(
                    "تسجيل الدخول",
                    style: getMain16Style600().copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(
                    "من فضلك قم بملاء البيانات التالية",
                    style: getMain16Style600().copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.darkGreenColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25.r),
                          topLeft: Radius.circular(25.r),
                        )),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 25.0,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "اسم المستخدم",
                                    style: getMain16Style600().copyWith(
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomTextFormField(
                                    backgroundColor: AppColors.whiteColor,
                                    borderColor: AppColors.greyColor,
                                    borderWidth: 2,
                                    hintStyle: TextStyle(
                                      color: AppColors.blackColor,
                                    ),
                                    textColor: AppColors.blackColor,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "البريد الالكتروني",
                                    style: getMain16Style600().copyWith(
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomTextFormField(
                                    backgroundColor: AppColors.whiteColor,
                                    borderColor: AppColors.greyColor,
                                    borderWidth: 2,
                                    hintStyle: TextStyle(
                                      color: AppColors.blackColor,
                                    ),
                                    textColor: AppColors.blackColor,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "الهوية",
                                    style: getMain16Style600().copyWith(
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomTextFormField(
                                    backgroundColor: AppColors.whiteColor,
                                    borderColor: AppColors.greyColor,
                                    borderWidth: 2,
                                    hintStyle: TextStyle(
                                      color: AppColors.blackColor,
                                    ),
                                    textColor: AppColors.blackColor,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "كلمة المرور",
                                    style: getMain16Style600().copyWith(
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomTextFormField(
                                    backgroundColor: AppColors.whiteColor,
                                    borderColor: AppColors.greyColor,
                                    borderWidth: 2,
                                    hintStyle: TextStyle(
                                      color: AppColors.blackColor,
                                    ),
                                    textColor: AppColors.blackColor,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "تاكيد كلمة المرور",
                                    style: getMain16Style600().copyWith(
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomTextFormField(
                                    backgroundColor: AppColors.whiteColor,
                                    borderColor: AppColors.greyColor,
                                    borderWidth: 2,
                                    hintStyle: TextStyle(
                                      color: AppColors.blackColor,
                                    ),
                                    textColor: AppColors.blackColor,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        context.pushNamedTransition(
                                          routeName: Routes.loginScreen,
                                          type: PageTransitionType.fade,
                                        );
                                      },
                                      child: Text(
                                        "لديك حساب بالفعل ؟ دخول",
                                        style: getBoldWhite15Style().copyWith(
                                          color: AppColors.darkNavyColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 40.h,
                                      width: 180.w,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.goldColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                          ),
                                          onPressed: () =>
                                              Navigator.pushReplacementNamed(
                                                  context, Routes.homeScreen),
                                          child: Text(
                                            "تسجيل الدخول",
                                            style: getBoldWhite15Style()
                                                .copyWith(
                                                    color: AppColors.whiteColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.sp),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            )));
  }
}
