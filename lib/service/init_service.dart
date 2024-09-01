import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pass_manager/common/helper/local_auth_helper.dart';
import 'package:pass_manager/features/home/home_screen.dart';

class AppInit {
  AppInit({
    required GlobalKey<NavigatorState> navigatorKey,
    required LocalAuthHelper localAuthHelper,
  })  : _navigatorKey = navigatorKey,
        _localAuthHelper = localAuthHelper;

  final GlobalKey<NavigatorState> _navigatorKey;
  final LocalAuthHelper _localAuthHelper;

  BuildContext get _context => _navigatorKey.currentState!.context;

  Future<void> init() async {
    try {
      await authBio();

      _context.goNamed(HomeScreen.name);
    } catch (_) {}
  }

  Future<bool> authBio() async {
    final didAuth = await _localAuthHelper.authBio();
    if (!didAuth) {
      throw Exception();
    }
    return didAuth;
  }
}
