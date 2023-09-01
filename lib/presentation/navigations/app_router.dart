import 'package:flutter/material.dart';
import 'package:tt_em/presentation/pages/rooms_page/rooms_page.dart';
import 'package:tt_em/presentation/pages/booking_page/booking_page.dart';
import 'package:tt_em/presentation/pages/hotel_page/hotel_page.dart';
import 'package:tt_em/presentation/pages/payment_page/payment_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => HotelPage(args: args), settings: settings);
      case '/rooms':
        return MaterialPageRoute(
            builder: (_) => RoomsPage(args: args), settings: settings);
      case '/booking':
        return MaterialPageRoute(
            builder: (_) => BookingPage(args: args), settings: settings);
      case '/payment':
        return MaterialPageRoute(
            builder: (_) => PaymentPage(args: args), settings: settings);
      default:
        throw Exception('unknown route: ${settings.name}');
    }
  }
}
