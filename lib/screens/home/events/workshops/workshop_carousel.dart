import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphqljobs/models/event_model.dart';
import 'package:graphqljobs/models/workshop_model.dart';
import 'package:graphqljobs/widgets/graphql-colors.dart';
import 'package:graphqljobs/widgets/text_style_guide.dart';

class WorkshopCarousel extends StatelessWidget {
  final Event event;

  const WorkshopCarousel({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenWidth * 0.8,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: event.workshops.length,
        itemBuilder: (BuildContext context, int index) {
          Workshop workshop = event.workshops[index];
          return Container(
            width: screenWidth * 0.8,
            color: GraphQLColors.main,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: Container(
                    width: screenWidth * 0.8,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            workshop.title,
                            style: TextStyleGuide.listCardTitle
                                .copyWith(color: GraphQLColors.main),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
