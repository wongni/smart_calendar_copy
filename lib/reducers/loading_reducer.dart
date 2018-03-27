import 'package:redux/redux.dart';
import 'package:smart_calendar_copy/actions/actions.dart';

final loadingReducer = combineTypedReducers([
  new ReducerBinding<bool, EventsLoadedAction>(_setLoaded),
  new ReducerBinding<bool, EventsNotLoadedAction>(_setLoaded),
]);


bool _setLoaded(bool state, action) {
  return false;
}
