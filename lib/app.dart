import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_calendar_copy/repositories/events/events_repository.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/localization.dart';
import 'package:smart_calendar_copy/models.dart';
import 'package:smart_calendar_copy/routes.dart';
import 'package:smart_calendar_copy/screens/add_edit_screen.dart';
import 'package:smart_calendar_copy/screens/home_screen.dart';

class SmartCalendarCopyApp extends StatefulWidget {
  final EventsRepository repository;

  SmartCalendarCopyApp({@required this.repository});

  @override
  _SmartCalendarCopyAppState createState() => new _SmartCalendarCopyAppState();
}

class _SmartCalendarCopyAppState extends State<SmartCalendarCopyApp> {
  AppState appState = new AppState.loading();

  @override
  void initState() {
    super.initState();

    widget.repository.loadEvents().then((loadedEvents) {
      setState(() {
        appState = new AppState(
          events: loadedEvents.map(Event.fromEntity).toList(),
        );
      });
    }).catchError((err) {
      setState(() {
        appState.isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: new AppLocalizations().appTitle,
      localizationsDelegates: [
        new AppLocalizationsDelegate(),
      ],
      routes: {
        AppRoutes.home: (context) {
          return new HomeScreen(
            key: AppKeys.homeScreen,
            appState: appState,
            updateEvent: updateEvent,
            addEvent: addEvent,
            removeEvent: removeEvent,
            toggleAll: toggleAll,
            clearCompleted: clearCompleted,
          );
        },
        AppRoutes.addEvent: (context) {
          return new AddEditScreen(
            key: AppKeys.addEventScreen,
            updateEvent: updateEvent,
            addEvent: addEvent,
          );
        },
      },
    );
  }

  void addEvent(Event event) {
    setState(() {
      appState.events.add(event);
    });
  }

  void updateEvent(
    Event event, {
    String id,
    String name,
    String note,
    bool allDay,
    bool complete,
  }) {
    setState(() {
      event.id = id ?? event.id;
      event.name = name ?? event.name;
      event.note = note ?? event.note;
      event.allDay = allDay ?? event.allDay;
      event.complete = complete ?? event.complete;
    });
  }

  void removeEvent(Event event) {
    setState(() {
      appState.events.remove(event);
    });
  }

  void toggleAll() {
    setState(() {
      appState.toggleAll();
    });
  }

  void clearCompleted() {
    setState(() {
      appState.clearCompleted();
    });
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);

    widget.repository.saveEvents(
      appState.events.map((event) => event.toEntity()).toList(),
    );
  }
}
