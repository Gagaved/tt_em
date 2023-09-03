import 'package:tt_em/domain/model/booking_information.dart';


///
/// Этот эктеншин используется только презентационным слоем.
/// Обычный кейс использования, это подставлять данные из этого объекта в скелетон во время загрузки и/или для тестирования UI
extension BookingInformationMockExtension on BookingInformation {
  static BookingInformation createMock() {
    return BookingInformation(
      id: 1,
      hotelName: 'Замоканный отель Замоканный отель Замоканный отель',
      hotelAddress: 'Замоканный адрес адрес адрес адрес адрес адрес',
      rating: 5,
      ratingName: 'Отлично',
      departure: 'Москва',
      arrivalCountry: 'Замоканная страна',
      tourDateStart: '2023-09-01',
      tourDateStop: '2023-09-10',
      numberOfNights: 9,
      room: 'Люкс',
      nutrition: 'Все включено',
      tourPrice: 2000,
      fuelCharge: 100,
      serviceCharge: 150,
    );
  }
}
