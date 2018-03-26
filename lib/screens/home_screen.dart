import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/localization.dart';
import 'package:smart_calendar_copy/models.dart';
import 'package:smart_calendar_copy/routes.dart';
import 'package:smart_calendar_copy/widgets/extra_actions_button.dart';
import 'package:smart_calendar_copy/widgets/filter_button.dart';
import 'package:smart_calendar_copy/typedefs.dart';
import 'package:smart_calendar_copy/widgets/event_list.dart';
import 'package:smart_calendar_copy/widgets/states_counter.dart';

class HomeScreen extends StatefulWidget {
  final AppState appState;
  final EventAdder addEvent;
  final EventRemover removeEvent;
  final EventUpdater updateEvent;
  final Function toggleAll;
  final Function clearCompleted;

  HomeScreen({
    @required this.appState,
    @required this.addEvent,
    @required this.removeEvent,
    @required this.updateEvent,
    @required this.toggleAll,
    @required this.clearCompleted,
    Key key,
  })
      : super(key: AppKeys.homeScreen);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VisibilityFilter activeFilter = VisibilityFilter.all;
  AppTab activeTab = AppTab.events;

  _updateVisibility(VisibilityFilter filter) {
    setState(() {
      activeFilter = filter;
    });
  }

  _updateTab(AppTab tab) {
    setState(() {
      activeTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(AppLocalizations.of(context).appTitle),
        actions: <Widget>[
          new FilterButton(
            isActive: activeTab == AppTab.events,
            activeFilter: activeFilter,
            onSelected: _updateVisibility,
          ),
          new ExtraActionsButton(
            allComplete: widget.appState.allComplete,
            hasCompletedEvents: widget.appState.hasCompletedEvents,
            onSelected: (action) {
              if (action == ExtraAction.toggleAllComplete) {
                widget.toggleAll();
              } else if (action == ExtraAction.clearCompleted) {
                widget.clearCompleted();
              }
            },
          ),
        ],
      ),
      body: activeTab == AppTab.events
          ? new EventList(
              events: widget.appState.filteredEvents(activeFilter),
              loading: widget.appState.isLoading,
              removeEvent: widget.removeEvent,
              addEvent: widget.addEvent,
              updateEvent: widget.updateEvent,
            )
          : new StatsCounter(
              numActive: widget.appState.numActive,
              numCompleted: widget.appState.numCompleted,
            ),
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
