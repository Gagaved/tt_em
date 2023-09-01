import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tt_em/domain/model/hotel.dart';
import 'package:tt_em/domain/usecases/base_use_case.dart';
import 'package:tt_em/domain/usecases/get_hotel_use_case.dart';

part 'hotel_event.dart';

part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc()
      : super(
            const HotelState(isInit: false, hotel: null, errorMessage: null)) {
    on<HotelInitialEvent>(_initialEventHandler);
    add(HotelInitialEvent());
  }

  FutureOr<void> _initialEventHandler(
      HotelInitialEvent event, Emitter<HotelState> emit) async {
    var useCaseResult = await GetHotelUseCase().execute();
    switch (useCaseResult.error) {
      case UseCaseError.noError:
        var hotel = useCaseResult.resultValue!;
        var newState = state.copyWith(isInit: true, hotel: hotel);
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
