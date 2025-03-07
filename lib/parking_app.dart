import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_app/core/routes/app_router.dart';
import 'package:parking_app/core/routes/routes.dart';

class ParkingApp extends StatefulWidget {
  const ParkingApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  State<ParkingApp> createState() => _ParkingAppState();
}

class _ParkingAppState extends State<ParkingApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Parking App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: widget.appRouter.generateRoute,
          initialRoute: Routes.splashScreen,
        );
      },
    );
  }
}
