import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:smart_calendar_copy/actions/actions.dart';
import 'package:smart_calendar_copy/localization.dart';
import 'package:smart_calendar_copy/models/models.dart';
import 'package:smart_calendar_copy/presentation/home_screen.dart';
import 'package:smart_calendar_copy/routes.dart';
import 'reducers/app_state_reducer.dart';
import 'middleware/store_todos_middleware.dart';

void main() => runApp(new ReduxApp());

class ReduxApp extends StatelessWidget {
  final store = new Store<AppState>(
    appReducer,
    initialState: new AppState.loading(),
    middleware: createStoreEventsMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        title: new AppLocalizations().appTitle,
        localizationsDelegates: [new AppLocalizationsDelegate()],
        routes: {
          AppRoutes.home: (context) => new StoreBuilder<AppState>(
                onInit: (store) => store.dispatch(new LoadEventsAction()),
                builder: (context, store) => new HomeScreen(),
              ),
//          AppRoutes.addEvent: (context) => new AddEvent(),
        },
      ),
    );
  }
}
