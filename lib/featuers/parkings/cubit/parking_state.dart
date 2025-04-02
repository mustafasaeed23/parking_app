class ParkingState {
  final int? selectedSpot;
  final Set<int>? bookedSpots;

  ParkingState({this.selectedSpot, Set<int>? bookedSpots})
      : bookedSpots = bookedSpots ?? {};

  ParkingState copyWith({int? selectedSpot, Set<int>? bookedSpots}) {
    return ParkingState(
      selectedSpot: selectedSpot,
      bookedSpots: bookedSpots ?? this.bookedSpots,
    );
  }
}
