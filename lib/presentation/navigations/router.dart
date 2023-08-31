import 'package:flutter/material.dart';
import 'package:tt_em/presentation/pages/apartments_page/apartaments_page.dart';
import 'package:tt_em/presentation/pages/booking_page/booking_page.dart';
import 'package:tt_em/presentation/pages/hotel_page/hotel_page.dart';
import 'package:tt_em/presentation/pages/payment_page/payment_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HotelPage(), settings: settings);
      case '/home':
        return MaterialPageRoute(
            builder: (_) => const ApartmentsPage(), settings: settings);
      case '/private_policy':
        return MaterialPageRoute(
            builder: (_) => const BookingPage(), settings: settings);
      case '/terms_of_use':
        return MaterialPageRoute(
            builder: (_) => const PaymentPage(), settings: settings);
      default:
        throw Exception('unknown route: ${settings.name}');
    }
  }
}
