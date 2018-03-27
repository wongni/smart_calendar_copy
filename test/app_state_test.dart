import 'package:flutter_test/flutter_test.dart';
import 'package:smart_calendar_copy/models.dart';

main() {
  group('AppState', () {
    test('should check if there are completed events', () {
      final state = new AppState(events: [
        new Event('a'),
        new Event('b'),
        new Event('c', complete: true),
      ]);

      expect(state.hasCompletedEvents, true);
    });

    test('should calculate the number of active events', () {
      final state = new AppState(events: [
        new Event('a'),
        new Event('b'),
        new Event('c', complete: true),
      ]);

      expect(state.numActive, 2);
    });

    test('should calculate the number of completed events', () {
      final state = new AppState(events: [
        new Event('a'),
        new Event('b'),
        new Event('c', complete: true),
      ]);

      expect(state.numCompleted, 1);
    });

    test('should return all events if the VisibilityFilter is all', () {
      final events = [
        new Event('a'),
        new Event('b'),
        new Event('c', complete: true),
      ];
      final state = new AppState(events: events);

      state.activeFilter = VisibilityFilter.all;

      expect(state.filteredEvents(), events);
    });

    test('should return completed events if the VisibilityFilter is completed', () {
      final event1 = new Event('a');
      final event2 = new Event('b');
      final event3 = new Event('c', complete: true);

      final events = [
        event1,
        event2,
        event3,
      ];
      final state = new AppState(events: events);

      state.activeFilter = VisibilityFilter.completed;

      expect(state.filteredEvents(), [event3]);
    });

    test('should return active events if the VisibilityFilter is completed', () {
      final event1 = new Event('a');
      final event2 = new Event('b');
      final event3 = new Event('c', complete: true);

      final events = [
        event1,
        event2,
        event3,
      ];
      final state = new AppState(events: events);

      state.activeFilter;

      expect(state.filteredEvents(), [event1, event2]);
    });

    test('should return active events if the VisibilityFilter is completed', () {
      final event1 = new Event('a');
      final event2 = new Event('b');
      final event3 = new Event('c', complete: true);

      final events = [
        event1,
        event2,
        event3,
      ];
      final state = new AppState(events: events);

      state.clearCompleted();

      expect(state.events, [event1, event2]);
    });


    test('should toggle as complete or incomplete', () {
      final event1 = new Event('a');
      final event2 = new Event('b');
      final event3 = new Event('c', complete: true);

      final events = [
        event1,
        event2,
        event3,
      ];
      final state = new AppState(events: events);

      // Toggle all complete
      state.toggleAll();

      expect(state.events.every((event) => event.complete), isTrue);

      // Toggle all incomplete
      state.toggleAll();

      expect(state.events.every((event) => !event.complete), isTrue);
    });
  });
}
