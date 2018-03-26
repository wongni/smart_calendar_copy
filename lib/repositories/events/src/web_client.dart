import 'dart:async';

import 'event_entity.dart';

class WebClient {
  final Duration delay;

  const WebClient([this.delay = const Duration(milliseconds: 3000)]);

  Future<List<EventEntity>> fetchEvents() async {
    return new Future.delayed(
        delay,
        () => [
              new EventEntity(
                '1',
                'Buy food for da kitty',
                'With the chickeny bits!',
                false,
                false,
              ),
              new EventEntity(
                '2',
                'Find a Red Sea dive trip',
                'Echo vs MY Dream',
                false,
                false,
              ),
              new EventEntity(
                '3',
                'Book flights to Egypt',
                '',
                false,
                true,
              ),
              new EventEntity(
                '4',
                'Decide on accommodation',
                '',
                false,
                false,
              ),
              new EventEntity(
                '5',
                'Sip Margaritas',
                'on the beach',
                false,
                true,
              ),
            ]);
  }

  Future<bool> postEvents(List<EventEntity> events) {
    return new Future.value(true);
  }
}
