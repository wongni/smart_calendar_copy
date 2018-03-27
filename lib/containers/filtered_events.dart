import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:smart_calendar_copy/actions/actions.dart';
import 'package:smart_calendar_copy/models/models.dart';
import 'package:smart_calendar_copy/presentation/event_list.dart';
import 'package:smart_calendar_copy/selectors/selectors.dart';

class FilteredEvents extends StatelessWidget {
  FilteredEvents({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return new EventList(
          events: vm.events,
          onCheckboxChanged: vm.onCheckboxChanged,
          onRemove: vm.onRemove,
          onUndoRemove: vm.onUndoRemove,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Event> events;
  final bool loading;
  final Function(Event, bool) onCheckboxChanged;
  final Function(Event) onRemove;
  final Function(Event) onUndoRemove;

  _ViewModel({
    this.events,
    this.loading,
    this.onCheckboxChanged,
    this.onRemove,
    this.onUndoRemove,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
        events: filteredEventsSelector(
          eventsSelector(store.state), activeFilterSelector(store.state),
        ),
        loading: isLoadingSelector(store.state),
        onCheckboxChanged: (event, complete) =>
            store.dispatch(new UpdateEventAction(
              event.id,
              event.copyWith(complete: complete),
            )),
        onRemove: (event) =>
            store.dispatch(new DeleteEventAction(event.id)),
        onUndoRemove: (event) =>
            store.dispatch(new AddEventAction(event))
    );
  }
}
