import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_app/core/theme/Colors.dart';
import 'package:parking_app/core/theme/Styles.dart';
import 'package:parking_app/core/widgets/appbar_widget.dart';
import 'package:parking_app/core/widgets/nav_bar_icon.dart';
import 'package:parking_app/featuers/Home/screens/home_tab.dart';
import 'package:parking_app/featuers/Profile/profile_screen.dart';
import 'package:parking_app/featuers/maps/booking_screen.dart';
import 'package:parking_app/featuers/parkings/screens/parkings_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomeTab(), // Home Page
    ParkingListScreen(),
    BookingScreen(),
    ProfileScreen(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(15.r),
          topEnd: Radius.circular(15.r),
        ),
        child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  offset: Offset(0, -6),
                  blurRadius: 6,
                  blurStyle: BlurStyle.outer,
                  color: AppColors.greyColor,
                ),
              ]),
              child: BottomNavigationBar(
                  backgroundColor: const Color(0xff1A1A1A).withOpacity(0.5),
                  onTap: (index) => setState(() => _currentIndex = index),
                  showUnselectedLabels: true,
                  items: [
                    BottomNavigationBarItem(
                      backgroundColor: AppColors.darkGreenColor,
                      icon: NavBarIcon(
                          iconData: Icons.home, isSelected: _currentIndex == 0),
                      label: "الرئيسية",
                    ),
                    BottomNavigationBarItem(
                      icon: NavBarIcon(
                          iconData: Icons.local_parking,
                          isSelected: _currentIndex == 1),
                      label: "المواقف",
                    ),
                    BottomNavigationBarItem(
                      icon: NavBarIcon(
                          iconData: Icons.electric_car,
                          isSelected: _currentIndex == 2),
                      label: "الحجوزات",
                    ),
                    BottomNavigationBarItem(
                      icon: NavBarIcon(
                          iconData: Icons.person,
                          isSelected: _currentIndex == 3),
                      label: "الملف الشخصي",
                    ),
                  ]),
            )),
      ),
      body: _tabs[_currentIndex],
    );
  }
}
