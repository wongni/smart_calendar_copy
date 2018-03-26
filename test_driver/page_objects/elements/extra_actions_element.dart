import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:smart_calendar_copy/key_string.dart';

import 'test_element.dart';

class ExtraActionsElement extends TestElement {
  final _toggleAll = find.byValueKey(AppKeyString.markAllDoneKey);
  final _clearCompleted = find.byValueKey(AppKeyString.clearCompletedKey);

  ExtraActionsElement(FlutterDriver driver) : super(driver);

  Future<ExtraActionsElement> tapToggleAll() async {
    await driver.tap(_toggleAll);

    return this;
  }

  Future<ExtraActionsElement> tapCleanCompleted() async {
    await driver.tap(_clearCompleted);

    return this;
  }
}