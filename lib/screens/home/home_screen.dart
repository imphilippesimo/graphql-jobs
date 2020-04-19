import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqljobs/models/event_model.dart';
import 'package:graphqljobs/models/job_model.dart';
import 'package:graphqljobs/models/user_model.dart';
import 'package:graphqljobs/screens/home/profile/profile_screen.dart';
import 'package:graphqljobs/service/graphql_client/graphql_conf.dart';
import 'package:graphqljobs/service/graphql_client/graphql_operations.dart';

import 'blog/article_carousel.dart';
import 'events/event_screen.dart';
import 'jobs/jobs_carousel.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({Key key, this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Event> events = [graphqlAsia, byteConfGraphQL];
  int _selectedIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.briefcase,
    FontAwesomeIcons.locationArrow,
    FontAwesomeIcons.newspaper,
    FontAwesomeIcons.user
  ];
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  GraphQLOperations operations = GraphQLOperations();
  List<Job> jobs = List<Job>();

  var _currentTab = 0;

  var _userCardVisible = false;

  Widget _displayCarousel(List<Job> jobs) {
    if (_selectedIndex == 0) {
      return FutureBuilder<QueryResult>(
        future: _loadJobs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            QueryResult result = snapshot.data;
            if (!snapshot.hasError) {
              if (!result.hasException) {
                for (dynamic jobAsJson in result.data["jobs"]) {
                  jobs.add(Job.fromJson(jobAsJson));
                }
                return JobCarousel(jobs: jobs);
              } else {
                //TODO Handle Graphql error
                print(result.exception);
                return Container();
              }
            } else {
              //TODO Handle future builder error
              print(snapshot.error);
              return Container();
            }
          } else {
            return Padding(
              padding: const EdgeInsets.fromLTRB(100.0, 200.0, 100.0, 200.0),
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                  backgroundColor: Colors.pink,
                ),
              ),
            );
          }
        },
      );
    } else if (_selectedIndex == 1) {
      return EventCarousel(
        user: widget.user,
        events: events,
      );
    } else if (_selectedIndex == 2) {
      return ArticleCarousel(user: widget.user);
    } else {
      return Profile(user: widget.user);
    }
  }

  Future<QueryResult> _loadJobs() async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    return await _client.query(
      QueryOptions(
        documentNode: gql(operations.all()),
      ),
    );
  }

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print(_selectedIndex);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Container(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Work with GraphQL\n' + 'in a modern startup.',
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 5.0),
                              blurRadius: 8.0,
                            ),
                          ]),
                      child: ClipOval(
                        child: Image(
                          image: widget.user.photoUrl != null
                              ? NetworkImage(widget.user.photoUrl)
                              : AssetImage("assets/images/zerofiltre.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (mapEntry) => _buildIcon(mapEntry.key),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 20.0,
            ),
            _displayCarousel(jobs),
          ],
        ),
      ),
    );
  }
}
