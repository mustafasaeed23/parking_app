import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_app/core/widgets/appbar_widget.dart';
import 'package:parking_app/featuers/parkings/screens/parking_screen_details.dart';
// import 'package:url_launcher/url_launcher.dart';

class ParkingListScreen extends StatelessWidget {
  final List<Map<String, String>> parkings = [
    {'name': 'موقف رقم 1', 'image': 'assets/IMG-20250204-WA0006.jpg'},
    {'name': 'موقف رقم 2', 'image': 'assets/IMG-20250204-WA0007.jpg'},
    {'name': 'موقف رقم 3', 'image': 'assets/IMG-20250204-WA0008.jpg'},
    {'name': 'موقف رقم 4', 'image': 'assets/IMG-20250204-WA0009.jpg'},
    {'name': 'موقف رقم 5', 'image': 'assets/IMG-20250204-WA0010.jpg'},
    {'name': 'موقف رقم 6', 'image': 'assets/IMG-20250204-WA0011.jpg'},
  ];

  ParkingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "المواقف"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: parkings.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 250.h,
                    child: Card(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              parkings[index]['image']!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          ListTile(
                            title: Text(parkings[index]['name']!),
                            trailing: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ParkingScreen(),
                                  ),
                                );
                              },
                              child: Text('View Spots'),
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

