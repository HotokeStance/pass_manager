import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pass_manager/common/exception/network_available_exception.dart';
import 'package:pass_manager/common/helper/secure_storage_helper.dart';
import 'package:pass_manager/features/qr_code/state/make_qr_code_state.dart';
import 'dart:convert' as convert;

final makeQrCodeStateNotifier =
    StateNotifierProvider.autoDispose<MakeQrCodeStateNotifier, MakeQrCodeState>(
        (ref) {
  return MakeQrCodeStateNotifier(ref);
});

class MakeQrCodeStateNotifier extends StateNotifier<MakeQrCodeState> {
  MakeQrCodeStateNotifier(this._ref) : super(const MakeQrCodeState()) {
    init();
  }

  final Ref _ref;
  SecureStorageHelper get _secureStorageHelper =>
      _ref.read(secureStorageHelperProvider);

  void init() {
    makeQrCode();
  }

  Future<void> makeQrCode() async {
    // ネットワークを切る
    try {
      final connectivity = await Connectivity().checkConnectivity();

      if (!(connectivity == ConnectivityResult.none)) {
        throw const NetworkAvailableException();
      }

      // QR生成
      final secureStorageData =
          await _secureStorageHelper.getAllSecureStorage();
      final json = convert.json.encode(secureStorageData);
      state = state.copyWith(qrData: json);
    } on NetworkAvailableException catch (_) {
      state = state.copyWith(networkError: true);
    }
  }

  void resetErrorState() {
    state = state.copyWith(networkError: false);
  }
}
