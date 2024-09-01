abstract class AppException implements Exception {
  const AppException({this.message});

  final String? message;

  @override
  String toString() {
    return message == null ? '$runtimeType' : '$runtimeType: $message';
  }
}
