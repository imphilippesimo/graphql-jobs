import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqljobs/models/job_model.dart';
import 'package:graphqljobs/service/graphql_client/graphql_conf.dart';
import 'package:graphqljobs/service/graphql_client/graphql_operations.dart';
import 'package:graphqljobs/widgets/job_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.briefcase,
    FontAwesomeIcons.building,
    FontAwesomeIcons.tags,
    FontAwesomeIcons.paperPlane
  ];
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  GraphQLOperations operations = GraphQLOperations();
  List<Job> jobs = List<Job>();

  var _currentTab = 0;

  Widget _displayCarousel(List<Job> jobs) {
    return _selectedIndex == 0
        ? JobCarousel(jobs: jobs)
        : JobCarousel(jobs: jobs);
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
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'Work with GraphQL in a modern startup.',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
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
            FutureBuilder<QueryResult>(
              future: _loadJobs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  QueryResult result = snapshot.data;
                  if (!snapshot.hasError) {
                    if (!result.hasException) {
                      for (dynamic jobAsJson in result.data["jobs"]) {
                        jobs.add(Job.fromJson(jobAsJson));
                      }
                      return _displayCarousel(jobs);
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
                    padding:
                        const EdgeInsets.fromLTRB(100.0, 200.0, 100.0, 200.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 8,
                        backgroundColor: Colors.pink,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: _currentTab,
//        onTap: (int value) {
//          setState(() {
//            _currentTab = value;
//          });
//        },
//        items: [
//          BottomNavigationBarItem(
//            icon: Icon(
//              Icons.search,
//              size: 30.0,
//            ),
//            title: SizedBox.shrink(),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(
//              Icons.local_pizza,
//              size: 30.0,
//            ),
//            title: SizedBox.shrink(),
//          ),
//          BottomNavigationBarItem(
//            icon: CircleAvatar(
//              radius: 15.0,
//              backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
//            ),
//            title: SizedBox.shrink(),
//          ),
//        ],
//      ),
    );
  }
}
