import 'dart:async';

import 'package:flutter_driver/src/driver/driver.dart';
import 'package:smart_calendar_copy/key_string.dart';

import 'event_item_element.dart';
import 'test_element.dart';
import '../utils.dart';

class EventListElement extends TestElement {
  final _todoListFinder = find.byValueKey(AppKeyString.eventListKey);
  final _loadingFinder = find.byValueKey(AppKeyString.eventsLoadingKey);

  EventListElement(FlutterDriver driver) : super(driver);

  Future<bool> get isLoading {
    return driver.runUnsynchronized(() {
      return widgetExists(driver, _loadingFinder);
    });
  }

  Future<bool> get isReady => widgetExists(driver, _todoListFinder);

  EventItemElement eventItem(String id) => new EventItemElement(id, driver);

  EventItemElement eventItemAbsent(String id) => new EventItemElement(id, driver);

}