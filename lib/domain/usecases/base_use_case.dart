import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tt_em/domain/exeptions/app_exeption.dart';

abstract class BaseUseCase<T> {
  @protected
  Future<UseCaseResult<T>> innerCall(Function func) async {
    T? result;
    try {
      result = await func();
      var useCaseResult = UseCaseResult<T>.success(result: result);
      return useCaseResult;
    } catch (e) {
      //todo add other error handlers
      if (e is PlatformException) {
        switch (e.code) {
        /// todo implement error handler for PlatformException
        }
      }
      if (e is AppException) {
        /// todo implement error handler for AppException
      }
      var useCaseResult =
          UseCaseResult<T>.error(error: UseCaseError.internalAppServiceError,
          errorMessage: 'unhandled error: ${e.toString()}');
      return useCaseResult;
    }
  }
}

class UseCaseResult<T> {
  final UseCaseError error;
  final String? errorMessage;
  final T? result;

  UseCaseResult.success({this.errorMessage, required this.result})
      : error = UseCaseError.noError;

  UseCaseResult.error({this.errorMessage, required this.error}) : result = null;
}

enum UseCaseError {
  noError,
  authorizationError,
  networkError,
  serverConnectionError,
  serverInternalError,
  internalAppServiceError
}
