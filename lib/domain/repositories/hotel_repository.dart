import 'package:tt_em/domain/model/booking_information.dart';
import 'package:tt_em/domain/model/hotel.dart';
import 'package:tt_em/domain/model/room.dart';

abstract interface class HotelRepository{
  Future<Hotel> getHotel();
  Future<List<Room>> getRoomsByHotelId(int hotelId);
  Future<BookingInformation> getBookingInformationByRoomId(int roomId);

}