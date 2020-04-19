import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphqljobs/models/event_model.dart';
import 'package:graphqljobs/widgets/graphql-colors.dart';
import 'package:graphqljobs/widgets/tag_tile.dart';
import 'package:graphqljobs/widgets/text_style_guide.dart';

import 'icon_text.dart';

class EventTile extends StatelessWidget {
  final Event event;

  const EventTile({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    var mediaQueryData = MediaQuery.of(context);
    return Container(
      height: mediaQueryData.size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        elevation: 4,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: GraphQLColors.main.withOpacity(0.7),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  position: DecorationPosition.foreground,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: Image(
                      height: 300,
                      image: NetworkImage(event.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 20.0,
                  left: 20.0,
                  child: Text(
                    event.title,
                    style: TextStyleGuide.EventCardMainTitle,
                  ),
                ),
                Positioned(
                  top: 60.0,
                  left: 20.0,
                  child: _displayLocation(event),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 20.0,
                  child: _displayDate(event),
                ),

              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                event.description,
                style: TextStyleGuide.listCardTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_displayDate(Event event) {
  return IconText(
    icon: Icon(
      FontAwesomeIcons.calendar,
      size: 15.0,
      color: Colors.white70,
    ),
    text: Text(
      event.date,
      style: TextStyleGuide.listCardTitleSecondary,
    ),
  );
}

_displayLocation(Event event) {
  return event.location != null
      ? IconText(
          icon: Icon(
            FontAwesomeIcons.locationArrow,
            size: 15.0,
            color: Colors.white70,
          ),
          text: Text(
            event.location,
            style: TextStyleGuide.listCardTitleSecondary,
          ),
        )
      : IconText(
          icon: Icon(
            Icons.live_tv,
            size: 20.0,
            color: Colors.white70,
          ),
          text: Text(
            'Live',
            style: TextStyleGuide.listCardTitleSecondary,
          ),
        );
}
