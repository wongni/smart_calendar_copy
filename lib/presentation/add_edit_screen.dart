import 'package:flutter/material.dart';
import 'package:smart_calendar_copy/models/models.dart';

typedef OnSaveCallback = Function(String name, String note);

class AddEditScreen extends StatelessWidget {
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static final GlobalKey<FormFieldState<String>> _nameKey =
      new GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _noteKey =
      new GlobalKey<FormFieldState<String>>();

  final Event event;
  final OnSaveCallback onSave;
  final bool isEditing;

  AddEditScreen({
    Key key,
    this.event,
    this.onSave,
    this.isEditing,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(isEditing ? 'Edit Event' : 'Add Event'),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                key: _nameKey,
                initialValue: isEditing ? event.name : '',
                autofocus: !isEditing,
                style: textTheme.headline,
                decoration: new InputDecoration(
                  hintText: 'Enter event name',
                ),
                validator: (val) =>
                    val.trim().isEmpty ? 'Please enter event name' : null,
              ),
              new TextFormField(
                key: _noteKey,
                initialValue: isEditing ? event.note : '',
                style: textTheme.subhead,
                maxLines: 10,
                decoration: new InputDecoration(
                  hintText: 'Notes...',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: isEditing ? 'Save changes' : 'Add new event',
        child: new Icon(isEditing ? Icons.check : Icons.add),
        onPressed: () {
          onSave(
            _nameKey.currentState.value,
            _noteKey.currentState.value,
          );
          Navigator.pop(context);
        },
      ),
    );
  }
}
