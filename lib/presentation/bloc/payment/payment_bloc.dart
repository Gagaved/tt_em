import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc()
      : super(
      const PaymentState(isInit: false, errorMessage: null)) {
    on<PaymentInitialEvent>(_initialEventHandler);
    add(PaymentInitialEvent());
  }

  FutureOr<void> _initialEventHandler(
      PaymentInitialEvent event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(isInit: true));
  }
}
