import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parking_app/core/routes/routes.dart';
import 'package:parking_app/featuers/Auth/auth_screen.dart';
import 'package:parking_app/featuers/Home/home_screen.dart';
import 'package:parking_app/featuers/maps/maps_screen.dart';
import 'package:parking_app/featuers/splash/splash_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: HomeScreen(),
        );

      case Routes.mapsScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: MapsScreen(),
        );

      case Routes.authScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: AuthScreen(),
        );

      case Routes.splashScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: SplashScreen(),
        );

      // case Routes.homeScreen:
      default:
        return PageTransition(
          type: PageTransitionType.fade,
          child: HomeScreen(),
        );
    }
  }
}
