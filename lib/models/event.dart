import 'package:smart_calendar_copy/repositories/events/events_repository.dart';
import 'package:uuid/uuid.dart';

class Event {
  String id;
  String name;
  String note;
  bool allDay;
  bool complete;

  Event(this.name,
      {this.note, this.allDay = false, this.complete = false, String id})
      : this.id = id ?? new Uuid().v4();

  Event copyWith(
      {bool complete, String id, String name, String task, bool allDay}) {
    return new Event(
      name ?? this.name,
      note: note ?? this.note,
      complete: complete ?? this.complete,
      allDay: allDay ?? this.allDay,
      id: id ?? this.id,
    );
  }

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
