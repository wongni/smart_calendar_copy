import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/models.dart';
import 'package:smart_calendar_copy/screens/add_edit_screen.dart';
import 'package:smart_calendar_copy/typedefs.dart';

class DetailScreen extends StatelessWidget {
  final Event event;
  final Function onDelete;
  final EventAdder addEvent;
  final EventUpdater updateEvent;

  DetailScreen({
    @required this.event,
    @required this.onDelete,
    @required this.addEvent,
    @required this.updateEvent,
  })
      : super(key: AppKeys.eventDetailsScreen);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Event Details'),
        actions: [
          new IconButton(
            key: AppKeys.deleteEventButton,
            tooltip: 'Delete event',
            icon: new Icon(Icons.delete),
            onPressed: () {
              onDelete();
              Navigator.pop(context, event);
            },
          ),
        ],
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new ListView(
          children: <Widget>[
            new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: new Checkbox(
                    value: event.complete,
                    onChanged: (complete) {
                      updateEvent(event, complete: !event.complete);
                    },
                  ),
                ),
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                        child: new Text(
                          event.name,
                          key: AppKeys.detailsEventItemName,
                          style: Theme.of(context).textTheme.headline,
                        ),
                      ),
                      new Text(
                        event.note,
                        key: AppKeys.detailsEventItemNote,
                        style: Theme.of(context).textTheme.subhead,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Edit event',
        child: new Icon(Icons.edit),
        key: AppKeys.editEventFab,
        onPressed: () {
          Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (context) {
                return new AddEditScreen(
                  key: AppKeys.editEventScreen,
                  updateEvent: updateEvent,
                  addEvent: addEvent,
                  event: event,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
