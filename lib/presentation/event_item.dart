import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/models/models.dart';

class EventItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTab;
  final ValueChanged<bool> onCheckboxChanged;
  final Event event;

  EventItem({
    @required this.onDismissed,
    @required this.onTab,
    @required this.onCheckboxChanged,
    @required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return new Dismissible(
      key: AppKeys.eventItem(event.id),
      onDismissed: onDismissed,
      child: new ListTile(
        onTap: onTab,
        leading: new Checkbox(
          key: AppKeys.eventItemCheckbox(event.id),
          value: event.complete,
          onChanged: onCheckboxChanged,
        ),
        title: new Hero(
          tag: event.name + '__heroTag',
          child: new Container(
            width: MediaQuery.of(context).size.width,
            child: new Text(
              event.name,
              key: AppKeys.eventItemName(event.id),
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
        subtitle: new Text(
          event.note,
          key: AppKeys.eventItemNote(event.id),
          style: Theme.of(context).textTheme.subhead,
        ),
      ),
    );
  }
}
