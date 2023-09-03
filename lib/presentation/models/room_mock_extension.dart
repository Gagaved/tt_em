
import 'package:tt_em/domain/model/room.dart';

///
/// Этот эктеншин используется только презентационным слоем.
/// Обычный кейс использования, это подставлять данные из этого объекта в скелетон во время загрузки  и/или для тестирования UI
extension RoomMockExtension on Room {
  static Room createMock() {
    return const Room(
      id: 1,
      name: 'Замоканный номер',
      price: 200,
      pricePer: 'за ночь',
      peculiarities: ['Бесплатный Wi-Fi', 'Вид на море'],
      imageUrls: [],

    );
  }
}
