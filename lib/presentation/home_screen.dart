import 'package:flutter/material.dart';
import 'package:smart_calendar_copy/containers/active_tab.dart';
import 'package:smart_calendar_copy/containers/extra_action_selector.dart';
import 'package:smart_calendar_copy/containers/filter_selector.dart';
import 'package:smart_calendar_copy/containers/filtered_events.dart';
import 'package:smart_calendar_copy/containers/stats.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/localization.dart';
import 'package:smart_calendar_copy/models/models.dart';
import 'package:smart_calendar_copy/containers/tab_selector.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen() : super(key: AppKeys.homeScreen);

  @override
  Widget build(BuildContext context) {
    return new ActiveTab(
      builder: (BuildContext context, AppTab activeTab) {
        return new Scaffold(
          appBar: new AppBar(
            title: new Text(AppLocalizations.of(context).appTitle),
            actions: <Widget>[
              new FilterSelector(
                visible: activeTab == AppTab.events,
              ),
              new ExtraActionSelector()
            ],
          ),
          body: activeTab == AppTab.events
              ? new FilteredEvents()
              : new Stats(),
          bottomNavigationBar: new TabSelector(),
        );
      },
    );
  }
}
