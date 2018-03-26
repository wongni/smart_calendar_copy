class AppKeyString {
  // Home Screens
  static const String homeScreenKey = '__homeScreen__';
  static const String addEventFabKey = '__addEventFab__';
  static const String snackbarKey = '__snackbar__';

  // Events
  static const String eventListKey = '__eventList__';
  static const String eventsLoadingKey = '__eventsLoading__';

  static String eventItemKey(String id) => 'EventItem__$id';

  static String eventItemCheckboxKey(String id) => 'EventItem__${id}__Checkbox';

  static String eventItemNameKey(String id) => 'EventItem__${id}__Name';

  static String eventItemNoteKey(String id) => 'EventItem__${id}__Note';

  // Tabs
  static const String tabsKey = '__tabs__';
  static const String eventTabKey = '__eventTab__';
  static const String statsTabKey = '__statsTab__';

  // Extra Actions
  static const String extraActionsButtonKey = '__extraActionsButton__';
  static const String markAllDoneKey = '__markAllDone__';
  static const String clearCompletedKey = '__clearCompleted__';

  // Filters
  static const String filterButtonKey = '__filterButton__';
  static const String allFilterKey = '__allFilter__';
  static const String activeFilterKey = '__activeFilter__';
  static const String completedFilterKey = '__completedFilter__';

  // Stats
  static const String statsCounterKey = '__statsCounter__';
  static const String statsLoadingKey = '__statsLoading__';
  static const String statsActiveItemsKey = '__statsActiveItems__';
  static const String statsCompletedItemsKey = '__statsCompletedItems__';

  // Details Screen
  static const String editEventFabKey = '__editEventFab__';
  static const String deleteEventFabKey = '__deleteEventFab__';
  static const String eventDetailsScreenKey = '__eventDetailsScreen__';
  static const String detailsEventCheckboxKey = 'DetailsEvent__Checkbox';
  static const String detailsEventNameKey = 'DetailsEvent__Name';
  static const String detailsEventNoteKey = 'DetailsEvent__Note';

  // Add Screen
  static const String addEventScreenKey = '__addEventScreen__';
  static const String saveNewEventKey = '__saveNewEvent__';

  // Edit Screen
  static const String editEventScreenKey = '__editEventScreen__';
  static const String saveEventFabKey = '__saveEventFab__';
}
