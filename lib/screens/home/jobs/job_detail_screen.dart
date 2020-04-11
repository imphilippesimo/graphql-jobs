import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphqljobs/models/company_model.dart';
import 'package:graphqljobs/models/job_model.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetailScreen extends StatefulWidget {
  final Job job;

  JobDetailScreen({this.job});

  @override
  _JobDetailScreenState createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
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
            FontAwesomeIcons.paperPlane,
            color: Colors.white,
          ),
          label: Text(
            'Apply',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xfffc5185),
          onPressed: () => _apply(widget.job.applyUrl),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 0.8 * MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.job.id,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 0.8 * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xfffc5185),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 80.0, 15.0, 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
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
                                    image: _loadImage(widget.job.company),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Text(
                                  widget.job.company.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
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
                                    widget.job.commitment.title,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                widget.job.isFeatured != null &&
                                        widget.job.isFeatured
                                    ? "Featured "
                                    : " ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  _displayRemote(
                                      widget.job.remotes.length == 0),
                                  _displayCity(widget.job),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
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
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                controller: _hideButtonController,
                children: [
                  Text(
                    widget.job.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  MarkdownBody(
                    data: widget.job.description,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _loadImage(Company company) {
    String url = company.logoUrl;
    return (url != null && url != "")
        ? NetworkImage(url)
        : AssetImage("assets/images/zerofiltre.png");
  }

  Widget _displayRemote(bool isRemote) {
    return isRemote
        ? Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.wifi,
                size: 10.0,
                color: Colors.white,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "Remote",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        : Container();
  }

  Widget _displayCity(Job job) {
    return job.cities.length != 0
        ? Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.locationArrow,
                size: 10.0,
                color: Colors.white,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                job.cities[0].name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          )
        : Container();
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
}
