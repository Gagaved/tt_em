part of 'hotel_bloc.dart';

class HotelState extends Equatable {
  final bool isInit;
  final String? errorMessage;
  final Hotel? hotel;

  @override
  List<Object?> get props => [isInit];

  const HotelState({
    required this.isInit,
    required this.hotel,
    required this.errorMessage
  });

  HotelState copyWith({
    bool? isInit,
    String? errorMessage,
    Hotel? hotel,
  }) {
    return HotelState(
      isInit: isInit ?? this.isInit,
      errorMessage: errorMessage,
      hotel: hotel ?? this.hotel,
    );
  }
}