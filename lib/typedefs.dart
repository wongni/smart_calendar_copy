import 'package:smart_calendar_copy/models.dart';

typedef EventAdder(Event event);
typedef EventRemover(Event event);
typedef EventUpdater(
  Event event, {
  bool complete,
  bool allDay,
  String id,
  String note,
  String name,
});
