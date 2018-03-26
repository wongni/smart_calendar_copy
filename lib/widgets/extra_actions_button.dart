import 'package:flutter/material.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/models.dart';

class ExtraActionsButton extends StatelessWidget {
  final PopupMenuItemSelected<ExtraAction> onSelected;
  final bool allComplete;
  final bool hasCompletedEvents;

  ExtraActionsButton({
    this.onSelected,
    this.allComplete = false,
    this.hasCompletedEvents = true,
    Key key,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new PopupMenuButton<ExtraAction>(
      key: AppKeys.extraActionsButton,
      onSelected: onSelected,
      itemBuilder: (context) {
        return <PopupMenuItem<ExtraAction>>[
          new PopupMenuItem(
            key: AppKeys.toggleAll,
            value: ExtraAction.toggleAllComplete,
            child: new Text(
              allComplete ? 'Mark all incomplete' : 'Mark all complete',
            ),
          ),
          new PopupMenuItem(
            key: AppKeys.clearCompleted,
            value: ExtraAction.clearCompleted,
            child: new Text(
              'Clear completed',
            ),
          ),
        ];
      },
    );
  }
}
