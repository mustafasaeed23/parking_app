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
  runApp(ParkingApp(
    appRouter: AppRouter(),
  ));
}
