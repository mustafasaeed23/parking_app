import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_app/core/theme/Styles.dart';
import 'package:parking_app/core/widgets/appbar_widget.dart';
import 'package:parking_app/featuers/parkings/cubit/parking_cubit.dart';
import 'package:parking_app/featuers/parkings/cubit/parking_state.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return BlocProvider(
      create: (context) => ParkingCubit(),
      child: Scaffold(
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
                child: BlocBuilder<ParkingCubit, ParkingState>(
                  builder: (context, state) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        bool isOccupied = state.bookedSpots!.contains(index);
                        bool isSelected = state.selectedSpot == index;

                        return GestureDetector(
                          onTap: isOccupied
                              ? null
                              : () {
                                  context
                                      .read<ParkingCubit>()
                                      .selectSpot(index);
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  BlocBuilder<ParkingCubit, ParkingState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state.selectedSpot != null
                            ? () =>
                                context.read<ParkingCubit>().confirmBooking(context)
                            : null,
                        child: Text('تأكيد الحجز'), 
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () async {
                      const url = "https://maps.app.goo.gl/9tjTwH4tw4xyA6bYA";
                      await launchUrl(Uri.parse(url));
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
      ),
    );
  }
}
