import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parking_app/core/routes/routes.dart';
import 'package:parking_app/core/theme/Colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // @override
    // void initState() {
    //   super.initState();
    //   Timer(const Duration(seconds: 10), () {
    //     Navigator.pushReplacementNamed(context, Routes.homeScreen);
    //   });
    // }

    return Scaffold(
      backgroundColor: AppColors.goldColor,
    );
  }
}
