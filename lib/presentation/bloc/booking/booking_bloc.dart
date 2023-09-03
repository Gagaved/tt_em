import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tt_em/domain/model/booking_information.dart';
import 'package:tt_em/domain/model/tourist.dart';
import 'package:tt_em/domain/usecases/base_use_case.dart';
import 'package:tt_em/domain/usecases/get_booking_information_use_case.dart';

part 'booking_event.dart';

part 'booking_state.dart';



class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final int roomId;
  String _buyerPhoneNumber = '';
  String _buyerMailNumber = '';

  BookingBloc(this.roomId)
      : super(const BookingState(
          isInit: false,
          errorMessage: null,
          bookingInformation: null,
          touristsList: [
            Tourist(
                name: '',
                surname: '',
                birthDay: '',
                citizenship: '',
                internationalPassportNumber: '',
                passportValidityPeriod: ''),
          ],
          shouldHighlightEmptyFields: false,
        )) {
    on<BookingInitialEvent>(_initialEventHandler);
    on<BookingAddTouristEvent>(addTouristHandler);
    on<BookingDeleteTouristEvent>(deleteTouristHandler);
    on<BookingBuyButtonPressEvent>(buttonPressHandler);
    on<BookingFormChangeEvent>(_touristFormChangeEvent);
    add(BookingInitialEvent());
  }

  FutureOr<void> _initialEventHandler(
      BookingInitialEvent event, Emitter<BookingState> emit) async {
    var useCaseResult = await GetBookingInformationUseCase().execute(roomId);
    switch (useCaseResult.error) {
      case UseCaseError.noError:
        var bookingInformation = useCaseResult.resultValue;
        var totalPrice = bookingInformation!.serviceCharge +
            bookingInformation.fuelCharge +
            bookingInformation.tourPrice;
        var newState = state.copyWith(
            isInit: true,
            bookingInformation: bookingInformation,
            totalPrice: totalPrice);
        emit(newState);
        break;

      ///todo implement other error handlers
      default:
        var newState = state.copyWith(
            isInit: true, errorMessage: useCaseResult.errorMessage);
        emit(newState);
        break;
    }
  }

  FutureOr<void> addTouristHandler(
      BookingAddTouristEvent event, Emitter<BookingState> emit) {
    var newState = state.copyWith(
      shouldHighlightEmptyFields: false,
      touristsList: [
        ...state.touristsList,
        const Tourist(
            name: '',
            surname: '',
            birthDay: '',
            citizenship: '',
            internationalPassportNumber: '',
            passportValidityPeriod: ''),
      ],
    );
    emit(newState);
  }

  FutureOr<void> deleteTouristHandler(
      BookingDeleteTouristEvent event, Emitter<BookingState> emit) {
    final List<Tourist> newTouristList = [...state.touristsList];
    newTouristList.removeAt(event.touristIndex);
    var newState = state.copyWith(touristsList: newTouristList);
    emit(newState);
  }

  FutureOr<void> buttonPressHandler(
      BookingBuyButtonPressEvent event, Emitter<BookingState> emit) {
    // if (!_isAllFieldSet()) {
    //   emit(state.copyWith(shouldHighlightEmptyFields: true));
    // }
  }

  FutureOr<void> _touristFormChangeEvent(BookingFormChangeEvent event, Emitter<BookingState> emit) {
    switch(event.formType){
      case FormType.phoneNumber:
        _buyerPhoneNumber = event.formValue;
        break;
      case FormType.mail:
        _buyerMailNumber = event.formValue;
        break;
      case FormType.name:

        /// i should test this
        var changedTourist = state.touristsList[event.touristIndex!].copyWith(name: event.formValue);
        var newTouristList = [...state.touristsList]
          ..[event.touristIndex!]= changedTourist;
        var newState = state.copyWith(touristsList: newTouristList);
        emit(newState);
        break;
      case FormType.soname:
        break;
      case FormType.birthday:
        break;
      case FormType.citizenship:
        break;
      case FormType.passportNumber:
        break;
      case FormType.passportDate:
        break;
    }
  }
}
