import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pass_manager/common/app_text_styles.dart';
import 'package:pass_manager/features/qr_code/state/make_qr_code_state_notifier.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MakeQrCodeScreen extends HookConsumerWidget {
  const MakeQrCodeScreen({super.key});

  static const name = 'makeQrCode';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(makeQrCodeStateNotifier.notifier);
    final qrData =
        ref.watch(makeQrCodeStateNotifier.select((value) => value.qrData));
    final isNetworkError = ref
        .watch(makeQrCodeStateNotifier.select((value) => value.networkError));

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'こちらのQRコードを引き継ぎしたい端末で読み込んでください\nこのQRコードは平文です。取り扱いには厳重な注意をお願いします。',
                  style: AppTextStyles.basic14TextStyle,
                ),
                qrData != ''
                    ? QrImageView(
                        data: qrData,
                        version: QrVersions.auto,
                        size: 200.0,
                      )
                    : ElevatedButton(
                        onPressed: () {
                          provider.makeQrCode();
                        },
                        child: const Text(
                          'QRコードの生成',
                          style: AppTextStyles.basic14TextStyle,
                        ),
                      )
              ],
            ),
          ),
          Visibility(
            visible: isNetworkError,
            child: Container(
              decoration: const BoxDecoration(color: Colors.black26),
            ),
          ),
          Visibility(
            visible: isNetworkError,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ネットワークをOFFにしてください。',
                    style: AppTextStyles.basic14TextStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      provider.resetErrorState();
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
