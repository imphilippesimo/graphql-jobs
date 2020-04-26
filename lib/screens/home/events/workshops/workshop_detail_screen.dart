import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphqljobs/models/company_model.dart';
import 'package:graphqljobs/models/guest_model.dart';
import 'package:graphqljobs/models/job_model.dart';
import 'package:graphqljobs/models/sociallink_model.dart';
import 'package:graphqljobs/models/workshop_model.dart';
import 'package:graphqljobs/widgets/graphql-colors.dart';
import 'package:graphqljobs/widgets/icon_text.dart';
import 'package:graphqljobs/widgets/text_style_guide.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:graphqljobs/screens/home/events/workshops/workshop_carousel.dart';

class WorkshopDetailScreen extends StatefulWidget {
  final Workshop workshop;

  WorkshopDetailScreen({this.workshop});

  @override
  _WorkshopDetailScreen createState() => _WorkshopDetailScreen();
}

class _WorkshopDetailScreen extends State<WorkshopDetailScreen> {
  ScrollController _hideButtonController;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _hideButtonController = new ScrollController();

    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible == true) {
          setState(() {
            _isVisible = false;
          });
        }
      } else {
        if (_hideButtonController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (_isVisible == false) {
            setState(() {
              _isVisible = true;
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: _isVisible,
        child: FloatingActionButton.extended(
          icon: Icon(
            FontAwesomeIcons.calendar,
            color: Colors.white,
          ),
          label: Text(
            'Book Session',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xfffc5185),
          onPressed: () => _apply(widget.workshop.bookUrl),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 0.55 * MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xfffc5185),
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 80.0, 15.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(75.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 5.0),
                                blurRadius: 8.0,
                              ),
                            ]),
                        child: ClipOval(
                          child: Image(
                            image: _loadImage(widget.workshop.speakers[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                widget.workshop.title,
                                style: TextStyleGuide.mainTitle(Colors.white),
                                maxLines: 4,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                widget.workshop.speakers[0].name,
                                style: TextStyleGuide.listCardTitleSecondary(
                                    Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _displaySocialLinks(widget.workshop.speakers[0]),
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.clock,
                            size: 15.0,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            widget.workshop.begin,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                          Text(
                            widget.workshop.end != null
                                ? ' - ' + widget.workshop.end
                                : '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
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
              Positioned(
                right: 20,
                top: 150,
                child: IconText(
                  icon: displayLevelIcon(Colors.white, widget.workshop),
                  text: Text(
                    widget.workshop.level,
                    style: TextStyleGuide.listCardTitleSecondary(
                      Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                controller: _hideButtonController,
                children: [
                  Text(
                    widget.workshop.title,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  MarkdownBody(
                    data: widget.workshop.description != null
                        ? widget.workshop.description
                        : "",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _loadImage(Guest guest) {
    String url = guest.photoUrl;
    return (url != null && url != "")
        ? NetworkImage(url)
        : AssetImage("assets/images/zerofiltre.png");
  }

  Future _launchURL(String applyUrl) async {
    if (await canLaunch(applyUrl)) {
      await launch(applyUrl);
    } else {
      throw 'Could not launch $applyUrl';
    }
  }

  _apply(String url) {
    _launchURL(url).then((value) => null).catchError((error) {
      throw 'Could not launch $url';
    });
  }

  _displaySocialLinks(Guest speaker) {
    return speaker.socialLinks != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: speaker.socialLinks
                .asMap()
                .entries
                .map(
                  (mapEntry) => _buildIcon(mapEntry.value),
                )
                .toList(),
          )
        : Container();
  }

  Widget _buildIcon(SocialLink socialLink) {
    return GestureDetector(
      onTap: () {
        print(socialLink.url);
        _launchURL(socialLink.url);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          height: 30.0,
          width: 30.0,
          decoration: BoxDecoration(
            color: GraphQLColors.accentColor,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Icon(
            socialLink.icon,
            size: 20.0,
            color: GraphQLColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
