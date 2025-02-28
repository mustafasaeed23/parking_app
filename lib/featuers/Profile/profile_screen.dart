import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_app/core/theme/Styles.dart';
import 'package:parking_app/core/widgets/appbar_widget.dart';
import 'package:parking_app/core/widgets/custom_text_form_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "الملف الشخصي"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "اسم المستخدم",
                style: getMediumGrey13()
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                backgroundColor: Colors.grey[200],
                borderColor: Colors.grey.shade100,
                hintText: "مصطفي محمد",
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "البريد الإلكتروني",
                style: getMediumGrey13()
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                backgroundColor: Colors.grey[200],
                borderColor: Colors.grey.shade100,
                hintText: "mustafa@gmail.com",
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "رقم الهاتف",
                style: getMediumGrey13()
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                backgroundColor: Colors.grey[200],
                borderColor: Colors.grey.shade100,
                hintText: "01205542394",
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "الهوية",
                style: getMediumGrey13()
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                backgroundColor: Colors.grey[200],
                borderColor: Colors.grey.shade100,
                hintText: "طالب",
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
