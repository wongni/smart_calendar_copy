import 'package:smart_calendar_copy/models/models.dart';

class AppState {
  bool isLoading;
  List<Event> events;
  AppTab activeTab;
  VisibilityFilter activeFilter;

  AppState({
    this.isLoading = false,
    this.events = const [],
    this.activeTab = AppTab.events,
    this.activeFilter = VisibilityFilter.all,
  });

  factory AppState.loading() => new AppState(isLoading: true);

  AppState copyWith({
    bool isLoading,
    List<Event> events,
    AppTab activeTab,
    VisibilityFilter activeFilter,
  }) {
    return new AppState(
      isLoading: isLoading ?? this.isLoading,
      events: events ?? this.events,
      activeTab: activeTab ?? this.activeTab,
      activeFilter: activeFilter ?? this.activeFilter,
    );
  }

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, event:$events, activeTab: $activeTab, activeFilter: $activeFilter}';
  }
}
