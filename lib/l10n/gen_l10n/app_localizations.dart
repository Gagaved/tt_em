import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru')
  ];

  /// No description provided for @hotelPageTitle.
  ///
  /// In ru, this message translates to:
  /// **'Отель'**
  String get hotelPageTitle;

  /// No description provided for @goToRoomSelection.
  ///
  /// In ru, this message translates to:
  /// **'К выбору номера'**
  String get goToRoomSelection;

  /// No description provided for @fromPrice.
  ///
  /// In ru, this message translates to:
  /// **'от'**
  String get fromPrice;

  /// No description provided for @hotelDetailedInformationTitle.
  ///
  /// In ru, this message translates to:
  /// **'Об отеле'**
  String get hotelDetailedInformationTitle;

  /// No description provided for @amenities.
  ///
  /// In ru, this message translates to:
  /// **'Удобства'**
  String get amenities;

  /// No description provided for @essentials.
  ///
  /// In ru, this message translates to:
  /// **'Самое необходимое'**
  String get essentials;

  /// No description provided for @whatIsIncluded.
  ///
  /// In ru, this message translates to:
  /// **'Что включено'**
  String get whatIsIncluded;

  /// No description provided for @whatIsNotIncluded.
  ///
  /// In ru, this message translates to:
  /// **'Что не включено'**
  String get whatIsNotIncluded;

  /// No description provided for @goToBookingButton.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать номер'**
  String get goToBookingButton;

  /// No description provided for @moreAboutRoom.
  ///
  /// In ru, this message translates to:
  /// **'Подробнее о номере'**
  String get moreAboutRoom;

  /// No description provided for @loadImageErrorMessage.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось загрузить изображение'**
  String get loadImageErrorMessage;

  /// No description provided for @bookingPageTitle.
  ///
  /// In ru, this message translates to:
  /// **'Бронирование'**
  String get bookingPageTitle;

  /// No description provided for @departureBookingInformation.
  ///
  /// In ru, this message translates to:
  /// **'Вылет из'**
  String get departureBookingInformation;

  /// No description provided for @datesBookingInformation.
  ///
  /// In ru, this message translates to:
  /// **'Даты'**
  String get datesBookingInformation;

  /// No description provided for @arrivalCountryBookingInformation.
  ///
  /// In ru, this message translates to:
  /// **'Страна, город'**
  String get arrivalCountryBookingInformation;

  /// No description provided for @numberOfNightsBookingInformation.
  ///
  /// In ru, this message translates to:
  /// **'Кол-во ночей'**
  String get numberOfNightsBookingInformation;

  /// No description provided for @nightsTrailingBookingInformation.
  ///
  /// In ru, this message translates to:
  /// **'ночей'**
  String get nightsTrailingBookingInformation;

  /// No description provided for @hotelBookingInformation.
  ///
  /// In ru, this message translates to:
  /// **'Отель'**
  String get hotelBookingInformation;

  /// No description provided for @roomBookingInformation.
  ///
  /// In ru, this message translates to:
  /// **'Номер'**
  String get roomBookingInformation;

  /// No description provided for @nutritionBookingInformation.
  ///
  /// In ru, this message translates to:
  /// **'Питание'**
  String get nutritionBookingInformation;

  /// No description provided for @phoneBookingInformation.
  ///
  /// In ru, this message translates to:
  /// **'Номер телефона'**
  String get phoneBookingInformation;

  /// No description provided for @emailBookingInformation.
  ///
  /// In ru, this message translates to:
  /// **'Почта'**
  String get emailBookingInformation;

  /// No description provided for @buyerInformationTitle.
  ///
  /// In ru, this message translates to:
  /// **'Информация о покупателе'**
  String get buyerInformationTitle;

  /// No description provided for @dataInfoAndCheckInfo.
  ///
  /// In ru, this message translates to:
  /// **'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту'**
  String get dataInfoAndCheckInfo;

  /// No description provided for @addTouristTitle.
  ///
  /// In ru, this message translates to:
  /// **'Добавить туриста'**
  String get addTouristTitle;

  /// No description provided for @tourPrice.
  ///
  /// In ru, this message translates to:
  /// **'Тур'**
  String get tourPrice;

  /// No description provided for @fuelCharge.
  ///
  /// In ru, this message translates to:
  /// **'Топливный сбор'**
  String get fuelCharge;

  /// No description provided for @serviceCharge.
  ///
  /// In ru, this message translates to:
  /// **'Сервисный сбор'**
  String get serviceCharge;

  /// No description provided for @totalPrice.
  ///
  /// In ru, this message translates to:
  /// **'К оплате'**
  String get totalPrice;

  /// No description provided for @payButton.
  ///
  /// In ru, this message translates to:
  /// **'Оплатить'**
  String get payButton;

  /// No description provided for @touristTitle.
  ///
  /// In ru, this message translates to:
  /// **'Турист'**
  String get touristTitle;

  /// No description provided for @touristTitle1.
  ///
  /// In ru, this message translates to:
  /// **'Первый турист'**
  String get touristTitle1;

  /// No description provided for @touristTitle2.
  ///
  /// In ru, this message translates to:
  /// **'Второй турист'**
  String get touristTitle2;

  /// No description provided for @touristTitle3.
  ///
  /// In ru, this message translates to:
  /// **'Третий турист'**
  String get touristTitle3;

  /// No description provided for @touristTitle4.
  ///
  /// In ru, this message translates to:
  /// **'Четвёртый турист'**
  String get touristTitle4;

  /// No description provided for @touristTitle5.
  ///
  /// In ru, this message translates to:
  /// **'Пятый турист'**
  String get touristTitle5;

  /// No description provided for @touristTitle6.
  ///
  /// In ru, this message translates to:
  /// **'Шестой турист'**
  String get touristTitle6;

  /// No description provided for @touristTitle7.
  ///
  /// In ru, this message translates to:
  /// **'Седьмой турист'**
  String get touristTitle7;

  /// No description provided for @touristTitle8.
  ///
  /// In ru, this message translates to:
  /// **'Восьмой турист'**
  String get touristTitle8;

  /// No description provided for @touristTitle9.
  ///
  /// In ru, this message translates to:
  /// **'Девятый турист'**
  String get touristTitle9;

  /// No description provided for @touristTitle10.
  ///
  /// In ru, this message translates to:
  /// **'Десятый турист'**
  String get touristTitle10;

  /// No description provided for @touristNameLabel.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get touristNameLabel;

  /// No description provided for @touristNameError.
  ///
  /// In ru, this message translates to:
  /// **'Введите имя'**
  String get touristNameError;

  /// No description provided for @touristSonameLabel.
  ///
  /// In ru, this message translates to:
  /// **'Фамилия'**
  String get touristSonameLabel;

  /// No description provided for @touristSonameError.
  ///
  /// In ru, this message translates to:
  /// **'Введите фамилию'**
  String get touristSonameError;

  /// No description provided for @touristBirthdayLabel.
  ///
  /// In ru, this message translates to:
  /// **'Дата рождения'**
  String get touristBirthdayLabel;

  /// No description provided for @touristBirthdayError.
  ///
  /// In ru, this message translates to:
  /// **'Введите дату рождения'**
  String get touristBirthdayError;

  /// No description provided for @touristCitizenshipLabel.
  ///
  /// In ru, this message translates to:
  /// **'Гражданство'**
  String get touristCitizenshipLabel;

  /// No description provided for @touristCitizenshipError.
  ///
  /// In ru, this message translates to:
  /// **'Укажите гражданство'**
  String get touristCitizenshipError;

  /// No description provided for @touristPassportNumberLabel.
  ///
  /// In ru, this message translates to:
  /// **'Номер загранпаспорта'**
  String get touristPassportNumberLabel;

  /// No description provided for @touristPassportNumberError.
  ///
  /// In ru, this message translates to:
  /// **'Укажите номер загранпаспорта'**
  String get touristPassportNumberError;

  /// No description provided for @touristPassportDateLabel.
  ///
  /// In ru, this message translates to:
  /// **'Срок действия загранпаспорта'**
  String get touristPassportDateLabel;

  /// No description provided for @touristPassportDateError.
  ///
  /// In ru, this message translates to:
  /// **'Укажите срок действия загранпаспорта'**
  String get touristPassportDateError;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
