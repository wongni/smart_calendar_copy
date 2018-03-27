import 'package:smart_calendar_copy/models/models.dart';

List<Event> eventsSelector(AppState state) => state.events;

VisibilityFilter activeFilterSelector(AppState state) => state.activeFilter;

AppTab activeTabSelector(AppState state) => state.activeTab;

bool isLoadingSelector(AppState state) => state.isLoading;

bool allCompleteSelector(List<Event> events) =>
    events.every((event) => event.complete);

int numActiveSelector(List<Event> events) =>
    events.fold(0, (sum, event) => event.complete ? sum : sum + 1);

int numCompletedSelector(List<Event> events) =>
    events.fold(0, (sum, event) => !event.complete ? sum : sum + 1);

List<Event> filteredEventsSelector(
    List<Event> events, VisibilityFilter filter) {
  return events.where((event) {
    if (filter == VisibilityFilter.all) {
      return true;
    } else if (filter == VisibilityFilter.active) {
      return !event.complete;
    } else if (filter == VisibilityFilter.completed) {
      return event.complete;
    }
  }).toList();
}

Event eventSelector(List<Event> events, String id) {
  return events.firstWhere((event) => event.id == id);
}
