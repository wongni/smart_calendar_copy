import 'package:redux/redux.dart';
import 'package:smart_calendar_copy/actions/actions.dart';
import 'package:smart_calendar_copy/models/models.dart';

final tabsReducer = combineTypedReducers([
  new ReducerBinding<AppTab, UpdateTabAction>(_activeTabReducer),
]);

AppTab _activeTabReducer(AppTab state, UpdateTabAction action) {
  return action.newTab;
}
