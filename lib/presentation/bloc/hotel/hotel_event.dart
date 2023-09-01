part of 'hotel_bloc.dart';

abstract class HotelEvent extends Equatable {
  const HotelEvent();
}

class HotelInitialEvent extends HotelEvent{
  @override
  List<Object?> get props => [];

}