import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_calendar_copy/containers/edit_event.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/models/models.dart';

class DetailsScreen extends StatelessWidget {
  final Event event;
  final Function onRemove;
  final Function(bool) toggleCompleted;

  DetailsScreen({
    Key key,
    @required this.event,
    @required this.onRemove,
    @required this.toggleCompleted,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Event Details'),
        actions: <Widget>[
          new IconButton(
            key: AppKeys.deleteEventButton,
            icon: new Icon(Icons.delete),
            onPressed: () {
              onRemove();
              Navigator.pop(context, event);
            },
          ),
        ],
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: new Checkbox(
                value: event.complete,
                onChanged: toggleCompleted,
              ),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Hero(
                  tag: event.name + '__heroTag',
                  child: new Container(
//                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 16.0,
                    ),
                    child: new Text(
                      event.name,
                      key: AppKeys.detailsEventItemName,
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ),
                ),
                new Text(
                  event.note,
                  key: AppKeys.detailsEventItemNote,
                  style: Theme.of(context).textTheme.subhead,
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        key: AppKeys.editEventFab,
        tooltip: 'Edit Event',
        child: new Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context).push(
            new MaterialPageRoute(builder: (context) {
              return new EditEvent(event: event);
            }),
          );
        },
      ),
    );
  }
}
