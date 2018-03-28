import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:smart_calendar_copy/actions/actions.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/models/models.dart';
import 'package:smart_calendar_copy/presentation/add_edit_screen.dart';

class EditEvent extends StatelessWidget {
  final Event event;

  EditEvent({
    Key key,
    @required this.event,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, OnSaveCallback>(
      converter: (Store<AppState> store) {
        return (String name, String note) {
          store.dispatch(
            new UpdateEventAction(
              event.id,
              event.copyWith(
                name: name,
                note: note,
              ),
            ),
          );
        };
      },
      builder: (context, onSave) {
        return new AddEditScreen(
          key: AppKeys.editEventScreen,
          event: event,
          onSave: onSave,
          isEditing: true,
        );
      },
    );
  }
}
