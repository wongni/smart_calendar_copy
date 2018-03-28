import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_calendar_copy/containers/app_loading.dart';
import 'package:smart_calendar_copy/containers/event_details.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/models/models.dart';
import 'package:smart_calendar_copy/presentation/event_item.dart';
import 'package:smart_calendar_copy/presentation/loading_indicator.dart';

class EventList extends StatelessWidget {
  final List<Event> events;
  final Function(Event, bool) onCheckboxChanged;
  final Function(Event) onRemove;
  final Function(Event) onUndoRemove;

  EventList({
    Key key,
    @required this.events,
    @required this.onCheckboxChanged,
    @required this.onRemove,
    @required this.onUndoRemove,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new AppLoading(builder: (context, loading) {
      return loading
          ? new LoadingIndicator(key: AppKeys.eventsLoading)
          : _buildListView();
    });
  }

  ListView _buildListView() {
    return new ListView.builder(
      key: AppKeys.eventList,
      itemCount: events.length,
      itemBuilder: (BuildContext context, int index) {
        final event = events[index];

        return new EventItem(
          event: event,
          onCheckboxChanged: (complete) => onCheckboxChanged(event, complete),
          onDismissed: (direction) => _removeEvent(context, event),
          onTab: () => _onEventTab(context, event),
        );
      },
    );
  }

  _removeEvent(BuildContext context, Event event) {
    onRemove(event);
    _showSnackbar(context, event);
  }

  _onEventTab(BuildContext context, Event event) {
    Navigator
        .of(context)
        .push(
          new MaterialPageRoute(
            builder: (context) => new EventDetails(id: event.id),
          ),
        )
        .then((removedEvent) => _showSnackbar(context, removedEvent));
  }

  _showSnackbar(context, event) {
    Scaffold.of(context).showSnackBar(
          new SnackBar(
            key: AppKeys.snackbar,
            duration: new Duration(seconds: 2),
            backgroundColor: Theme.of(context).backgroundColor,
            content: new Text(
              '${event.name} is deleted',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            action: new SnackBarAction(
              label: 'Undo',
              onPressed: () => onUndoRemove(event),
            ),
          ),
        );
  }
}
