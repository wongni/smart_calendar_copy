import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:smart_calendar_copy/actions/actions.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/models/models.dart';
import 'package:smart_calendar_copy/selectors/selectors.dart';

class TabSelector extends StatelessWidget {
  TabSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return new BottomNavigationBar(
          currentIndex: AppTab.values.indexOf(vm.activeTab),
          items: AppTab.values.map((tab) {
            return new BottomNavigationBarItem(
              icon: new Icon(
                tab == AppTab.events ? Icons.list : Icons.show_chart,
                key: tab == AppTab.events ? AppKeys.eventTab : AppKeys.statsTab,
              ),
              title: new Text(
                tab == AppTab.events ? 'Events' : 'Stats',
              ),
            );
          }).toList(),
          onTap: vm.onTabSelected,
        );
      },
    );
  }
}

class _ViewModel {
  final AppTab activeTab;
  final Function(int) onTabSelected;

  _ViewModel({
    @required this.activeTab,
    @required this.onTabSelected,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
        activeTab: activeTabSelector(store.state),
        onTabSelected: (index) {
          store.dispatch(new UpdateTabAction(AppTab.values[index]));
        });
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _ViewModel &&
          runtimeType == other.runtimeType &&
          activeTab == other.activeTab);

  @override
  int get hashCode => activeTab.hashCode;
}
