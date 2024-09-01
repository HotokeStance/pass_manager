import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_code_scanner_state.freezed.dart';

@freezed
class QrCodeScannerState with _$QrCodeScannerState {
  const factory QrCodeScannerState({
    @Default(false) bool isLoading,
    @Default('') String qrData,
    @Default(false) bool networkError,
    @Default(false) bool readQrCode,
    @Default(false) bool confirmForceWrite,
  }) = _QrCodeScannerState;
}
