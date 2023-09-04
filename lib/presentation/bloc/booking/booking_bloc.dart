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
          allFieldsSetAndValid: false,
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
      allFieldsSetAndValid: false,
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
    emit(state.copyWith(touristsList: newTouristList));
    emit(state.copyWith(allFieldsSetAndValid: _isAllFieldSetAndValid()));
  }

  FutureOr<void> buttonPressHandler(
      BookingBuyButtonPressEvent event, Emitter<BookingState> emit) {
    if (!_isAllFieldSetAndValid()) {
      //какие то поля на странице не заданы и/или не валидны
      emit(state.copyWith(shouldHighlightEmptyFields: true));
    } else {
      //все поля на странице заданы и валидны
      //emit(state.copyWith(canBuy: true));
    }
  }

  FutureOr<void> _touristFormChangeEvent(
      BookingFormChangeEvent event, Emitter<BookingState> emit) {
    switch (event.formType) {
      case FormType.phoneNumber:
        _buyerPhoneNumber = event.formValue;
        break;
      case FormType.mail:
        _buyerMailNumber = event.formValue;
        break;
      case FormType.name:
        var changedTourist = state.touristsList[event.touristIndex!]
            .copyWith(name: event.formValue);
        var newTouristList = [...state.touristsList]..[event.touristIndex!] =
            changedTourist;
        var newState = state.copyWith(touristsList: newTouristList);
        emit(newState);
        break;
      case FormType.soname:
        var changedTourist = state.touristsList[event.touristIndex!]
            .copyWith(surname: event.formValue);
        var newTouristList = [...state.touristsList]..[event.touristIndex!] =
            changedTourist;
        var newState = state.copyWith(touristsList: newTouristList);
        emit(newState);
        break;
      case FormType.birthday:
        var changedTourist = state.touristsList[event.touristIndex!]
            .copyWith(birthDay: event.formValue);
        var newTouristList = [...state.touristsList]..[event.touristIndex!] =
            changedTourist;
        var newState = state.copyWith(touristsList: newTouristList);
        emit(newState);
        break;
      case FormType.citizenship:
        var changedTourist = state.touristsList[event.touristIndex!]
            .copyWith(citizenship: event.formValue);
        var newTouristList = [...state.touristsList]..[event.touristIndex!] =
            changedTourist;
        var newState = state.copyWith(touristsList: newTouristList);
        emit(newState);
        break;
      case FormType.passportNumber:
        var changedTourist = state.touristsList[event.touristIndex!]
            .copyWith(internationalPassportNumber: event.formValue);
        var newTouristList = [...state.touristsList]..[event.touristIndex!] =
            changedTourist;
        var newState = state.copyWith(touristsList: newTouristList);
        emit(newState);
        break;
      case FormType.passportDate:
        var changedTourist = state.touristsList[event.touristIndex!]
            .copyWith(passportValidityPeriod: event.formValue);
        var newTouristList = [...state.touristsList]..[event.touristIndex!] =
            changedTourist;
        var newState = state.copyWith(touristsList: newTouristList);
        emit(newState);
        break;
    }
    emit(state.copyWith(allFieldsSetAndValid: _isAllFieldSetAndValid()));
  }

  ///
  ///
  /// Простая проверка в блоке на заполненность полей. Со страницы приходят только валидные поля или пустые строки.
  /// Такая логика - временная, потому что это демо и реальная логика валидации отдельных полей должна быть здесь.
  bool _isAllFieldSetAndValid() {
    bool result =true;
    if (_buyerMailNumber == '' || _buyerPhoneNumber == '') result=  false;
    for (var tourist in state.touristsList) {
      if (tourist.name == '' ||
          tourist.surname == '' ||
          tourist.birthDay == '' ||
          tourist.citizenship == '' ||
          tourist.internationalPassportNumber == '' ||
          tourist.passportValidityPeriod == '') {
        result=  false;
      }
    }
    return result;
  }
}
