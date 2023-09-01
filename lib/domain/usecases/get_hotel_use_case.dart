import 'package:tt_em/di/locator.dart';
import 'package:tt_em/domain/local_data_sources/hotel_local_data_source.dart';
import 'package:tt_em/domain/model/booking_information.dart';
import 'package:tt_em/domain/model/hotel.dart';
import 'package:tt_em/domain/repositories/hotel_repository.dart';
import 'package:tt_em/domain/usecases/base_use_case.dart';

final class GetHotelUseCase extends BaseUseCase<Hotel> {
  Future<UseCaseResult<Hotel>> execute() async {
    return innerCall(() async {
      var hotelRepository = getIt<HotelRepository>();
      Hotel hotel = await hotelRepository.getHotelById();
      getIt.popScopesTill('localDataSource');
      getIt.pushNewScope(scopeName: 'localDataSource');
      getIt.registerSingleton<BookingInformationLocalDataSource>(
          BookingInformationLocalDataSourceImpl()
            ..setBookingInformationData(BookingInformation(hotel: hotel)));
      return hotel;
    });
  }
}
