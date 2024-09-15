import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pass_manager/common/app_text_styles.dart';
import 'package:pass_manager/features/qr_code_scanner/state/qr_code_scanner_state_notifier.dart';

class QrCodeScannerScreen extends ConsumerStatefulWidget {
  const QrCodeScannerScreen({super.key});

  static const name = 'qrCodeScannerScreen';

  @override
  QrCodeScannerScreenState createState() => QrCodeScannerScreenState();
}

class QrCodeScannerScreenState extends ConsumerState<QrCodeScannerScreen>
    with WidgetsBindingObserver {
  final MobileScannerController controller = MobileScannerController(
    // required options for the scanner
    detectionSpeed: DetectionSpeed.noDuplicates,
    facing: CameraFacing.back,
    detectionTimeoutMs: 500,
  );

  StreamSubscription<Object?>? _subscription;
  String scanValue = '';

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // コントローラの準備が完了していない場合、コントローラを開始または停止しようとしない。
    // コントローラの準備が完了する前に、パーミッションダイアログがライフサイクルの変更をトリガする可能性があり。
    if (!controller.value.isInitialized) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        // アプリが再開されたら、 スキャナを再起動する。
        // バーコード・イベントのリスニングを再開すること。
        // _subscription = controller.barcodes.listen();

        unawaited(controller.start());
      case AppLifecycleState.inactive:
        // アプリが一時停止されると、スキャナを停止します。
        // バーコード・イベントの購読も停止します。
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(controller.stop());
    }
  }

  @override
  void initState() {
    super.initState();
    // Start listening to lifecycle changes.
    WidgetsBinding.instance.addObserver(this);

    // Start listening to the barcode events.
    // _subscription = controller.barcodes.listen(_handleBarcode);

    // Finally, start the scanner itself.
    unawaited(controller.start());
  }

  @override
  Future<void> dispose() async {
    // Stop listening to lifecycle changes.
    WidgetsBinding.instance.removeObserver(this);
    // Stop listening to the barcode events.
    unawaited(_subscription?.cancel());
    _subscription = null;
    // Dispose the widget itself.
    super.dispose();
    // Finally, dispose of the controller.
    await controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(qrCodeScannerStateNotifierProvider.notifier);
    final confirm = ref.watch(qrCodeScannerStateNotifierProvider
        .select((value) => value.confirmForceWrite));

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 4 / 3,
                child: MobileScanner(
                  controller: controller,
                  onDetect: (capture) {
                    final List<Barcode> barcodes = capture.barcodes;
                    final value = barcodes[0].rawValue;
                    if (value != null) {
                      // 検出した QR コードの値でデータを更新
                      setState(() {
                        scanValue = value;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              if (scanValue != '')
                ElevatedButton(
                  onPressed: () {
                    provider.confirmForceWrite();
                  },
                  child: const Text(
                    '保存する',
                    style: AppTextStyles.basic14TextStyle,
                  ),
                ),
            ],
          ),
          Visibility(
            visible: confirm,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '上書きします。よろしいですか？',
                    style: AppTextStyles.basic14TextStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            provider.cancelForceWrite();
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
                            provider.savePassData(
                              qrData: scanValue,
                              context: context,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 0, 128, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'OK',
                            style: AppTextStyles.buttonTextStyle,
                          ),
                        ),
                      )
                    ],
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
