import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pass_manager/common/app_text_styles.dart';
import 'package:pass_manager/features/home/state/home_state_notifier_provider.dart';

class AddPassScreen extends HookConsumerWidget {
  const AddPassScreen({super.key});

  static String name = 'addPassScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(homeStateNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'データセット',
          style: AppTextStyles.basic14TextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'タイトル',
                  style: AppTextStyles.basic14TextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  onChanged: (value) {
                    provider.updateInputKey(value);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'パスワード',
                  style: AppTextStyles.basic14TextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  onChanged: (value) {
                    provider.updateInputValue(value);
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await provider.savePass();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  '保存',
                  style: AppTextStyles.basic14TextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
