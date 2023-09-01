import 'package:tt_em/di/locator.dart';
import 'package:tt_em/domain/exeptions/app_exeption.dart';
import 'package:tt_em/domain/local_data_sources/hotel_local_data_source.dart';
import 'package:tt_em/domain/model/booking_information.dart';

import 'base_use_case.dart';

final class GetBookingInformationUseCase extends BaseUseCase<BookingInformation> {
  Future<UseCaseResult<BookingInformation>> execute() async {
    return innerCall(() async {
      var bookingInformationLocalDataSource = getIt<BookingInformationLocalDataSource>();
      BookingInformation? information = bookingInformationLocalDataSource.getBookingInformationData();
      if(information==null) throw AppException(code: 'local_data_does_not_exist');
      return information;
    });
  }
}