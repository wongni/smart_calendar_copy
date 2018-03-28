import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/models/models.dart';

typedef OnFilterSelect = Function(VisibilityFilter newFilter);

class ExtraActionButton extends StatelessWidget {
  final PopupMenuItemSelected<ExtraAction> onSelected;
  final bool allComplete;

  ExtraActionButton({
    Key key,
    @required this.onSelected,
    this.allComplete = false,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new PopupMenuButton<ExtraAction>(
      key: AppKeys.extraActionsButton,
      tooltip: 'Extra actions',
      onSelected: onSelected,
      itemBuilder: (context) {
        return [
          new PopupMenuItem(
            key: AppKeys.toggleAll,
            value: ExtraAction.toggleAllComplete,
            child: new Text(
              'Mark all ${allComplete ? 'incomplete' : 'complete'}',
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
