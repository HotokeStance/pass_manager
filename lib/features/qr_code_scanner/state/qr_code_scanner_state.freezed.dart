// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_code_scanner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QrCodeScannerState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get qrData => throw _privateConstructorUsedError;
  bool get networkError => throw _privateConstructorUsedError;
  bool get readQrCode => throw _privateConstructorUsedError;
  bool get confirmForceWrite => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QrCodeScannerStateCopyWith<QrCodeScannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrCodeScannerStateCopyWith<$Res> {
  factory $QrCodeScannerStateCopyWith(
          QrCodeScannerState value, $Res Function(QrCodeScannerState) then) =
      _$QrCodeScannerStateCopyWithImpl<$Res, QrCodeScannerState>;
  @useResult
  $Res call(
      {bool isLoading,
      String qrData,
      bool networkError,
      bool readQrCode,
      bool confirmForceWrite});
}

/// @nodoc
class _$QrCodeScannerStateCopyWithImpl<$Res, $Val extends QrCodeScannerState>
    implements $QrCodeScannerStateCopyWith<$Res> {
  _$QrCodeScannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? qrData = null,
    Object? networkError = null,
    Object? readQrCode = null,
    Object? confirmForceWrite = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      qrData: null == qrData
          ? _value.qrData
          : qrData // ignore: cast_nullable_to_non_nullable
              as String,
      networkError: null == networkError
          ? _value.networkError
          : networkError // ignore: cast_nullable_to_non_nullable
              as bool,
      readQrCode: null == readQrCode
          ? _value.readQrCode
          : readQrCode // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmForceWrite: null == confirmForceWrite
          ? _value.confirmForceWrite
          : confirmForceWrite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QrCodeScannerStateImplCopyWith<$Res>
    implements $QrCodeScannerStateCopyWith<$Res> {
  factory _$$QrCodeScannerStateImplCopyWith(_$QrCodeScannerStateImpl value,
          $Res Function(_$QrCodeScannerStateImpl) then) =
      __$$QrCodeScannerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String qrData,
      bool networkError,
      bool readQrCode,
      bool confirmForceWrite});
}

/// @nodoc
class __$$QrCodeScannerStateImplCopyWithImpl<$Res>
    extends _$QrCodeScannerStateCopyWithImpl<$Res, _$QrCodeScannerStateImpl>
    implements _$$QrCodeScannerStateImplCopyWith<$Res> {
  __$$QrCodeScannerStateImplCopyWithImpl(_$QrCodeScannerStateImpl _value,
      $Res Function(_$QrCodeScannerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? qrData = null,
    Object? networkError = null,
    Object? readQrCode = null,
    Object? confirmForceWrite = null,
  }) {
    return _then(_$QrCodeScannerStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      qrData: null == qrData
          ? _value.qrData
          : qrData // ignore: cast_nullable_to_non_nullable
              as String,
      networkError: null == networkError
          ? _value.networkError
          : networkError // ignore: cast_nullable_to_non_nullable
              as bool,
      readQrCode: null == readQrCode
          ? _value.readQrCode
          : readQrCode // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmForceWrite: null == confirmForceWrite
          ? _value.confirmForceWrite
          : confirmForceWrite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$QrCodeScannerStateImpl implements _QrCodeScannerState {
  const _$QrCodeScannerStateImpl(
      {this.isLoading = false,
      this.qrData = '',
      this.networkError = false,
      this.readQrCode = false,
      this.confirmForceWrite = false});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String qrData;
  @override
  @JsonKey()
  final bool networkError;
  @override
  @JsonKey()
  final bool readQrCode;
  @override
  @JsonKey()
  final bool confirmForceWrite;

  @override
  String toString() {
    return 'QrCodeScannerState(isLoading: $isLoading, qrData: $qrData, networkError: $networkError, readQrCode: $readQrCode, confirmForceWrite: $confirmForceWrite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrCodeScannerStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.qrData, qrData) || other.qrData == qrData) &&
            (identical(other.networkError, networkError) ||
                other.networkError == networkError) &&
            (identical(other.readQrCode, readQrCode) ||
                other.readQrCode == readQrCode) &&
            (identical(other.confirmForceWrite, confirmForceWrite) ||
                other.confirmForceWrite == confirmForceWrite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, qrData, networkError,
      readQrCode, confirmForceWrite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QrCodeScannerStateImplCopyWith<_$QrCodeScannerStateImpl> get copyWith =>
      __$$QrCodeScannerStateImplCopyWithImpl<_$QrCodeScannerStateImpl>(
          this, _$identity);
}

abstract class _QrCodeScannerState implements QrCodeScannerState {
  const factory _QrCodeScannerState(
      {final bool isLoading,
      final String qrData,
      final bool networkError,
      final bool readQrCode,
      final bool confirmForceWrite}) = _$QrCodeScannerStateImpl;

  @override
  bool get isLoading;
  @override
  String get qrData;
  @override
  bool get networkError;
  @override
  bool get readQrCode;
  @override
  bool get confirmForceWrite;
  @override
  @JsonKey(ignore: true)
  _$$QrCodeScannerStateImplCopyWith<_$QrCodeScannerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
