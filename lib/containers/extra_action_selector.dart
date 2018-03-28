import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:smart_calendar_copy/actions/actions.dart';
import 'package:smart_calendar_copy/models/models.dart';
import 'package:smart_calendar_copy/presentation/extra_action_button.dart';
import 'package:smart_calendar_copy/selectors/selectors.dart';

class ExtraActionSelector extends StatelessWidget {
  ExtraActionSelector({
    Key key,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return new ExtraActionButton(
          onSelected: vm.onActionSelected,
        );
      },
    );
  }
}

class _ViewModel {
  final VisibilityFilter activeFilter;
  final Function(ExtraAction) onActionSelected;
  final bool allComplete;

  _ViewModel({
    @required this.activeFilter,
    @required this.onActionSelected,
    @required this.allComplete,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
      activeFilter: activeFilterSelector(store.state),
      onActionSelected: (action) {
        switch (action) {
          case ExtraAction.clearCompleted :
            store.dispatch(new ClearCompletedAction());
            break;
          case ExtraAction.toggleAllComplete :
            store.dispatch(new ToggleAllAction());
            break;
        }
      },
      allComplete: allCompleteSelector(eventsSelector(store.state)),
    );
  }
}
