import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'page_objects/page_objects.dart';

void main() {
  group('Event App Test', () {
    FlutterDriver driver;
    HomeTestScreen homeScreen;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      homeScreen = new HomeTestScreen(driver);
    });

    tearDownAll(() {
      if (driver != null) {
        driver.close();
      }
    });

    test('should show a loading screen while the events are fetched', () async {
      expect(await homeScreen.isLoading(), isTrue);
    });

    test('should start with a list of events', () async {
      expect(await homeScreen.isReady(), isTrue);
      for (var i = 1; i <= 5; ++i) {
        expect(await homeScreen.eventList.eventItem('$i').isVisible, isTrue);
      }
    });

    test('should be able to click on an item to see details', () async {
      final detailsScreen = homeScreen.eventList.eventItem('2').tap();
      expect(await detailsScreen.name, isNotEmpty);
      expect(await detailsScreen.note, isNotEmpty);

      final editScreen = detailsScreen.tapEditEventButton();
      expect(await editScreen.isReady(), isTrue);

      await editScreen.tapBackButton();
    });

    test('should be able to delete a todo on the details screen', () async {
      final detailsScreen = new DetailsTestScreen(driver);

      await detailsScreen.tapDeleteButton();

      expect(await homeScreen.eventList.eventItem('2').isAbsent, isTrue,
          reason: 'EventItem2 should be absent');
      expect(await homeScreen.snackbarVisible, isTrue,
          reason: 'snackbar should be visible');
    });

    test('should filter to completed events', () async {
      await homeScreen.tapFilterButton().tapShowCompleted();

      expect(await homeScreen.eventList.eventItem('1').isAbsent, isTrue);
      expect(await homeScreen.eventList.eventItem('3').isVisible, isTrue);
      expect(await homeScreen.eventList.eventItem('4').isAbsent, isTrue);
      expect(await homeScreen.eventList.eventItem('5').isVisible, isTrue);
    });

    test('should filter to active events', () async {
      await homeScreen.tapFilterButton().tapShowActive();

      expect(await homeScreen.eventList.eventItem('1').isVisible, isTrue);
      expect(await homeScreen.eventList.eventItem('3').isAbsent, isTrue);
      expect(await homeScreen.eventList.eventItem('4').isVisible, isTrue);
      expect(await homeScreen.eventList.eventItem('5').isAbsent, isTrue);
    });

    test('should one again filter to all events', () async {
      await homeScreen.tapFilterButton().tapShowAll();

      expect(await homeScreen.eventList.eventItem('1').isVisible, isTrue);
      expect(await homeScreen.eventList.eventItem('3').isVisible, isTrue);
      expect(await homeScreen.eventList.eventItem('4').isVisible, isTrue);
      expect(await homeScreen.eventList.eventItem('5').isVisible, isTrue);
    });

    test('should be able to view stats', () async {
      final stats = homeScreen.tapStatsTab();

      expect(await stats.numActive, 2);
      expect(await stats.numCompleted, 2);
    });

    test('should be able to toggle a todo complete', () async {
      await homeScreen.tapEventsTab().eventItem('1').tapCheckbox();
      final stats = homeScreen.tapStatsTab();

      expect(await stats.numActive, 1);
      expect(await stats.numCompleted, 3);
    });

    test('should be able to clear the completed events', () async {
      await homeScreen.tapExtraActionsButton().tapCleanCompleted();

      final stats = homeScreen.tapStatsTab();

      expect(await stats.numActive, 1);
      expect(await stats.numCompleted, 0);
    });

    test('should be able to toggle all events complete', () async {
      await homeScreen.tapExtraActionsButton().tapToggleAll();

      final stats = homeScreen.tapStatsTab();

      expect(await stats.numActive, 0);
      expect(await stats.numCompleted, 1);
    });

    test('should be able to toggle all events incomplete', () async {
      await homeScreen.tapExtraActionsButton().tapToggleAll();

      final stats = homeScreen.tapStatsTab();

      expect(await stats.numActive, 1);
      expect(await stats.numCompleted, 0);
    });
  });
}
