part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final bool isInit;
  final String? errorMessage;

  @override
  List<Object?> get props => [isInit];

  //<editor-fold desc="Data Methods">
  const PaymentState({
    required this.isInit,
    this.errorMessage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is PaymentState &&
              runtimeType == other.runtimeType &&
              isInit == other.isInit &&
              errorMessage == other.errorMessage);

  @override
  int get hashCode => isInit.hashCode ^ errorMessage.hashCode;

  @override
  String toString() {
    return 'PaymentState{' +
        ' isInit: $isInit,' +
        ' errorMessage: $errorMessage,' +
        '}';
  }

  PaymentState copyWith({
    bool? isInit,
    String? errorMessage,
  }) {
    return PaymentState(
      isInit: isInit ?? this.isInit,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isInit': this.isInit,
      'errorMessage': this.errorMessage,
    };
  }

  factory PaymentState.fromMap(Map<String, dynamic> map) {
    return PaymentState(
      isInit: map['isInit'] as bool,
      errorMessage: map['errorMessage'] as String,
    );
  }

//</editor-fold>
}