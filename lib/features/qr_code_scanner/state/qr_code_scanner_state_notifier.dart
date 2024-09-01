import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pass_manager/common/helper/secure_storage_helper.dart';
import 'package:pass_manager/features/qr_code_scanner/state/qr_code_scanner_state.dart';
import 'dart:convert' as convert;

final qrCodeScannerStateNotifierProvider = StateNotifierProvider.autoDispose<
    QrCodeScannerStateNotifier, QrCodeScannerState>((ref) {
  return QrCodeScannerStateNotifier(ref);
});

class QrCodeScannerStateNotifier extends StateNotifier<QrCodeScannerState> {
  QrCodeScannerStateNotifier(this._ref) : super(const QrCodeScannerState()) {
    init();
  }

  final Ref _ref;
  SecureStorageHelper get _secureStorageHelper =>
      _ref.read(secureStorageHelperProvider);

  void init() {}

  void confirmForceWrite() {
    state = state.copyWith(confirmForceWrite: true);
  }

  void cancelForceWrite() {
    state = state.copyWith(confirmForceWrite: false);
  }

  Future<void> savePassData({
    required String qrData,
    required BuildContext context,
  }) async {
    // ローカルストレージ削除処理
    await _secureStorageHelper.deleteAll();
    // ローカルストレージ保存処理
    final passData = convert.json.decode(qrData) as Map<String, dynamic>;
    await Future.wait(passData.entries.map((e) async {
      await _secureStorageHelper.save(key: e.key, value: e.value);
    }));
    Navigator.of(context).pop();
  }
}
