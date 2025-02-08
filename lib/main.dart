import 'package:flutter/material.dart';
import 'package:parking_app/core/routes/app_router.dart';
import 'package:parking_app/featuers/parking_app.dart';

void main() {
  runApp(
    ParkingApp(
      appRouter: AppRouter(),
    ),
  );
}
