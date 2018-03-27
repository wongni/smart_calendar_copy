import 'package:smart_calendar_copy/models/models.dart';
import 'loading_reducer.dart';
import 'events_reducer.dart';
import 'tabs_reducer.dart';
import 'visibility_reducer.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
    isLoading: loadingReducer(state.isLoading, action),
    events: eventsReducer(state.events, action),
    activeFilter: visibilityReducer(state.activeFilter, action),
    activeTab: tabsReducer(state.activeTab, action),
  );
}