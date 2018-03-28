import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_calendar_copy/containers/app_loading.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/presentation/loading_indicator.dart';

class StatsCounter extends StatelessWidget {
  final int numActive;
  final int numCompleted;

  StatsCounter({
    @required this.numActive,
    @required this.numCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return new AppLoading(
      builder: (BuildContext context, bool isLoading) {
        return isLoading
            ? new LoadingIndicator(key: AppKeys.statsLoading)
            : _buildStats(context);
      },
    );
  }

  _buildStats(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: new Text(
              'Completed events',
              style: textTheme.title,
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: new Text(
              '$numCompleted',
              key: AppKeys.statsNumCompleted,
              style: textTheme.subhead,
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: new Text(
              'Active events',
              style: textTheme.title,
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: new Text(
              '$numActive',
              key: AppKeys.statsNumActive,
              style: textTheme.subhead,
            ),
          ),
        ],
      ),
    );
  }
}
