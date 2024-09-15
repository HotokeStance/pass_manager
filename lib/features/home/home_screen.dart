import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pass_manager/common/app_text_styles.dart';
import 'package:pass_manager/common/util/string_util.dart';
import 'package:pass_manager/features/add/add_pass_screen.dart';
import 'package:pass_manager/features/home/state/home_state_notifier_provider.dart';
import 'package:pass_manager/features/qr_code/make_qr_code_screen.dart';
import 'package:pass_manager/features/qr_code_scanner/qr_code_scanner_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  static const name = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(homeStateNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
          style: AppTextStyles.basic14TextStyle,
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              await context.pushNamed(AddPassScreen.name);
              provider.getSecureStorage();
            },
            child: const Icon(
              Icons.add,
              size: 24,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () async {
              await context.pushNamed(MakeQrCodeScreen.name);
              provider.getSecureStorage();
            },
            child: const Icon(
              Icons.qr_code,
              size: 24,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () async {
              await context.pushNamed(QrCodeScannerScreen.name);
              provider.getSecureStorage();
            },
            child: const Icon(
              Icons.qr_code_scanner,
              size: 24,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body: const _ListWidget(),
    );
  }
}

class _ListWidget extends HookConsumerWidget {
  const _ListWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageData = ref
        .watch(homeStateNotifierProvider.select((value) => value.storageData));

    if (storageData.isEmpty) {
      return const Center(
        child: Text(
          'データがありません',
          style: AppTextStyles.basic14TextStyle,
        ),
      );
    }

    return ListView.builder(
      itemCount: storageData.length,
      itemBuilder: (context, index) {
        return _ListItemWidget(
          title: storageData[index].key,
          value: storageData[index].value,
          isShow: storageData[index].isShow,
        );
      },
    );
  }
}

class _ListItemWidget extends HookConsumerWidget {
  const _ListItemWidget({
    required this.title,
    required this.value,
    required this.isShow,
  });

  final String title;
  final String value;
  final bool isShow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(homeStateNotifierProvider.notifier);

    return InkWell(
      onTap: () async {
        await copyString(value);
        const snackBar = SnackBar(
          content: Text('コピーしました'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      onLongPress: () async {
        final isDelete = await showDialog<bool>(
          context: context,
          builder: (context) {
            return SimpleDialog(
              children: [
                SizedBox(
                  height: 140,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'このデータを削除しますか？',
                        style: AppTextStyles.basic14TextStyle,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'キャンセル',
                                style: AppTextStyles.buttonTextStyle.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                '削除',
                                style: AppTextStyles.buttonTextStyle,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        );

        if (isDelete == null) {
          return;
        }

        if (isDelete) {
          provider.deleteValue(title);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(52, 51, 51, 51),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.basic14TextStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isShow ? value : '*****',
                  style: AppTextStyles.basic14TextStyle,
                ),
                InkWell(
                  onTap: () {
                    provider.switchShow(title, isShow);
                  },
                  child: Icon(
                    isShow ? Icons.visibility : Icons.visibility_off,
                    size: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
