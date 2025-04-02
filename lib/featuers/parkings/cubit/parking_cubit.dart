import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // For formatting time
import 'package:parking_app/featuers/parkings/cubit/parking_state.dart';

class ParkingCubit extends Cubit<ParkingState> {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  ParkingCubit() : super(ParkingState(bookedSpots: {})) {
    _fetchBookedSpots();
  }

  void _fetchBookedSpots() {
    firebaseFirestore.collection("parking_spots").doc('spots').snapshots().listen((doc) {
      if (doc.exists) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        final List<dynamic> bookedList = data['bookedSpots'] ?? [];
        final Map<String, dynamic> bookingTimes = data['bookingTimes'] ?? {};

        // Check for expired bookings and update Firestore
        final now = DateTime.now();
        bookedList.removeWhere((spot) {
          final endTime = bookingTimes[spot.toString()];
          if (endTime != null) {
            DateTime parsedEndTime = DateTime.parse(endTime);
            return now.isAfter(parsedEndTime); // If current time is after the end time, remove booking
          }
          return false;
        });

        firebaseFirestore.collection("parking_spots").doc('spots').update({
          'bookedSpots': bookedList,
        });

        emit(state.copyWith(bookedSpots: bookedList.cast<int>().toSet()));
      }
    });
  }

  void selectSpot(int index) {
    emit(state.copyWith(selectedSpot: index));
  }

  Future<void> confirmBooking(BuildContext context) async {
    if (state.selectedSpot != null) {
      final selectedSpot = state.selectedSpot!;
      
      // Show a Time Picker Dialog
      TimeOfDay? startTime = await _pickTime(context, "اختر وقت البداية");
      if (startTime == null) return;
      TimeOfDay? endTime = await _pickTime(context, "اختر وقت الانتهاء");
      if (endTime == null) return;

      // Convert TimeOfDay to DateTime for Firestore storage
      final now = DateTime.now();
      final DateTime startDateTime = DateTime(now.year, now.month, now.day, startTime.hour, startTime.minute);
      final DateTime endDateTime = DateTime(now.year, now.month, now.day, endTime.hour, endTime.minute);

      final updatedBookedSpots = Set<int>.from(state.bookedSpots ?? {})..add(selectedSpot);

      await firebaseFirestore.collection("parking_spots").doc('spots').set({
        'bookedSpots': updatedBookedSpots.toList(),
        'bookingTimes': {
          selectedSpot.toString(): endDateTime.toIso8601String(), // Store as String
        }
      }, SetOptions(merge: true)); // Merge with existing data

      emit(state.copyWith(
        bookedSpots: updatedBookedSpots,
        selectedSpot: null,
      ));
    }
  }

  Future<TimeOfDay?> _pickTime(BuildContext context, String title) async {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: title,
    );
  }
}
