part of 'rooms_bloc.dart';

class RoomsState extends Equatable {
  final bool isInit;
  final String? errorMessage;
  final Hotel? hotel;
  final List<Room>? rooms;

  @override
  List<Object?> get props => [isInit, errorMessage, hotel, rooms];

  const RoomsState({
    required this.isInit,
    this.errorMessage,
    this.hotel,
    required this.rooms,
  });

  RoomsState copyWith({
    bool? isInit,
    String? errorMessage,
    Hotel? hotel,
    List<Room>? rooms,
  }) {
    return RoomsState(
      isInit: isInit ?? this.isInit,
      errorMessage: errorMessage ?? this.errorMessage,
      hotel: hotel ?? this.hotel,
      rooms: rooms ?? this.rooms,
    );
  }
}