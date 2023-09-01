import 'package:tt_em/domain/model/hotel.dart';
import 'package:tt_em/domain/model/room.dart';

abstract interface class HotelRepository{
  Future<Hotel> getHotelById();
  Future<List<Room>> getRoomsByHotelId(int hotelId);
}