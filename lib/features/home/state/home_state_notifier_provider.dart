import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pass_manager/common/helper/secure_storage_helper.dart';
import 'package:pass_manager/features/home/state/home_state.dart';

final homeStateNotifierProvider =
    StateNotifierProvider.autoDispose<HomeStateNotifier, HomeState>((ref) {
  return HomeStateNotifier(ref);
});

class StorageEntity {
  String key;
  String value;
  bool isShow;
  StorageEntity(this.key, this.value, this.isShow);
}

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier(this._ref) : super(const HomeState()) {
    init();
  }
  final Ref _ref;
  SecureStorageHelper get _secureStorageHelper =>
      _ref.read(secureStorageHelperProvider);

  void init() {
    getSecureStorage();
  }

  Future<void> getSecureStorage() async {
    try {
      final result = await _secureStorageHelper.getAllSecureStorage();

      final list = result.entries
          .map(
            (e) => StorageEntity(
              e.key,
              e.value,
              false,
            ),
          )
          .toList();
      state = state.copyWith(storageData: list);
    } catch (_) {}
  }

  Future<void> savePass() async {
    final key = state.inputKey;
    final value = state.inputValue;
    await _secureStorageHelper.save(key: key, value: value);
  }

  void switchShow(String key, bool isShow) {
    final list = List<StorageEntity>.from(state.storageData);
    final idx = list.indexWhere((element) => element.key == key);

    list[idx] = StorageEntity(key, list[idx].value, !isShow);

    state = state.copyWith(storageData: list);
  }

  void updateInputKey(String value) {
    state = state.copyWith(inputKey: value);
  }

  void updateInputValue(String value) {
    state = state.copyWith(inputValue: value);
  }

  Future<void> deleteValue(String key) async {
    await _secureStorageHelper.delete(key: key);

    await getSecureStorage();
  }
}
