part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();
}
class BookingInitialEvent extends BookingEvent{
  @override
  List<Object?> get props => [];
}

class BookingAddTouristEvent extends BookingEvent{
  @override
  List<Object?> get props => [];

}
class BookingDeleteTouristEvent extends BookingEvent{
  final int touristIndex;

  const BookingDeleteTouristEvent(this.touristIndex);
  @override
  List<Object?> get props => [touristIndex];
}

class BookingBuyButtonPressEvent extends BookingEvent{
  @override
  List<Object?> get props => [];
}


enum FormType{
  phoneNumber,
  mail,
  name,
  soname,
  birthday,
  citizenship,
  passportNumber,
  passportDate,
}

class BookingFormChangeEvent extends BookingEvent{
  final FormType formType;
  final int? touristIndex;
  final String formValue;
  const BookingFormChangeEvent({required this.formValue,this.touristIndex,required this.formType});
  @override
  List<Object?> get props => [formType,touristIndex,formValue];
}

