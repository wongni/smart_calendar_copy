import 'dart:async';
import 'dart:core';

import 'package:meta/meta.dart';
import 'file_storage.dart';
import 'event_entity.dart';
import 'web_client.dart';

class EventsRepository {
  final FileStorage fileStorage;
  final WebClient webClient;

  EventsRepository({
    @required this.fileStorage,
    this.webClient = const WebClient(),
  });

  Future<List<EventEntity>> loadEvents() async {
    try {
      return await fileStorage.loadEvents();
    } catch (e) {
      return webClient.fetchEvents();
    }
  }

  Future saveEvents(List<EventEntity> events) async {
    return Future.wait([
      fileStorage.saveEvents(events),
      webClient.postEvents(events),
    ]);
  }
}
