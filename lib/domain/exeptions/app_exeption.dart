final class AppException {
  late String _message;
  final String code;
  get message => _message;

  AppException({required this.code,String? message}) {
    _message = message ?? '';
  }
}