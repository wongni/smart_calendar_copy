import 'package:flutter/material.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/models.dart';

class EventItem extends StatelessWidget {
  final Event event;
  final Function onDismissed;
  final Function onTap;
  final Function onCheckboxChanged;

  EventItem({
    Key key,
    this.event,
    this.onDismissed,
    this.onTap,
    this.onCheckboxChanged,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Dismissible(
      key: AppKeys.eventItem(event.id),
      onDismissed: onDismissed,
      child: new ListTile(
        onTap: onTap,
        leading: new Checkbox(
          value: event.complete,
          onChanged: onCheckboxChanged,
          key: AppKeys.eventItemCheckbox(event.id),
        ),
        title: new Text(
          event.name,
          key: AppKeys.eventItemName(event.id),
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: new Text(
          event.note,
          key: AppKeys.eventItemNote(event.id),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subhead,
        ),
      ),
    );
  }
}
