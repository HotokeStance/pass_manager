import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pass_manager/features/home/state/home_state_notifier_provider.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default([]) List<StorageEntity> storageData,
    @Default('') String inputKey,
    @Default('') String inputValue,
  }) = _HomeState;
}
