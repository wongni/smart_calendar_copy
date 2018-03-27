import 'package:flutter/material.dart';
import 'package:smart_calendar_copy/containers/active_tab.dart';
import 'package:smart_calendar_copy/containers/filtered_events.dart';
import 'package:smart_calendar_copy/localization.dart';
import 'package:smart_calendar_copy/models/models.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ActiveTab(
      builder: (BuildContext context, AppTab activeTab) {
        return new Scaffold(
          appBar: new AppBar(
            title: new Text(AppLocalizations.of(context).appTitle),
            actions: <Widget>[
              // TODO: Add buttons
            ],
          ),
          body: activeTab == AppTab.events
              ? new FilteredEvents()
              : new Text('Stats'),
        );
      },
    );
  }
}
