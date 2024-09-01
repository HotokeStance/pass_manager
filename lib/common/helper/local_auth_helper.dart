import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

final localAuthHelperProvider =
    Provider.autoDispose((ref) => LocalAuthHelper());

class LocalAuthHelper {
  Future<bool> authBio() async {
    try {
      final auth = LocalAuthentication();
      final didAuthenticate = await auth.authenticate(
        localizedReason: ' ',
        authMessages: [
          const AndroidAuthMessages(
            signInTitle: ' ',
            biometricRequiredTitle: '',
            biometricHint: '認証してください',
            cancelButton: 'キャンセル',
          ),
          const IOSAuthMessages(
            // 空文字にするとパスコードを入力できないようになる
            localizedFallbackTitle: 'パスコードを入力する',
          )
        ],
        options: const AuthenticationOptions(
          // PINコードに切り替えさせないようにする
          biometricOnly: false,
          // 認証エラーが発生した場合にライブラリ内のエラーダイアログを表示する
          useErrorDialogs: false,
          // 画面から離れた際も認証を継続する
          stickyAuth: true,
        ),
      );
      return didAuthenticate;
    } on PlatformException catch (_) {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }
}
