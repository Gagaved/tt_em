import 'package:equatable/equatable.dart';
import 'package:tt_em/domain/model/hotel.dart';
import 'package:tt_em/domain/model/room.dart';

class BookingInformation extends Equatable {
  final Hotel? hotel;
  final Room? room;

  @override
  List<Object?> get props => [hotel,room];

//<editor-fold desc="Data Methods">
  const BookingInformation({
    this.hotel,
    this.room,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookingInformation &&
          runtimeType == other.runtimeType &&
          hotel == other.hotel &&
          room == other.room);

  @override
  int get hashCode => hotel.hashCode ^ room.hashCode;

  @override
  String toString() {
    return 'BookingInformation{' + ' hotel: $hotel,' + ' room: $room,' + '}';
  }

  BookingInformation copyWith({
    Hotel? hotel,
    Room? room,
  }) {
    return BookingInformation(
      hotel: hotel ?? this.hotel,
      room: room ?? this.room,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hotel': this.hotel,
      'room': this.room,
    };
  }

  factory BookingInformation.fromMap(Map<String, dynamic> map) {
    return BookingInformation(
      hotel: map['hotel'] as Hotel,
      room: map['room'] as Room,
    );
  }

//</editor-fold>
}