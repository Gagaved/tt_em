import 'package:tt_em/domain/model/hotel.dart';
import 'package:tt_em/domain/model/room.dart';

/// Этот эктеншин используется только презентационным слоем.
/// Обычный кейс использования, это подставлять данные из этого объекта в скелетон во время загрузки и/или для тестирования UI
extension HotelMockExtension on Room {
  static Hotel createMock() {
    return const Hotel(
        id: 1,
        name: "Лучший пятизвездный отель",
        address:
            "690922, Приморский край, г. Владивосток, остров Русский, п. Аякс, 10.",
        minimalPrice: 228228,
        priceForIt: "За тур с перелётом",
        rating: 5,
        ratingName: "Превосходно",
        imageUrls: [
          "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg",
          "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg",
          "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"
        ],
        aboutTheHotel: HotelDescription(
            description:
                "Отель VIP-класса с собственными гольф полями. Высокий уровень сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
            peculiarities: [
              "Бесплатный Wifi на всей территории отеля",
              "1 км до пляжа",
              "Бесплатный фитнес-клуб",
              "20 км до аэропорта"
            ]));
  }
}
