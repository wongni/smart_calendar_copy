import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:smart_calendar_copy/actions/actions.dart';
import 'package:smart_calendar_copy/models/models.dart';
import 'package:smart_calendar_copy/presentation/filter_button.dart';
import 'package:smart_calendar_copy/selectors/selectors.dart';

class FilterSelector extends StatelessWidget {
  final bool visible;

  FilterSelector({
    Key key,
    @required this.visible,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return new FilterButton(
          visible: visible,
          activeFilter: vm.activeFilter,
          onSelected: vm.onFilterSelected,
        );
      },
    );
  }
}

class _ViewModel {
  final VisibilityFilter activeFilter;
  final Function(VisibilityFilter) onFilterSelected;

  _ViewModel({
    @required this.activeFilter,
    @required this.onFilterSelected,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
      activeFilter: activeFilterSelector(store.state),
      onFilterSelected: (newFilter) {
        print(newFilter);
        store.dispatch(new UpdateFilterAction(newFilter));
      },
    );
  }
}
