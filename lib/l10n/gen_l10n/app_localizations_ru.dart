import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get hotelPageTitle => 'Отель';

  @override
  String get goToRoomSelection => 'К выбору номера';

  @override
  String get fromPrice => 'от';

  @override
  String get amenities => 'Удобства';

  @override
  String get essentials => 'Самое необходимое';

  @override
  String get whatIsIncluded => 'Что включено';

  @override
  String get whatIsNotIncluded => 'Что не включено';

  @override
  String get goToBookingButton => 'Выбрать номер';

  @override
  String get moreAboutRoom => 'Подробнее о номере';

  @override
  String get loadImageErrorMessage => 'Не удалось загрузить изображение';

  @override
  String get bookingPageTitle => 'Бронирование';

  @override
  String get departureBookingInformation => 'Вылет из';

  @override
  String get datesBookingInformation => 'Даты';

  @override
  String get arrivalCountryBookingInformation => 'Страна, город';

  @override
  String get numberOfNightsBookingInformation => 'Кол-во ночей';

  @override
  String get hotelBookingInformation => 'Отель';

  @override
  String get roomBookingInformation => 'Номер';

  @override
  String get nutrition => 'Питание';
}
