import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphqljobs/models/event_model.dart';
import 'package:provider/provider.dart';

import 'event_detail_background.dart';
import 'event_detail_content.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  const EventDetailScreen({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<Event>.value(
        value: event,
        child: Stack(
          children: <Widget>[
            EventDetailBackground(),
            EventDetailContent(),
          ],
        ),
      ),
    );
  }
}
