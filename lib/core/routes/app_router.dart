import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parking_app/core/routes/routes.dart';
import 'package:parking_app/featuers/Auth/login_screen.dart';
import 'package:parking_app/featuers/Auth/register_screen.dart';
import 'package:parking_app/featuers/Home/screens/home_screen.dart';
import 'package:parking_app/featuers/maps/booking_screen.dart';
import 'package:parking_app/featuers/notifications/notifications_screen.dart';
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
          child: BookingScreen(),
        );

      case Routes.registerScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: RegisterScreen(),
        );
      case Routes.loginScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: LoginScreen(),
        );
      case Routes.notificationsScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: NotificationsScreen(),
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
