import 'package:pass_manager/common/exception/app_exception.dart';

class NetworkAvailableException extends AppException {
  const NetworkAvailableException() : super(message: 'ネットワークを切断してください');
}
