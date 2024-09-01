import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pass_manager/common/helper/local_auth_helper.dart';
import 'package:pass_manager/common/router.dart';
import 'package:pass_manager/service/init_service.dart';

class InitScreen extends HookConsumerWidget {
  const InitScreen({super.key});

  static String name = 'init';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        AppInit(
          localAuthHelper: ref.read(localAuthHelperProvider),
          navigatorKey: ref.read(navigatorKeyProvider),
        ).init();
        return;
      },
      const [],
    );

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
