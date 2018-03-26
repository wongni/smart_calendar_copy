import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:smart_calendar_copy/key_string.dart';

import '../elements/event_list_element.dart';
import 'test_screen.dart';
import '../utils.dart';

import '../elements/extra_actions_element.dart';
import '../elements/filters_element.dart';
import '../elements/stats_element.dart';

class HomeTestScreen extends TestScreen {
  final _filterButtonFinder = find.byValueKey(AppKeyString.filterButtonKey);
  final _extraActionsButtonFinder =
      find.byValueKey(AppKeyString.extraActionsButtonKey);
  final _eventsTabFinder = find.byValueKey(AppKeyString.eventTabKey);
  final _statsTabFinder = find.byValueKey(AppKeyString.statsTabKey);
  final _snackbarFinder = find.byValueKey(AppKeyString.snackbarKey);

  HomeTestScreen(FlutterDriver driver) : super(driver);

  @override
  Future<bool> isLoading({Duration timeout}) async {
    return new EventListElement(driver).isLoading;
  }

  @override
  Future<bool> isReady({Duration timeout}) {
    return new EventListElement(driver).isReady;
  }

  EventListElement get eventList {
    return new EventListElement(driver);
  }

  StatsElement get stats {
    return new StatsElement(driver);
  }

  EventListElement tapEventsTab() {
    driver.tap(_eventsTabFinder);

    return new EventListElement(driver);
  }

  StatsElement tapStatsTab() {
    driver.tap(_statsTabFinder);

    return new StatsElement(driver);
  }

  FiltersElement tapFilterButton() {
    driver.tap(_filterButtonFinder);

    return new FiltersElement(driver);
  }

  ExtraActionsElement tapExtraActionsButton(){
    driver.tap(_extraActionsButtonFinder);

    return new ExtraActionsElement(driver);
  }

  Future<bool> get snackbarVisible {
    return widgetExists(driver, _snackbarFinder);
  }
}
