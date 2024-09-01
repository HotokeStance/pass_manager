import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pass_manager/features/add/add_pass_screen.dart';
import 'package:pass_manager/features/home/home_screen.dart';
import 'package:pass_manager/features/init/Init_screen.dart';
import 'package:pass_manager/features/qr_code/make_qr_code_screen.dart';
import 'package:pass_manager/features/qr_code_scanner/qr_code_scanner_screen.dart';

/// アプリのルートナビゲーションキー
final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>(debugLabel: 'root');
});

final routerProvider = Provider(
  (ref) => GoRouter(
    debugLogDiagnostics: true,
    restorationScopeId: 'router',
    initialLocation: '/init',
    navigatorKey: ref.watch(navigatorKeyProvider),
    routes: [
      GoRoute(
        name: InitScreen.name,
        path: '/init',
        builder: (context, state) {
          return const InitScreen();
        },
      ),
      GoRoute(
        name: HomeScreen.name,
        path: HomeScreen.name,
        builder: (context, state) {
          return const HomeScreen();
        },
        routes: [
          GoRoute(
            name: AddPassScreen.name,
            path: AddPassScreen.name,
            builder: (context, state) {
              return const AddPassScreen();
            },
          ),
          GoRoute(
            name: MakeQrCodeScreen.name,
            path: MakeQrCodeScreen.name,
            builder: (context, state) {
              return const MakeQrCodeScreen();
            },
          ),
          GoRoute(
            name: QrCodeScannerScreen.name,
            path: QrCodeScannerScreen.name,
            builder: (context, state) {
              return const QrCodeScannerScreen();
            },
          )
        ],
      )
    ],
  ),
);
