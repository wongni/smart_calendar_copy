import 'package:redux/redux.dart';
import 'package:smart_calendar_copy/actions/actions.dart';
import 'package:smart_calendar_copy/models/models.dart';

final visibilityReducer = combineTypedReducers([
  new ReducerBinding<VisibilityFilter, UpdateFilterAction>(
      _activeFilterReducer),
]);

VisibilityFilter _activeFilterReducer(
    VisibilityFilter state, UpdateFilterAction action) {
  return action.newFilter;
}
