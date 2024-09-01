import 'package:pass_manager/common/exception/app_exception.dart';

class SecureStorageException extends AppException {
  SecureStorageException(this.reason) : super(message: reason);
  final String reason;
}
