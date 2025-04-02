import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_app/core/widgets/appbar_widget.dart';
import 'package:parking_app/featuers/Home/widgets/nearby_parking.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "الحجزات"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser?.uid) // Get current user
              .collection("bookings") // Subcollection for user bookings
              .orderBy("bookingTime",
                  descending: true) // Sort by latest booking
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator()); // Loading indicator
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("لا يوجد حجوزات سابقة"));
            }

            final bookings = snapshot.data!.docs;

            return ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                final int spotId = booking['spotId'];
                final Timestamp time =
                    booking['bookingTime']; // Firebase Timestamp
                final DateTime bookingDateTime =
                    time.toDate(); // Convert to DateTime

                return Column(
                  children: [
                    NearbyParking(
                      spotId: spotId.toString(),
                      bookingtime: bookingDateTime.toString(),
                    ),
                    SizedBox(height: 20.h),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
