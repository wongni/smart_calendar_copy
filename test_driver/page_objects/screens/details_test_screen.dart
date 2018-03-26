import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:smart_calendar_copy/key_string.dart';

import '../utils.dart';
import 'test_screen.dart';
import 'edit_test_screen.dart';

class DetailsTestScreen extends TestScreen {
  final _detailsScreenFinder = find.byValueKey(AppKeyString.eventDetailsScreenKey);
  final _deleteButtonFinder = find.byValueKey(AppKeyString.deleteEventFabKey);
  final _checkboxFinder = find.byValueKey(AppKeyString.detailsEventCheckboxKey);
  final _nameFinder = find.byValueKey(AppKeyString.detailsEventNameKey);
  final _noteFinder = find.byValueKey(AppKeyString.detailsEventNoteKey);
  final _editEventFabFinder = find.byValueKey(AppKeyString.editEventFabKey);
  final _backButtonFinder = find.byTooltip('Back');

  DetailsTestScreen(FlutterDriver driver) : super(driver);

  @override
  Future<bool> isReady({Duration timeout}) {
    return widgetExists(driver, _detailsScreenFinder);
  }

  Future<String> get name => driver.getText(_nameFinder);

  Future<String> get note => driver.getText(_noteFinder);

  Future<DetailsTestScreen> tabCheckbox() async {
    await driver.tap(_checkboxFinder);

    return this;
  }

  EditTestScreen tapEditEventButton() {
    driver.tap(_editEventFabFinder);

    return new EditTestScreen(driver);
  }

  Future<Null> tapDeleteButton() async {
    await driver.tap(_deleteButtonFinder);
  }

  Future<Null> tapBackButton() async {
    await driver.tap(_backButtonFinder);
  }
}