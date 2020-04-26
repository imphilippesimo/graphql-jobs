import 'package:flutter/material.dart';
import 'package:graphqljobs/models/event_model.dart';
import 'package:graphqljobs/models/user_model.dart';
import 'package:graphqljobs/widgets/event_tile.dart';

import 'event_detail_screen.dart';

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
        itemCount: events.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            var themeData = Theme.of(context);
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Upcoming Events',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print('See all'),
                    //Button to build the destinations
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: themeData.primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            Event event = events[index - 1];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EventDetailScreen(
                      event: event,
                    ),
                  ),
                );
              },
              child: EventTile(
                event: event,
              ),
            );
          }
        },
      ),
    );
  }
}
