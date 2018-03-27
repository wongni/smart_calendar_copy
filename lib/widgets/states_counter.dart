import 'package:flutter/material.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/state_container.dart';

class StatsCounter extends StatelessWidget {
  StatsCounter()
      : super(key: AppKeys.statsCounter);

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    final state = container.state;

    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: new Text(
              'Completed events',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: new Text(
              '${state.numCompleted}',
              key: AppKeys.statsNumCompleted,
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: new Text(
              'Active events',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: new Text(
              '${state.numActive}',
              key: AppKeys.statsNumActive,
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
        ],
      ),
    );
  }
}
