part of 'booking_bloc.dart';

class BookingState extends Equatable {
  final bool isInit;
  final String? errorMessage;
  final BookingInformation? bookingInformation;

  @override
  List<Object?> get props => [isInit, errorMessage, bookingInformation];

  const BookingState({
    required this.isInit,
    this.errorMessage,
    required this.bookingInformation,
  });

  BookingState copyWith({
    bool? isInit,
    String? errorMessage,
    BookingInformation? bookingInformation,
  }) {
    return BookingState(
      isInit: isInit ?? this.isInit,
      errorMessage: errorMessage ?? this.errorMessage,
      bookingInformation: bookingInformation ?? this.bookingInformation,
    );
  }
}