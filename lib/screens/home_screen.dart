import 'package:flutter/material.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/localization.dart';
import 'package:smart_calendar_copy/models.dart';
import 'package:smart_calendar_copy/routes.dart';
import 'package:smart_calendar_copy/state_container.dart';
import 'package:smart_calendar_copy/widgets/event_list.dart';
import 'package:smart_calendar_copy/widgets/extra_actions_button.dart';
import 'package:smart_calendar_copy/widgets/filter_button.dart';
import 'package:smart_calendar_copy/widgets/states_counter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen() : super(key: AppKeys.homeScreen);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppTab activeTab = AppTab.events;

  _updateTab(AppTab tab) => setState(() => activeTab = tab);

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    final state = container.state;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(AppLocalizations.of(context).appTitle),
        actions: <Widget>[
          new FilterButton(
            isActive: activeTab == AppTab.events,
            activeFilter: state.activeFilter,
            onSelected: container.updateVisibilityFilter,
          ),
          new ExtraActionsButton(
            allComplete: state.allComplete,
            hasCompletedEvents: state.hasCompletedEvents,
            onSelected: (action) {
              if (action == ExtraAction.toggleAllComplete) {
                container.toggleAll();
              } else if (action == ExtraAction.clearCompleted) {
                container.clearCompleted();
              }
            },
          ),
        ],
      ),
      body: activeTab == AppTab.events ? new EventList() : new StatsCounter(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addEvent);
        },
        key: AppKeys.addEventFab,
        child: new Icon(Icons.add),
        tooltip: AppLocalizations.of(context).addEvent,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        key: AppKeys.tabs,
        currentIndex: AppTab.values.indexOf(activeTab),
        onTap: (index) {
          _updateTab(AppTab.values[index]);
        },
        items: AppTab.values.map(
          (tab) {
            return new BottomNavigationBarItem(
              icon: new Icon(
                tab == AppTab.events ? Icons.list : Icons.show_chart,
                key: tab == AppTab.events ? AppKeys.eventTab : AppKeys.statsTab,
              ),
              title: new Text(
                tab == AppTab.events ? 'Events' : 'Stats',
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
