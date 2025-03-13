import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parking_app/core/routes/routes.dart';
import 'package:parking_app/core/theme/Colors.dart';
import 'package:parking_app/core/theme/Styles.dart';
import 'package:parking_app/core/widgets/custom_text_form_field.dart';
import 'package:parking_app/featuers/Auth/bloc/authentication_bloc.dart';
import 'package:parking_app/featuers/Auth/bloc/authentication_event.dart';
import 'package:parking_app/featuers/Auth/bloc/authentication_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تسجيل الدخول",
          style: getBoldWhite15Style(),
        ),
        centerTitle: true,
        backgroundColor: AppColors.darkGreenColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        )),
        toolbarHeight: 90.h,
      ),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is Authenticated) {
            context.read<AuthenticationBloc>().add(
                  FetchUserEvent(
                    userId: state.userId,
                  ),
                );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Login Successful!"),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );

            context.pushNamedTransition(
              routeName: Routes.homeScreen,
              type: PageTransitionType.fade,
            );
          }
        },
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "مرحبا بك ",
                    style: getMain16Style600().copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "من فضلك ادخل بياناتك الشخصية",
                    style: getMain16Style600().copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Card(
                    color: AppColors.darkGreenColor,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextFormField(
                            controller: emailController,
                            textAlign: TextAlign.right,
                            backgroundColor: AppColors.whiteColor,
                            labelText: "البريد الالكتروني",
                            keyboardType: TextInputType.name,
                            prefixIcon: Icon(
                              Icons.email,
                              color: AppColors.blackColor,
                            ),
                            textColor:
                                Colors.black, // Ensure user input is black
                          ),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            controller: passwordController,
                            backgroundColor: AppColors.whiteColor,
                            labelText: "كلمة المرور",
                            obscureText: true,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColors.blackColor,
                            ),
                            textColor:
                                Colors.black, // Ensure user input is black
                          ),
                          SizedBox(height: 20.h),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // context.pushNamedTransition(
                                //   routeName: Routes.homeScreen,
                                //   type: PageTransitionType.fade,
                                // );
                                print(
                                    "Email: '${emailController.text.trim()}'");

                                context.read<AuthenticationBloc>().add(
                                      SignInEvent(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.goldColor,
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Text(
                                "تسجيل الدخول",
                                style: getMain16Style600().copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1.5,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/logo-google.svg",
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "التسجيل بواسطة جوجل",
                        style: getMain16Style600().copyWith(
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
