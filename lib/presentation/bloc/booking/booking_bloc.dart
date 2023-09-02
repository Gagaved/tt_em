import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tt_em/domain/model/booking_information.dart';
import 'package:tt_em/domain/usecases/base_use_case.dart';
import 'package:tt_em/domain/usecases/get_booking_information_use_case.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final int roomId;
  BookingBloc(this.roomId)
      : super(const BookingState(
      isInit: false, errorMessage: null, bookingInformation: null)) {
    on<BookingInitialEvent>(_initialEventHandler);
    add(BookingInitialEvent());
  }

  FutureOr<void> _initialEventHandler(
      BookingInitialEvent event, Emitter<BookingState> emit) async {
    var useCaseResult = await GetBookingInformationUseCase().execute(roomId);
    switch (useCaseResult.error) {
      case UseCaseError.noError:
        var newState = state.copyWith(isInit: true, bookingInformation: useCaseResult.resultValue);
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
}
