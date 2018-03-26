import 'package:flutter/material.dart';
import 'package:smart_calendar_copy/keys.dart';
import 'package:smart_calendar_copy/models.dart';

class FilterButton extends StatelessWidget {
  final PopupMenuItemSelected<VisibilityFilter> onSelected;
  final VisibilityFilter activeFilter;
  final bool isActive;

  FilterButton({
    this.onSelected,
    this.activeFilter,
    this.isActive,
    Key key,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.body1;
    final activeStyle = Theme
        .of(context)
        .textTheme
        .body1
        .copyWith(color: Theme.of(context).accentColor);

    return new AnimatedOpacity(
      opacity: isActive ? 1.0 : 0.0,
      duration: new Duration(milliseconds: 150),
      child: new PopupMenuButton<VisibilityFilter>(
        key: AppKeys.filterButton,
        tooltip: 'Filter events',
        onSelected: onSelected,
        icon: new Icon(Icons.filter_list),
        itemBuilder: (context) {
          return <PopupMenuItem<VisibilityFilter>>[
            new PopupMenuItem(
              key: AppKeys.allFilter,
              value: VisibilityFilter.all,
              child: new Text(
                'Show all events',
                style: activeFilter == VisibilityFilter.all
                    ? activeStyle
                    : defaultStyle,
              ),
            ),
            new PopupMenuItem(
              key: AppKeys.activeFilter,
              value: VisibilityFilter.active,
              child: new Text(
                'Show active events',
                style: activeFilter == VisibilityFilter.active
                    ? activeStyle
                    : defaultStyle,
              ),
            ),
            new PopupMenuItem(
              key: AppKeys.completedFilter,
              value: VisibilityFilter.completed,
              child: new Text(
                'Show completed events',
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
