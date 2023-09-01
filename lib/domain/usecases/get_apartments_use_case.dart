import 'package:tt_em/di/locator.dart';
import 'package:tt_em/domain/model/room.dart';
import 'package:tt_em/domain/repositories/hotel_repository.dart';
import 'package:tt_em/domain/usecases/base_use_case.dart';

final class GetRoomsByHotelIdUseCase extends BaseUseCase<List<Room>> {
  Future<UseCaseResult<List<Room>>> execute(int hotelId) async {
    return innerCall(() async {
      var hotelRepository = getIt<HotelRepository>();
      List<Room> rooms = await hotelRepository.getRoomsByHotelId(hotelId);
      return rooms;
    });
  }
}