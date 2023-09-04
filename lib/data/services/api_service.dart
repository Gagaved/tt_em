import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:tt_em/data/model/rooms_model.dart';
import 'package:tt_em/domain/model/booking_information.dart';
import 'package:tt_em/domain/model/hotel.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3')
  Future<Hotel> getHotel();

  @GET('https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd')
  Future<RoomsModel> getRooms();

  @GET('https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8')
  Future<BookingInformation> getBookingInformation();
}
