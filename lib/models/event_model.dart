import 'package:graphqljobs/models/company_model.dart';
import 'package:graphqljobs/models/workshop_model.dart';

import 'guest_model.dart';

class Event {
  final String title,
      description,
      location,
      punchline1,
      punchline2,
      date,
      eventUrl,
      imageUrl;
  final List<Guest> guests;
  final List<Workshop> workshops;
  final List<Company> sponsors;

  Event(
      {this.eventUrl,
      this.title,
      this.description,
      this.location,
      this.punchline1,
      this.punchline2,
      this.imageUrl,
      this.guests,
      this.date,
      this.workshops,
      this.sponsors});
}

Event graphqlAsia = Event(
  title: 'GraphQL Asia 2021',
  location: 'THE LEELA PALACE, BENGALURU',
  date: 'Feb 20, 2021',
  eventUrl: 'https://graphql.asia/',
  imageUrl:
      'https://graphql.asia/static/hall-4bbbfc51673e2586c8ed4c45ff387477.png',
  punchline1: 'Asia’s largest GraphQL conference ',
  punchline2: 'is back!',
  description:
      'GraphQL Asia is the largest gathering of the GraphQL community in Asia! With over 500 people expected at the 2020 edition, you’ll meet the creators of leading GraphQL tooling, talk to the experts implementing GraphQL in their companies as well as practitioners and enthusiasts from Asia and the rest of the world.',
  guests: graphqlAsiaGuests,
  workshops: graphqlasiaWorkshops,
  sponsors: [
    atlassian,
    dgraph,
    awsamplify,
    hasura,
  ],
);
Event byteConfGraphQL = Event(
  title: 'Byteconf GraphQL 2021',
  date: 'Jan 31, 2021',
  eventUrl: 'https://www.bytesized.xyz/graphql-2020',
  imageUrl:
      'https://byteconf-production.s3.amazonaws.com/headers/byteconf-graphql.png',
  punchline1: 'Byteconf GraphQL ',
  punchline2:
      'is 100% FREE.',
  description:
      "Byteconf GraphQL is a 100% free single-day conference with the best GraphQL speakers and teachers in the world.",
  guests: byteConfGuests,
  workshops: byteconfWorkshops,
  sponsors: [
    fauna,
    awsamplify,
    hasura,
  ],
);

List<Event> events = [
  graphqlAsia,
  byteConfGraphQL,
];
