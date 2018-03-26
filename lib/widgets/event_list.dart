import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/models.dart';
import 'package:smart_calendar_copy/screens/detail_screen.dart';
import 'package:smart_calendar_copy/typedefs.dart';
import 'package:smart_calendar_copy/widgets/event_item.dart';

class EventList extends StatelessWidget {
  final List<Event> events;
  final bool loading;
  final EventAdder addEvent;
  final EventRemover removeEvent;
  final EventUpdater updateEvent;

  EventList({
    @required this.events,
    @required this.loading,
    @required this.addEvent,
    @required this.removeEvent,
    @required this.updateEvent,
  })
      : super(key: AppKeys.eventList);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: loading
          ? new Center(
              child: new CircularProgressIndicator(
                key: AppKeys.eventsLoading,
              ),
            )
          : new ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return new EventItem(
                  event: event,
                  onDismissed: (direction) {
                    _removeEvent(context, event);
                  },
                  onTap: () {
                    Navigator.of(context).push(
                      new MaterialPageRoute(builder: (_) {
                        return new DetailScreen(
                          event: event,
                          onDelete: () => _removeEvent(context, event),
                          addEvent: addEvent,
                          updateEvent: updateEvent,
                        );
                      })
                    );
                  },
                  onCheckboxChanged: (complete) {
                    updateEvent(event, complete: !event.complete);
                  },
                );
              },
            ),
    );
  }

  void _removeEvent(BuildContext context, Event event) {
    removeEvent(event);

    Scaffold.of(context).showSnackBar(
          new SnackBar(
            key: AppKeys.snackbar,
            duration: new Duration(seconds: 2),
            backgroundColor: Theme.of(context).backgroundColor,
            content: new Text(
              'Deleted ${event.name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            action: new SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  addEvent(event);
                }),
          ),
        );
  }
}
