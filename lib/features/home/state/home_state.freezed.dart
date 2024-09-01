// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<StorageEntity> get storageData => throw _privateConstructorUsedError;
  String get inputKey => throw _privateConstructorUsedError;
  String get inputValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<StorageEntity> storageData,
      String inputKey,
      String inputValue});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? storageData = null,
    Object? inputKey = null,
    Object? inputValue = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      storageData: null == storageData
          ? _value.storageData
          : storageData // ignore: cast_nullable_to_non_nullable
              as List<StorageEntity>,
      inputKey: null == inputKey
          ? _value.inputKey
          : inputKey // ignore: cast_nullable_to_non_nullable
              as String,
      inputValue: null == inputValue
          ? _value.inputValue
          : inputValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<StorageEntity> storageData,
      String inputKey,
      String inputValue});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? storageData = null,
    Object? inputKey = null,
    Object? inputValue = null,
  }) {
    return _then(_$HomeStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      storageData: null == storageData
          ? _value._storageData
          : storageData // ignore: cast_nullable_to_non_nullable
              as List<StorageEntity>,
      inputKey: null == inputKey
          ? _value.inputKey
          : inputKey // ignore: cast_nullable_to_non_nullable
              as String,
      inputValue: null == inputValue
          ? _value.inputValue
          : inputValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.isLoading = false,
      final List<StorageEntity> storageData = const [],
      this.inputKey = '',
      this.inputValue = ''})
      : _storageData = storageData;

  @override
  @JsonKey()
  final bool isLoading;
  final List<StorageEntity> _storageData;
  @override
  @JsonKey()
  List<StorageEntity> get storageData {
    if (_storageData is EqualUnmodifiableListView) return _storageData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storageData);
  }

  @override
  @JsonKey()
  final String inputKey;
  @override
  @JsonKey()
  final String inputValue;

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, storageData: $storageData, inputKey: $inputKey, inputValue: $inputValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._storageData, _storageData) &&
            (identical(other.inputKey, inputKey) ||
                other.inputKey == inputKey) &&
            (identical(other.inputValue, inputValue) ||
                other.inputValue == inputValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_storageData), inputKey, inputValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final bool isLoading,
      final List<StorageEntity> storageData,
      final String inputKey,
      final String inputValue}) = _$HomeStateImpl;

  @override
  bool get isLoading;
  @override
  List<StorageEntity> get storageData;
  @override
  String get inputKey;
  @override
  String get inputValue;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
