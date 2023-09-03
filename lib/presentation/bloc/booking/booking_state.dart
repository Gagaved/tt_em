part of 'booking_bloc.dart';

class BookingState extends Equatable {
  final bool isInit;
  final String? errorMessage;
  final BookingInformation? bookingInformation;
  final int? totalPrice;
  final List<Tourist> touristsList;
  final bool shouldHighlightEmptyFields;
  @override
  List<Object?> get props => [isInit, errorMessage, bookingInformation,touristsList,shouldHighlightEmptyFields];

//<editor-fold desc="Data Methods">
  const BookingState({
    required this.isInit,
    this.errorMessage,
    this.bookingInformation,
    this.totalPrice,
    required this.touristsList,
    required this.shouldHighlightEmptyFields,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookingState &&
          runtimeType == other.runtimeType &&
          isInit == other.isInit &&
          errorMessage == other.errorMessage &&
          bookingInformation == other.bookingInformation &&
          totalPrice == other.totalPrice &&
          touristsList == other.touristsList &&
          shouldHighlightEmptyFields == other.shouldHighlightEmptyFields);

  @override
  int get hashCode =>
      isInit.hashCode ^
      errorMessage.hashCode ^
      bookingInformation.hashCode ^
      totalPrice.hashCode ^
      touristsList.hashCode ^
      shouldHighlightEmptyFields.hashCode;

  @override
  String toString() {
    return 'BookingState{' +
        ' isInit: $isInit,' +
        ' errorMessage: $errorMessage,' +
        ' bookingInformation: $bookingInformation,' +
        ' totalPrice: $totalPrice,' +
        ' touristsList: $touristsList,' +
        ' shouldHighlightEmptyFields: $shouldHighlightEmptyFields,' +
        '}';
  }

  BookingState copyWith({
    bool? isInit,
    String? errorMessage,
    BookingInformation? bookingInformation,
    int? totalPrice,
    List<Tourist>? touristsList,
    bool? shouldHighlightEmptyFields,
  }) {
    return BookingState(
      isInit: isInit ?? this.isInit,
      errorMessage: errorMessage ?? this.errorMessage,
      bookingInformation: bookingInformation ?? this.bookingInformation,
      totalPrice: totalPrice ?? this.totalPrice,
      touristsList: touristsList ?? this.touristsList,
      shouldHighlightEmptyFields:
          shouldHighlightEmptyFields ?? this.shouldHighlightEmptyFields,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isInit': this.isInit,
      'errorMessage': this.errorMessage,
      'bookingInformation': this.bookingInformation,
      'totalPrice': this.totalPrice,
      'touristsList': this.touristsList,
      'shouldHighlightEmptyFields': this.shouldHighlightEmptyFields,
    };
  }

  factory BookingState.fromMap(Map<String, dynamic> map) {
    return BookingState(
      isInit: map['isInit'] as bool,
      errorMessage: map['errorMessage'] as String,
      bookingInformation: map['bookingInformation'] as BookingInformation,
      totalPrice: map['totalPrice'] as int,
      touristsList: map['touristsList'] as List<Tourist>,
      shouldHighlightEmptyFields: map['shouldHighlightEmptyFields'] as bool,
    );
  }

//</editor-fold>
}
