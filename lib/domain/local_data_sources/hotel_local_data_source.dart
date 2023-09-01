import 'package:tt_em/domain/model/booking_information.dart';

abstract interface class BookingInformationLocalDataSource {
  void setBookingInformationData(BookingInformation information);

  BookingInformation? getBookingInformationData();
}

class BookingInformationLocalDataSourceImpl implements BookingInformationLocalDataSource {
  BookingInformation? _information;

  @override
  BookingInformation? getBookingInformationData() => _information;

  @override
  void setBookingInformationData(BookingInformation information) => _information = information;
}
