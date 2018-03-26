import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:smart_calendar_copy/key_string.dart';

import 'test_element.dart';

class FiltersElement extends TestElement {
  final _allFilter = find.byValueKey(AppKeyString.allFilterKey);
  final _activeFilter = find.byValueKey(AppKeyString.activeFilterKey);
  final _completedFilter = find.byValueKey(AppKeyString.completedFilterKey);

  FiltersElement(FlutterDriver driver) : super(driver);

  Future<Null> tapShowAll() async {
    await driver.tap(_allFilter);
  }

  Future<Null> tapShowActive() async {
    await driver.tap(_activeFilter);
  }

  Future<Null> tapShowCompleted() async {
    await driver.tap(_completedFilter);
  }

}
