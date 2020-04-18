import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphqljobs/models/tag.dart';
import 'package:graphqljobs/models/company_model.dart';
import 'package:graphqljobs/models/job_model.dart';
import 'file:///C:/zerofiltre/services_tech/flutter/graphql_jobs/lib/screens/home/jobs/job_detail_screen.dart';
import 'package:graphqljobs/widgets/tag_tile.dart';

class JobCarousel extends StatelessWidget {
  final List<Job> jobs;

  const JobCarousel({Key key, this.jobs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Recently Posted',
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
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 500,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: jobs.length,
            itemBuilder: (BuildContext context, int index) {
              Job job = jobs[index];
              return GestureDetector(
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => JobDetailScreen(
                      job: job,
                    ),
                  ),
                );},
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  height: 300.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 10.0,
                        child: Container(
                          height: 120.0,
                          width: 380,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${job.title}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 25.0,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: job.tags.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Tag tag = job.tags[index];
                                      return Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            2.0, 0.0, 2.0, 0.0),
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
                      Hero(
                        tag: job.id,
                        child: Container(
                          width: 400,
                          height: 180,
                          decoration: BoxDecoration(
                              color: Color(0xfffc5185),
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      height: 100.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(0.0, 5.0),
                                              blurRadius: 8.0,
                                            ),
                                          ]),
                                      child: ClipOval(
                                        child: Image(
                                          image: _loadImage(job.company),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: Text(
                                        job.company.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
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
                                          size: 10.0,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          job.commitment.title,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      job.isFeatured != null && job.isFeatured
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        _displayRemote(job.remotes.length == 0),
                                        _displayCity(job),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
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

  _loadImage(Company company) {
    String url = company.logoUrl;
    return (url != null && url != "")
        ? NetworkImage(url)
        : AssetImage("assets/images/zerofiltre.png");
  }
}
