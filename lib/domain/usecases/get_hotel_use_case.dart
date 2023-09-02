import 'package:tt_em/di/locator.dart';
import 'package:tt_em/domain/model/hotel.dart';
import 'package:tt_em/domain/repositories/hotel_repository.dart';
import 'package:tt_em/domain/usecases/base_use_case.dart';

final class GetHotelUseCase extends BaseUseCase<Hotel> {
  Future<UseCaseResult<Hotel>> execute() async {
    return innerCall(() async {
      var hotelRepository = getIt<HotelRepository>();
      Hotel hotel = await hotelRepository.getHotelById();
      return hotel;
    });
  }
}
