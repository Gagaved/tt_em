import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tt_em/domain/model/hotel.dart';
import 'package:tt_em/domain/model/room.dart';
import 'package:tt_em/domain/usecases/base_use_case.dart';
import 'package:tt_em/domain/usecases/get_rooms_use_case.dart';

part 'rooms_event.dart';

part 'rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final Hotel hotel;
  RoomsBloc(this.hotel)
      : super(RoomsState(
            isInit: false, hotel: hotel, errorMessage: null, rooms: null)) {
    on<RoomsInitialEvent>(_initialEventHandler);
    add(RoomsInitialEvent());
  }

  FutureOr<void> _initialEventHandler(
      RoomsInitialEvent event, Emitter<RoomsState> emit) async {
    var useCaseResult = await GetRoomsByHotelIdUseCase().execute(hotel.id);
    switch (useCaseResult.error) {
      case UseCaseError.noError:
        var newState = state.copyWith(isInit: true, rooms: useCaseResult.resultValue);
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
