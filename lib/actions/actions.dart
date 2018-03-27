import 'package:smart_calendar_copy/models/models.dart';

class ClearCompletedAction {}

class ToggleAllAction {}

class LoadEventsAction {}

class EventsNotLoadedAction {}

class EventsLoadedAction {
  final List<Event> events;

  EventsLoadedAction(this.events);

  @override
  String toString() {
    return 'EventsLoadedAction{events: $events}';
  }
}

class UpdateEventAction {
  final String id;
  final Event updatedEvent;

  UpdateEventAction(this.id, this.updatedEvent);

  @override
  String toString() {
    return 'UpdateEventAction{id: $id, updatedEvent: $updatedEvent}';
  }
}

class DeleteEventAction {
  final String id;

  DeleteEventAction(this.id);

  @override
  String toString() {
    return 'DeleteEventAction{id: $id}';
  }
}

class AddEventAction {
  final Event event;

  AddEventAction(this.event);

  @override
  String toString() {
    return 'AddEventAction{event: $event}';
  }
}

class UpdateFilterAction {
  final VisibilityFilter newFilter;

  UpdateFilterAction(this.newFilter);

  @override
  String toString() {
    return 'UpdateFilterAction{newFilter: $newFilter}';
  }
}

class UpdateTabAction {
  final AppTab newTab;

  UpdateTabAction(this.newTab);

  @override
  String toString() {
    return 'UpdateTabAction{newTab: $newTab}';
  }
}
