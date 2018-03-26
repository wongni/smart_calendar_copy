// GENERATED CODE - DO NOT MODIFY BY HAND

part of events_repository.model.event_entity;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class EventEntityViewSerializer
// **************************************************************************

abstract class _$EventEntityViewSerializer implements Serializer<EventEntity> {
  Map toMap(EventEntity model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.id != null) {
        ret["id"] = model.id;
      }
      if (model.name != null) {
        ret["name"] = model.name;
      }
      if (model.allDay != null) {
        ret["allDay"] = model.allDay;
      }
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  EventEntity fromMap(Map map, {EventEntity model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! EventEntity) {
      model = createModel();
    }
    model.id = map["id"];
    model.name = map["name"];
    model.allDay = map["allDay"];
    return model;
  }

  String modelString() => "EventEntity";
}
