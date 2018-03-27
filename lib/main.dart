//import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:smart_calendar_copy/app.dart';
//import 'package:smart_calendar_copy/repositories/events/events_repository.dart';
//import 'package:uuid/uuid.dart';
//
//void main({bool integrationTest = false}) {
//  runApp(
//    new SmartCalendarCopyApp(
//      repository: new EventsRepository(
//        fileStorage: new FileStorage(
//          'smart_calendar_copy_app${integrationTest ? new Uuid().v4() : ''}',
//          getApplicationDocumentsDirectory,
//        ),
//        webClient: new WebClient(),
//      ),
//    ),
//  );
//}

import 'package:flutter/material.dart';
import 'package:smart_calendar_copy/app.dart';
import 'package:smart_calendar_copy/state_container.dart';

void main() {
  runApp(new StateContainer(
    child: new InheritedWidgetApp(),
  ));
}