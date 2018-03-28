import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/models/models.dart';

class FilterButton extends StatelessWidget {
  final bool visible;
  final VisibilityFilter activeFilter;
  final PopupMenuItemSelected<VisibilityFilter> onSelected;

  FilterButton({
    Key key,
    @required this.visible,
    @required this.activeFilter,
    @required this.onSelected,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.body1;
    final activeStyle =
        defaultStyle.copyWith(color: Theme.of(context).accentColor);

    return new AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: new Duration(milliseconds: 200),
      child: new PopupMenuButton<VisibilityFilter>(
        key: AppKeys.filterButton,
        tooltip: 'Filter events',
        onSelected: onSelected,
        icon: new Icon(Icons.filter_list),
        itemBuilder: (context) {
          return [
            new PopupMenuItem(
              key: AppKeys.allFilter,
              value: VisibilityFilter.all,
              child: new Text(
                'Show all',
                style: activeFilter == VisibilityFilter.all
                    ? activeStyle
                    : defaultStyle,
              ),
            ),
            new PopupMenuItem(
              key: AppKeys.activeFilter,
              value: VisibilityFilter.active,
              child: new Text(
                'Show active',
                style: activeFilter == VisibilityFilter.active
                    ? activeStyle
                    : defaultStyle,
              ),
            ),
            new PopupMenuItem(
              key: AppKeys.completedFilter,
              value: VisibilityFilter.completed,
              child: new Text(
                'Show completed',
                style: activeFilter == VisibilityFilter.completed
                    ? activeStyle
                    : defaultStyle,
              ),
            ),
          ];
        },
      ),
    );
  }
}
