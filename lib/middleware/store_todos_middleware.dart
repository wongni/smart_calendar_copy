import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:smart_calendar_copy/actions/actions.dart';
import 'package:smart_calendar_copy/models/models.dart';
import 'package:smart_calendar_copy/repositories/events/events_repository.dart';
import 'package:smart_calendar_copy/selectors/selectors.dart';

List<Middleware<AppState>> createStoreEventsMiddleware([
  EventsRepository repository = const EventsRepository(
    fileStorage: const FileStorage(
      'redux_sample_app',
      getApplicationDocumentsDirectory,
    ),
  ),
]) {
  final saveEvents = _createSaveEvents(repository);
  final loadEvents = _createLoadEvents(repository);

  return combineTypedMiddleware([
    new MiddlewareBinding<AppState, LoadEventsAction>(loadEvents),
    new MiddlewareBinding<AppState, AddEventAction>(saveEvents),
    new MiddlewareBinding<AppState, ClearCompletedAction>(saveEvents),
    new MiddlewareBinding<AppState, ToggleAllAction>(saveEvents),
    new MiddlewareBinding<AppState, UpdateEventAction>(saveEvents),
    new MiddlewareBinding<AppState, EventsLoadedAction>(saveEvents),
    new MiddlewareBinding<AppState, DeleteEventAction>(saveEvents),
  ]);
}

Middleware<AppState> _createSaveEvents(EventsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.saveEvents(
      eventsSelector(store.state).map((event) => event.toEntity()).toList(),
    );
  };
}

Middleware<AppState> _createLoadEvents(EventsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadEvents().then(
      (events) {
        store.dispatch(
          new EventsLoadedAction(
            events.map(Event.fromEntity).toList(),
          ),
        );
      },
    ).catchError((_) => store.dispatch(new EventsNotLoadedAction()));

    next(action);
  };
}
