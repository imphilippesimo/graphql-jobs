import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graphqljobs/models/event_model.dart';
import 'package:graphqljobs/models/guest_model.dart';
import 'package:graphqljobs/screens/home/events/workshops/workshop_carousel.dart';
import 'package:graphqljobs/widgets/graphql-colors.dart';
import 'package:graphqljobs/widgets/text_style_guide.dart';
import 'package:graphqljobs/widgets/event_tile.dart';
import 'package:provider/provider.dart';

class EventDetailContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 30.0,
                  color: Colors.white,
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          Container(
            height: 180,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.25, right: screenHeight * 0.1),
                  child: Text(
                    event.title,
                    style: TextStyleGuide.EventDetailMainTitle,
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.25, right: screenHeight * 0.1),
                    child: displayLocation(event, screenWidth * 0.6)),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("GUESTS", style: TextStyleGuide.guestTitle(Colors.black)),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _displayGuests(event),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 5.0),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: event.punchline1,
                      style: TextStyleGuide.punchLine1(GraphQLColors.main)),
                  TextSpan(
                      text: event.punchline2,
                      style: TextStyleGuide.punchLine2(Colors.black)),
                ]),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  event.description.isNotEmpty
                      ? Text(
                          event.description,
                          style: TextStyleGuide.eventDetailDescription(
                              Colors.black),
                        )
                      : Container(),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("WORKSHOPS",
                        style: TextStyleGuide.guestTitle(Colors.black)),
                  ),
                  WorkshopCarousel(
                    event: event,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _displayGuests(Event event) {
    List<Widget> list = [];
    for (Guest guest in event.guests) {
      list.add(
        Padding(
          padding: EdgeInsets.all(8),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: guest.photoUrl,
              placeholder: (context, url) => SpinKitDoubleBounce(
                color: GraphQLColors.main,
                size: 20.0,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              height: 90,
              width: 90,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
    return Row(
      children: list,
    );
  }
}
