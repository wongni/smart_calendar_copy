import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/models.dart';
import 'package:smart_calendar_copy/typedefs.dart';

class AddEditScreen extends StatelessWidget {
  static final formKey = new GlobalKey<FormState>();
  static final nameKey = new GlobalKey<FormFieldState<String>>();
  static final noteKey = new GlobalKey<FormFieldState<String>>();

  final Event event;
  final EventAdder addEvent;
  final EventUpdater updateEvent;

  bool get isEditing => event != null;

  AddEditScreen({
    Key key,
    this.event,
    @required this.addEvent,
    @required this.updateEvent,
  })
      : super(key: key ?? AppKeys.addEventScreen);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(isEditing ? 'Edit Event' : 'Add Event'),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          autovalidate: false,
          onWillPop: () {
            return new Future(() => true);
          },
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                initialValue: event != null ? event.name : '',
                key: nameKey,
                autofocus: isEditing ? false : true,
                style: Theme.of(context).textTheme.headline,
                decoration: new InputDecoration(
                  hintText: 'What\'s the name of event',
                ),
                validator: (val) =>
                    val.trim().isEmpty ? 'Please enter some text' : null,
              ),
              new TextFormField(
                initialValue: event != null ? event.note : '',
                key: noteKey,
                maxLines: 10,
                style: Theme.of(context).textTheme.subhead,
                decoration: new InputDecoration(
                  hintText: 'Additional Notes...',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: isEditing ? 'Save changes' : 'Add event',
        child: new Icon(isEditing ? Icons.check : Icons.add),
        onPressed: () {
          final form = formKey.currentState;
          if (form.validate()) {
            final name = nameKey.currentState.value;
            final note = noteKey.currentState.value;

            if (isEditing) {
              updateEvent(event, name: name, note: note);
            } else {
              addEvent(new Event(
                name,
                note: note,
              ));
            }

            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
