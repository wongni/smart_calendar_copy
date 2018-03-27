import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:smart_calendar_copy/models/models.dart';

class ActiveTab extends StatelessWidget {
  final ViewModelBuilder<AppTab> builder;

  ActiveTab({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector(
      builder: builder,
      converter: (Store<AppState> store) => store.state.activeTab,
      distinct: true,
    );
  }
}
