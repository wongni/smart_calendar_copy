import 'package:redux/redux.dart';
import 'package:smart_calendar_copy/actions/actions.dart';
import 'package:smart_calendar_copy/models/models.dart';
import 'package:smart_calendar_copy/selectors/selectors.dart';

final eventsReducer = combineTypedReducers([
  new ReducerBinding<List<Event>, AddEventAction>(_addEvent),
  new ReducerBinding<List<Event>, DeleteEventAction>(_deleteEvent),
  new ReducerBinding<List<Event>, UpdateEventAction>(_updateEvent),
  new ReducerBinding<List<Event>, ToggleAllAction>(_toggleAll),
  new ReducerBinding<List<Event>, ClearCompletedAction>(_clearCompleted),
  new ReducerBinding<List<Event>, EventsLoadedAction>(_setLoadedEvents),
  new ReducerBinding<List<Event>, EventsNotLoadedAction>(_setNoEvents),
]);

List<Event> _addEvent(List<Event> events, AddEventAction action) {
  return new List.from(events)..add(action.event);
}

List<Event> _deleteEvent(List<Event> events, DeleteEventAction action) {
  return events.where((event) => event.id != action.id).toList();
}

List<Event> _updateEvent(List<Event> events, UpdateEventAction action) {
  return events
      .map((event) => event.id == action.id ? action.updatedEvent : event)
      .toList();
}

List<Event> _toggleAll(List<Event> events, ToggleAllAction action) {
  final allComplete = allCompleteSelector(events);

  return events.map((event) => event.copyWith(complete: !allComplete)).toList();
}

List<Event> _clearCompleted(List<Event> events, ClearCompletedAction action) {
  return events.where((event) => !event.complete).toList();
}

List<Event> _setLoadedEvents(List<Event> events, EventsLoadedAction action) {
  return action.events;
}

List<Event> _setNoEvents(List<Event> events, EventsNotLoadedAction action) {
  return [];
}
