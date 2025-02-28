import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_app/core/theme/Styles.dart';
import 'package:parking_app/core/widgets/appbar_widget.dart';
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

class ParkingScreen extends StatefulWidget {
  const ParkingScreen({super.key});

  @override
  _ParkingScreenState createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {
  List<bool> occupiedSpots = [
    false,
    true,
    false,
    false,
    true,
    false,
    true,
    false,
    false,
    true
  ];
  int? selectedSpot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "احجز موقف"),
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 14.w,
                height: 14.h,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.r)),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "غير شاغر",
                style: getMediumGrey13().copyWith(color: Colors.black),
              ),
              SizedBox(
                width: 15.w,
              ),
              Container(
                width: 14.w,
                height: 14.h,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.r)),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "تم الحجز",
                style: getMediumGrey13().copyWith(color: Colors.black),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 14.w,
                height: 14.h,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.r)),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "غير شاغر",
                style: getMediumGrey13().copyWith(color: Colors.black),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: occupiedSpots.length,
                itemBuilder: (context, index) {
                  bool isOccupied = occupiedSpots[index];
                  bool isSelected = selectedSpot == index;

                  return GestureDetector(
                    onTap: isOccupied
                        ? null
                        : () {
                            setState(() {
                              selectedSpot = index;
                            });
                          },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isOccupied
                            ? Colors.red
                            : isSelected
                                ? Colors.blue
                                : Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Spot ${index + 1}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: selectedSpot != null
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'You selected Spot ${selectedSpot! + 1}')),
                          );
                        }
                      : null,
                  child: Text('Confirm Selection'),
                ),
                TextButton(
                  onPressed: () async {
                    // const url = 'https://www.google.com/maps/search/?api=1&query=parking';
                    // if (await canLaunch(url)) {
                    //   await launch(url);
                    // } else {
                    //   throw 'Could not launch $url';
                    // }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.black,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'أفتح الموقع علي Google Maps',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
