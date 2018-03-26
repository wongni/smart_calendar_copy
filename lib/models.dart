import 'package:smart_calendar_copy/repositories/events/events_repository.dart';
import 'package:uuid/uuid.dart';

class AppState {
  bool isLoading;
  List<Event> events;

  AppState({
    this.isLoading = false,
    this.events = const [],
  });

  factory AppState.loading() => new AppState(isLoading: true);

  @override
  String toString() {
    return 'AppState{event:$events, isLoading: $isLoading}';
  }

  List<Event> filteredEvents(VisibilityFilter activeFilter) {
    return events.where((event) {
      switch (activeFilter) {
        case VisibilityFilter.all:
          return true;
        case VisibilityFilter.completed:
          return event.complete;
        case VisibilityFilter.active:
          return !event.complete;
      }
    }).toList();
  }

  void toggleAll() {
    final allComplete = this.allComplete;
    events.forEach((event) => event.complete = !allComplete);
  }

  void clearCompleted() {
    events.removeWhere((event) => event.complete);
  }

  bool get allComplete => events.every((event) => event.complete);
  bool get hasCompletedEvents => events.any((event) => event.complete);
  int get numActive => events.fold(0, (sum, event) => event.complete ? sum : sum + 1);
  int get numCompleted => events.length - numActive;
}

class Event {
  String id;
  String name;
  String note;
  bool allDay;
  bool complete;

  Event(this.name,
      {this.note, this.allDay = false, this.complete = false, String id})
      : this.id = id ?? new Uuid().v4();

  @override
  String toString() {
    return 'Todo{id: $id, name: $name, note: $note, allDay: $allDay complete: $complete}';
  }

  static Event fromEntity(EventEntity entity) {
    return new Event(
      entity.name,
      note: entity.note,
      allDay: entity.allDay ?? false,
      id: entity.id,
      complete: entity.complete ?? false,
    );
  }

  EventEntity toEntity() {
    return new EventEntity(id, name, note, allDay, complete);
  }
}

enum AppTab { events, stats }

enum ExtraAction { toggleAllComplete, clearCompleted }

enum VisibilityFilter { all, active, completed }
