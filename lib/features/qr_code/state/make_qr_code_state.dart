import 'package:freezed_annotation/freezed_annotation.dart';

part 'make_qr_code_state.freezed.dart';

@freezed
class MakeQrCodeState with _$MakeQrCodeState {
  const factory MakeQrCodeState({
    @Default(false) bool isLoading,
    @Default('') String qrData,
    @Default(false) bool networkError,
  }) = _MakeQrCodeState;
}
