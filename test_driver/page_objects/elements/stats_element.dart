import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:smart_calendar_copy/key_string.dart';

import 'test_element.dart';

class StatsElement extends TestElement {
  final _activeItemsFinder = find.byValueKey(AppKeyString.statsActiveItemsKey);
  final _completedItemsFinder =
      find.byValueKey(AppKeyString.statsCompletedItemsKey);

  StatsElement(FlutterDriver driver) : super(driver);

  Future<int> get numActive async =>
      int.parse(await driver.getText(_activeItemsFinder));

  Future<int> get numCompleted async =>
      int.parse(await driver.getText(_completedItemsFinder));
}
