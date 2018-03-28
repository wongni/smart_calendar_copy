import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:smart_calendar_copy/actions/actions.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/models/models.dart';
import 'package:smart_calendar_copy/presentation/details_screen.dart';
import 'package:smart_calendar_copy/selectors/selectors.dart';

class EventDetails extends StatelessWidget {
  final String id;

  EventDetails({
    Key key,
    @required this.id,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
      ignoreChange: (state) => eventSelector(eventsSelector(state), id) == null,
      converter: (Store<AppState> store) {
        return new _ViewModel.from(store, id);
      },
      builder: (_, _ViewModel vm) => new DetailsScreen(
        key: AppKeys.eventDetailsScreen,
        event: vm.event,
        onRemove: vm.onRemove,
        toggleCompleted: vm.toggleCompleted,
      ),
    );
  }
}

class _ViewModel {
  final Event event;
  final Function onRemove;
  final Function(bool) toggleCompleted;

  _ViewModel({
    @required this.event,
    @required this.onRemove,
    @required this.toggleCompleted,
  });

  factory _ViewModel.from(Store<AppState> store, String id) {
    final Event event = eventSelector(eventsSelector(store.state), id);

    return new _ViewModel(
      event: event,
      onRemove: () => store.dispatch(new DeleteEventAction(id)),
      toggleCompleted: (isComplete) => store.dispatch(
          new UpdateEventAction(id, event.copyWith(complete: isComplete),)),
    );
  }
}
