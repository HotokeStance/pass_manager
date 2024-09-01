import 'package:flutter/services.dart';

Future<void> copyString(String targetString) async {
  await Clipboard.setData(ClipboardData(text: targetString));
}
