import 'package:flutter/material.dart';
import 'package:graphqljobs/models/event_model.dart';
import 'package:graphqljobs/models/user_model.dart';
import 'package:graphqljobs/widgets/event_tile.dart';

class EventCarousel extends StatelessWidget {
  final User user;
  final List<Event> events;

  const EventCarousel({Key key, this.user, this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          Event event = events[index];
          return GestureDetector(
            child: EventTile(
              event: event,
            ),
          );
        },
        itemCount: events.length,
      ),
    );
  }
}
