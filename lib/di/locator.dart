import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tt_em/data/repositories/hotel_repository_impl.dart';
import 'package:tt_em/data/services/api_service.dart';
import 'package:tt_em/domain/repositories/hotel_repository.dart';

final getIt = GetIt.instance;
final getItBloc = GetIt.asNewInstance();

Future setupLocator() async {
  getIt.registerLazySingleton<HotelRepository>(() => HotelRepositoryImpl());
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio(BaseOptions(contentType: "application/json"))));
}
