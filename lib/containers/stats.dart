import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:smart_calendar_copy/models/models.dart';
import 'package:smart_calendar_copy/presentation/stats_counter.dart';
import 'package:smart_calendar_copy/selectors/selectors.dart';

class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return new StatsCounter(
          numCompleted: vm.numCompleted,
          numActive: vm.numActive,
        );
      },
    );
  }
}

class _ViewModel {
  final int numCompleted;
  final int numActive;

  _ViewModel({
    @required this.numCompleted,
    @required this.numActive,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
      numCompleted: numCompletedSelector(eventsSelector(store.state)),
      numActive: numActiveSelector(eventsSelector(store.state)),
    );
  }
}
