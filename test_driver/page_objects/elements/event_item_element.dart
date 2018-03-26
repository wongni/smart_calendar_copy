import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:smart_calendar_copy/key_string.dart';

import '../screens/details_test_screen.dart';
import 'test_element.dart';
import '../utils.dart';

class EventItemElement extends TestElement {
  final String id;

  EventItemElement(this.id, FlutterDriver driver) : super(driver);

  SerializableFinder get _nameFinder => find.byValueKey(AppKeyString.eventItemNameKey(id));

  SerializableFinder get _noteFinder => find.byValueKey(AppKeyString.eventItemNoteKey(id));

  SerializableFinder get _checkboxFinder => find.byValueKey(AppKeyString.eventItemCheckboxKey(id));

  SerializableFinder get _eventItemFinder => find.byValueKey(AppKeyString.eventItemKey(id));

  Future<bool> get isVisible => widgetExists(driver, _eventItemFinder);

  Future<bool> get isAbsent => widgetAbsent(driver, _eventItemFinder);

  Future<String> get name async => await driver.getText(_nameFinder);

  Future<String> get note async => await driver.getText(_noteFinder);

  Future<EventItemElement> tapCheckbox() async {
    await driver.tap(_checkboxFinder);
    await driver.waitUntilNoTransientCallbacks();

    return this;
  }

  DetailsTestScreen tap() {
    driver.tap(_nameFinder);

    return new DetailsTestScreen(driver);
  }
}