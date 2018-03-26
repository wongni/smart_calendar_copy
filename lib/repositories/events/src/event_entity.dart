library events_repository.model.event_entity;

import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:uuid/uuid.dart';

part 'event_entity.g.dart';

@GenSerializer(
  ignore: const ['viewSerializer'],
)
class EventEntityViewSerializer extends Serializer<EventEntity>
    with _$EventEntityViewSerializer {
  @override
  EventEntity createModel() {
    return new EventEntity(new Uuid().v4(), '', '', false, false);
  }
}

class EventEntity {
  String id;
  String name;
  String note;
  bool allDay;
  bool complete;

  EventEntity(this.id, this.name, this.note, this.allDay, this.complete);

  @override
  String toString() =>
      'EventEntity{allDay: $allDay, complete: $complete, name: $name, note: $note, id: $id}';

  static EventEntityViewSerializer viewSerializer =
      new EventEntityViewSerializer();

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'note': note,
      'allDay': allDay,
      'complete': complete,
    };
  }

  static EventEntity fromJson(Map<String, Object> json) {
    return new EventEntity(
      json['id'] as String,
      json['name'] as String,
      json['note'] as String,
      json['allDay'] as bool,
      json['complete'] as bool,
    );
  }
}
