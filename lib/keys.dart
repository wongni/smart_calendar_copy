import 'package:flutter/widgets.dart';

import 'key_string.dart';

class AppKeys {
  // Home Screens
  static final homeScreen = const Key(AppKeyString.homeScreenKey);
  static final addEventFab = const Key(AppKeyString.addEventFabKey);
  static final snackbar = const Key(AppKeyString.snackbarKey);

  // Events
  static final eventList = const Key(AppKeyString.eventListKey);
  static final eventsLoading = const Key(AppKeyString.eventsLoadingKey);
  static final eventItem = (String id) => new Key(AppKeyString.eventItemKey(id));
  static final eventItemCheckbox =
      (String id) => new Key(AppKeyString.eventItemCheckboxKey(id));
  static final eventItemName =
      (String id) => new Key(AppKeyString.eventItemNameKey(id));
  static final eventItemNote =
      (String id) => new Key(AppKeyString.eventItemNoteKey(id));

  // Tabs
  static final tabs = const Key(AppKeyString.tabsKey);
  static final eventTab = const Key(AppKeyString.eventTabKey);
  static final statsTab = const Key(AppKeyString.statsTabKey);

  // Extra Actions
  static final extraActionsButton =
      const Key(AppKeyString.extraActionsButtonKey);
  static final toggleAll = const Key(AppKeyString.markAllDoneKey);
  static final clearCompleted = const Key(AppKeyString.clearCompletedKey);

  // Filters
  static final filterButton = const Key(AppKeyString.filterButtonKey);
  static final allFilter = const Key(AppKeyString.allFilterKey);
  static final activeFilter = const Key(AppKeyString.activeFilterKey);
  static final completedFilter = const Key(AppKeyString.completedFilterKey);

  // Stats
  static final statsCounter = const Key(AppKeyString.statsCounterKey);
  static final statsLoading = const Key(AppKeyString.statsLoadingKey);
  static final statsNumActive = const Key(AppKeyString.statsActiveItemsKey);
  static final statsNumCompleted =
      const Key(AppKeyString.statsCompletedItemsKey);

  // Details Screen
  static final editEventFab = const Key(AppKeyString.editEventFabKey);
  static final deleteEventButton = const Key(AppKeyString.deleteEventFabKey);
  static final eventDetailsScreen =
      const Key(AppKeyString.eventDetailsScreenKey);
  static final detailsEventItemCheckbox =
      const Key(AppKeyString.detailsEventCheckboxKey);
  static final detailsEventItemName =
      const Key(AppKeyString.detailsEventNameKey);
  static final detailsEventItemNote =
      const Key(AppKeyString.detailsEventNoteKey);

  // Add Screen
  static final addEventScreen = const Key(AppKeyString.addEventScreenKey);
  static final saveNewEvent = const Key(AppKeyString.saveNewEventKey);

  // Edit Screen
  static final editEventScreen = const Key(AppKeyString.editEventScreenKey);
  static final saveEventFab = const Key(AppKeyString.saveEventFabKey);
}
