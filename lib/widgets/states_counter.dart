import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_calendar_copy/keys.dart';

class StatsCounter extends StatelessWidget {
  final int numActive;
  final int numCompleted;

  StatsCounter({
    @required this.numActive,
    @required this.numCompleted,
  })
      : super(key: AppKeys.statsCounter);

  @override
  Widget build(BuildContext context) {
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
              '$numCompleted',
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
              '$numActive',
              key: AppKeys.statsNumActive,
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
        ],
      ),
    );
  }
}
