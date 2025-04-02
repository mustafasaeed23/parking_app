import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/core/routes/app_router.dart';
import 'package:parking_app/firebase_options.dart';
import 'package:parking_app/parking_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('AIzaSyAs3jcGDsPndSNmUvGqleX3_XuLKJSjxUg'),
    androidProvider: AndroidProvider.debug,
  );
  // String? token = await FirebaseAppCheck.instance.getToken();
  // print("App Check Token: $token");
  runApp(ParkingApp(
    appRouter: AppRouter(),
  ));
}
