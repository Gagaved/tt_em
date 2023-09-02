import 'package:tt_em/di/locator.dart';
import 'package:tt_em/domain/model/booking_information.dart';
import 'package:tt_em/domain/repositories/hotel_repository.dart';
import 'package:tt_em/domain/usecases/base_use_case.dart';

final class GetBookingInformationUseCase extends BaseUseCase<BookingInformation> {
  Future<UseCaseResult<BookingInformation>> execute(int roomId) async {
    return innerCall(() async {
      var hotelRepository = getIt<HotelRepository>();
      BookingInformation bookingInformation = await hotelRepository.getBookingInformationByRoomId(roomId);
      return bookingInformation;
    });
  }
}