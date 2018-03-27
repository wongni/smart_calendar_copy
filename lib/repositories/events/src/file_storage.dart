import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'event_entity.dart';

class FileStorage {
  final String tag;
  final Future<Directory> Function() getDirectory;

  const FileStorage(
    this.tag,
    this.getDirectory,
  );

  Future<List<EventEntity>> loadEvents() async {
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final events = (json['events'] as List<Map<String, dynamic>>)
        .map((event) => EventEntity.fromJson(event))
        .toList();

    return events;
  }

  Future<File> saveEvents(List<EventEntity> events) async {
    final file = await _getLocalFile();

    return file.writeAsString(new JsonEncoder().convert({
      'events': events.map((event) => event.toJson()).toList(),
    }));
  }

  Future<File> _getLocalFile() async {
    final dir = await getDirectory();

    return new File('${dir.path}/SmartCalendarAppStorage__$tag.json');
  }

  Future<FileSystemEntity> clean() async {
    final file = await _getLocalFile();

    return file.delete();
  }
}
