part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();
}
class PaymentInitialEvent extends PaymentEvent{
  @override
  List<Object?> get props => [];

}