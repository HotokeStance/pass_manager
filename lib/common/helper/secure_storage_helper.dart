import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pass_manager/common/exception/secure_storage_exception.dart';

final secureStorageHelperProvider = Provider.autoDispose((ref) {
  return SecureStorageHelper();
});

class SecureStorageHelper {
  SecureStorageHelper();

  FlutterSecureStorage get _instance => const FlutterSecureStorage();

  /// 一覧取得
  Future<Map<String, String>> getAllSecureStorage() async {
    try {
      final result = await _instance.readAll();
      return result;
    } catch (_) {
      throw SecureStorageException('取得に失敗しました');
    }
  }

  /// 保存
  Future<void> save({
    required String key,
    required String value,
  }) async {
    try {
      await _instance.write(key: key, value: value);
    } catch (_) {
      throw SecureStorageException('保存に失敗しました');
    }
  }

  /// 削除
  Future<void> delete({
    required String key,
  }) async {
    try {
      await _instance.delete(key: key);
    } catch (_) {
      throw SecureStorageException('削除に失敗しました');
    }
  }

  /// 全てを削除
  Future<void> deleteAll() async {
    try {
      await _instance.deleteAll();
    } catch (_) {
      throw SecureStorageException('削除に失敗しました');
    }
  }
}
