import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphqljobs/models/event_model.dart';
import 'package:graphqljobs/models/tag_model.dart';
import 'package:graphqljobs/models/workshop_model.dart';
import 'package:graphqljobs/screens/home/events/workshops/workshop_detail_screen.dart';
import 'package:graphqljobs/widgets/graphql-colors.dart';
import 'package:graphqljobs/widgets/tag_tile.dart';
import 'package:graphqljobs/widgets/text_style_guide.dart';

class WorkshopCarousel extends StatelessWidget {
  final Event event;

  const WorkshopCarousel({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final themeData = Theme.of(context);

    return Container(
      height: screenWidth * 0.65,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: event.workshops.length,
        itemBuilder: (BuildContext context, int index) {
          Workshop workshop = event.workshops[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WorkshopDetailScreen(
                    workshop: workshop,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: screenWidth * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: workshop.speakers[0].photoUrl,
                              placeholder: (context, url) =>
                                  SpinKitDoubleBounce(
                                color: GraphQLColors.main,
                                size: 20.0,
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            workshop.speakers[0].name != null
                                ? workshop.speakers[0].name
                                : '',
                            style: TextStyleGuide.listCardTitleSecondary(
                                Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: displayLevelIcon(
                                GraphQLColors.primaryColor, workshop),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            workshop.level,
                            style: TextStyleGuide.listCardTitleSecondary(
                                themeData.primaryColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Icon(
                              FontAwesomeIcons.clock,
                              size: 20,
                              color: themeData.primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                workshop.begin,
                                style: TextStyleGuide.listCardTitleSecondary(
                                    themeData.primaryColor),
                              ),
                              Text(
                                workshop.end != null ? '-' : '',
                                style: TextStyleGuide.listCardTitleSecondary(
                                    themeData.primaryColor),
                              ),
                              Text(
                                workshop.end != null ? workshop.end : '',
                                style: TextStyleGuide.listCardTitleSecondary(
                                    themeData.primaryColor),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: screenWidth * 0.7,
                        height: 80,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                workshop.title,
                                style: TextStyleGuide.listCardTitle
                                    .copyWith(color: GraphQLColors.main),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 25.0,
                        width: screenWidth * 0.7,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              workshop.tags != null ? workshop.tags.length : 0,
                          itemBuilder: (BuildContext context, int index) {
                            Tag tag = workshop.tags[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                              child: TagTile(tag: tag),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Icon displayLevelIcon(Color color, Workshop workshop) {
  String level = workshop.level;
  IconData icon;
  if (level == Workshop.BEGINNER) {
    icon = FontAwesomeIcons.child;
  } else if (level == Workshop.INTERMEDIATE) {
    icon = FontAwesomeIcons.walking;
  } else {
    icon = FontAwesomeIcons.running;
  }
  return Icon(icon, size: 20, color: color);
}
