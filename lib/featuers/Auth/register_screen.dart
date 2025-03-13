import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parking_app/core/routes/routes.dart';
import 'package:parking_app/core/theme/Colors.dart';
import 'package:parking_app/core/theme/Styles.dart';
import 'package:parking_app/core/widgets/custom_text_form_field.dart';
import 'package:parking_app/featuers/Auth/bloc/authentication_bloc.dart';
import 'package:parking_app/featuers/Auth/bloc/authentication_event.dart';
import 'package:parking_app/featuers/Auth/bloc/authentication_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? selectedRole;
  final List<String> roles = ['طالب', 'دكتور'];

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
                child: CircularProgressIndicator(
              color: AppColors.goldColor,
            )),
          );
        } else if (state is Authenticated) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Routes.homeScreen);
        } else if (state is AuthenticationError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text(state.message, style: TextStyle(color: Colors.white))),
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40.h),
              Center(
                child: Text(
                  "تسجيل الدخول",
                  style:
                      getMain16Style600().copyWith(color: AppColors.blackColor),
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  "من فضلك قم بملاء البيانات التالية",
                  style:
                      getMain16Style600().copyWith(color: AppColors.blackColor),
                ),
              ),
              SizedBox(height: 40.h),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.darkGreenColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.r),
                      topLeft: Radius.circular(25.r),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 25.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          buildInputField("اسم المستخدم", usernameController),
                          buildInputField("البريد الالكتروني", emailController),
                          buildDropdownField("الهوية", roles, selectedRole,
                              (value) {
                            setState(() {
                              selectedRole = value;
                            });
                          }),
                          buildInputField("كلمة المرور", passwordController,
                              isPassword: true),
                          buildInputField(
                              "تاكيد كلمة المرور", confirmPasswordController,
                              isPassword: true),
                          SizedBox(height: 20.h),
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
                          SizedBox(height: 30.h),
                          Center(
                            child: SizedBox(
                              height: 40.h,
                              width: 180.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.goldColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                                onPressed: () {
                                  if (passwordController.text !=
                                      confirmPasswordController.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("كلمات المرور غير متطابقة"),
                                      ),
                                    );
                                    return;
                                  }
                                  if (selectedRole == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("يرجى اختيار الدور"),
                                      ),
                                    );
                                    return;
                                  }
                                  context.read<AuthenticationBloc>().add(
                                        SignUpEvent(
                                          email: emailController.text.trim(),
                                          password: passwordController.text,
                                          role: selectedRole!,
                                          confirmPassword:
                                              confirmPasswordController.text,
                                          userName: usernameController.text,
                                        ),
                                      );
                                },
                                child: Text(
                                  "تسجيل الدخول",
                                  style: getBoldWhite15Style().copyWith(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label,
            style: getMain16Style600().copyWith(color: AppColors.blackColor)),
        SizedBox(height: 10.h),
        CustomTextFormField(
          controller: controller,
          obscureText: isPassword,
          backgroundColor: AppColors.whiteColor,
          borderColor: AppColors.greyColor,
          borderWidth: 2,
          hintStyle: TextStyle(color: AppColors.blackColor),
          textColor: AppColors.blackColor,
        ),
        SizedBox(height: 10.h),
      ],
    );
  }

  Widget buildDropdownField(
    String label,
    List<String> items,
    String? selectedItem,
    ValueChanged<String?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label,
            style: getMain16Style600().copyWith(color: AppColors.blackColor)),
        SizedBox(height: 10.h),
        DropdownButtonFormField<String>(
          value: selectedItem,
          items: items
              .map((role) => DropdownMenuItem(value: role, child: Text(role)))
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.whiteColor,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
