import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_calendar_copy/models.dart';
import 'package:smart_calendar_copy/repositories/events/events_repository.dart';

class StateContainer extends StatefulWidget {
  final AppState state;
  final EventsRepository repository;
  final Widget child;

  StateContainer({
    @required this.child,
    this.state,
    this.repository = const EventsRepository(
      fileStorage: const FileStorage(
        'inherited_widget_sample',
        getApplicationDocumentsDirectory,
      ),
    ),
  });

  static StateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
            as _InheritedStateContainer)
        .data;
  }

  @override
  StateContainerState createState() => new StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  AppState state;

  @override
  void initState() {
    state = widget.state ?? new AppState.loading();

    widget.repository
        .loadEvents()
        .then((loadedEvents) => setState(() => state =
            new AppState(events: loadedEvents.map(Event.fromEntity).toList())))
        .catchError((err) => setState(() => state.isLoading = false));

    super.initState();
  }

  void toggleAll() => setState(() => state.toggleAll());

  void clearCompleted() => setState(() => state.clearCompleted());

  void addEvent(Event event) => setState(() => state.events.add(event));

  void removeEvent(Event event) => setState(() => state.events.remove(event));

  void updateEvent(
    Event event, {
    bool complete,
    bool allDay,
    String id,
    String name,
    String note,
  }) =>
      setState(() {
        event.complete = complete ?? event.complete;
        event.allDay = allDay ?? event.allDay;
        event.id = id ?? event.id;
        event.name = name ?? event.name;
        event.note = note ?? event.note;
      });

  void updateVisibilityFilter(VisibilityFilter filter) =>
      setState(() => state.activeFilter = filter);

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);

    widget.repository
        .saveEvents(state.events.map((event) => event.toEntity()).toList());
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  })
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
