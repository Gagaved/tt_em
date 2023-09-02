import 'package:tt_em/domain/model/booking_information.dart';
import 'package:tt_em/domain/model/hotel.dart';
import 'package:tt_em/domain/model/room.dart';
import 'package:tt_em/domain/repositories/hotel_repository.dart';

class HotelRepositoryImpl implements HotelRepository {
  @override
  Future<Hotel> getHotelById() async {
    // TODO: implement getHotel
    throw UnimplementedError();
  }

  @override
  Future<List<Room>> getRoomsByHotelId(int hotelId) {
    // TODO: implement getRoomsByHotelId
    throw UnimplementedError();
  }

  @override
  Future<BookingInformation> getBookingInformationByRoomId(int roomId) {
    // TODO: implement getBookingInformationByRoomId
    throw UnimplementedError();
  }


}

class HotelRepositoryMockImpl implements HotelRepository {
  @override
  Future<Hotel> getHotelById() async {
    final jsonMap = {
      "id": 1,
      "name": "Лучший пятизвездный отель в Хургаде, Египет",
      "address": "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
      "minimal_price": 134268,
      "price_for_it": "За тур с перелётом",
      "rating": 5,
      "rating_name": "Превосходно",
      "image_urls": [
        "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg",
        "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg",
        "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"
      ],
      "about_the_hotel": {
        "description": "Отель VIP-класса с собственными гольф полями. Высокий уровень сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
        "peculiarities": [
          "Бесплатный Wifi на всей территории отеля",
          "1 км до пляжа",
          "Бесплатный фитнес-клуб",
          "20 км до аэропорта"
        ]
      }
    };

    final hotel = Hotel.fromMap(jsonMap);
    return hotel;
  }

  @override
  Future<List<Room>> getRoomsByHotelId(int hotelId) async {
    // Здесь вы можете загрузить данные из сети или из локального источника.
    // В данном случае, мы будем использовать предоставленные вами данные JSON.
    final jsonMap = {
      "rooms": [
        {
          "id": 1,
          "name": "Стандартный номер с видом на бассейн",
          "price": 186600,
          "price_per": "За 7 ночей с перелетом",
          "peculiarities": ["Включен только завтрак", "Кондиционер"],
          "image_urls": [
            "https://www.atorus.ru/sites/default/files/upload/image/News/56871/%D1%80%D0%B8%D0%BA%D1%81%D0%BE%D1%81%20%D1%81%D0%B8%D0%B3%D0%B5%D0%B9%D1%82.jpg",
            "https://q.bstatic.com/xdata/images/hotel/max1024x768/267647265.jpg?k=c8233ff42c39f9bac99e703900a866dfbad8bcdd6740ba4e594659564e67f191&o=",
            "https://worlds-trip.ru/wp-content/uploads/2022/10/white-hills-resort-5.jpeg"
          ]
        },
        {
          "id": 2,
          "name": "Люкс номер с видом на море",
          "price": 289400,
          "price_per": "За 7 ночей с перелетом",
          "peculiarities": [
            "Все включено",
            "Кондиционер",
            "Собственный бассейн"
          ],
          "image_urls": [
            "https://mmf5angy.twic.pics/ahstatic/www.ahstatic.com/photos/b1j0_roskdc_00_p_1024x768.jpg?ritok=65&twic=v1/cover=800x600",
            "https://www.google.com/search?q=%D0%BD%D0%BE%D0%BC%D0%B5%D1%80+%D0%BB%D1%8E%D0%BA%D1%81+%D0%B2+%D0%BE%D1%82%D0%B5%D0%BB%D0%B8+%D0%B5%D0%B3%D0%B8%D0%BF%D1%82%D0%B0+%D1%81+%D1%81%D0%BE%D0%B1%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D1%8B%D0%BC+%D0%B1%D0%B0%D1%81%D1%81%D0%B5%D0%B9%D0%BD%D0%BE%D0%BC&tbm=isch&ved=2ahUKEwilufKp-4KBAxUfJxAIHR4uAToQ2-cCegQIABAA&oq=%D0%BD%D0%BE%D0%BC%D0%B5%D1%80+%D0%BB%D1%8E%D0%BA%D1%81+%D0%B2+%D0%BE%D1%82%D0%B5%D0%BB%D0%B8+%D0%B5%D0%B3%D0%B8%D0%BF%D1%82%D0%B0+%D1%81+%D1%81%D0%BE%D0%B1%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D1%8B%D0%BC+%D0%B1%D0%B0%D1%81%D1%81%D0%B5%D0%B9%D0%BD%D0%BE%D0%BC&gs_lcp=CgNpbWcQAzoECCMQJ1CqAVi6HGDmHWgAcAB4AIABXIgB3wySAQIyNZgBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=Y3fuZOX7KJ_OwPAPntyE0AM&bih=815&biw=1440#imgrc=Nr2wzh3vuY4jEM&imgdii=zTCXWbFgrQ5HBM",
            "https://tour-find.ru/thumb/2/bsb2EIEFA8nm22MvHqMLlw/r/d/screenshot_3_94.png"
          ]
        }
      ]
    };

    List<Map<String, dynamic>> roomsJson = jsonMap['rooms']!;
    // Преобразуйте данные JSON в список объектов Room
    final List<Room> rooms = roomsJson.map((roomJson) => Room.fromMap(roomJson))
        .toList();

    // Верните список номеров
    return rooms;
  }

  @override
  Future<BookingInformation> getBookingInformationByRoomId(int roomId) async {
    // Ваша логика для получения информации о бронировании по номеру комнаты (roomId).
    // В данном случае, мы вернем фиктивный объект BookingInformation.

    final bookingInfo = BookingInformation(
      id: 1,
      hotelName: "Лучший пятизвездочный отель в Хургаде, Египет",
      hotelAddress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
      rating: 5,
      ratingName: "Превосходно",
      departure: "Москва",
      arrivalCountry: "Египет, Хургада",
      tourDateStart: "19.09.2023",
      tourDateStop: "27.09.2023",
      numberOfNights: 7,
      room: "Люкс номер с видом на море",
      nutrition: "Все включено",
      tourPrice: 289400,
      fuelCharge: 9300,
      serviceCharge: 2150,
    );
    // Задержка для имитации асинхронного запроса к серверу.
    await Future.delayed(const Duration(seconds: 1));

    return bookingInfo;
  }
}
