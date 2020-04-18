import 'package:graphqljobs/models/Tag.dart';
import 'package:graphqljobs/models/guest_model.dart';

class Workshop {
  final String title, level, description, date;
  final List<Tag> tags;
  final String begin, end;
  final List<Guest> speakers;

  Workshop({this.title,
    this.level,
    this.date,
    this.description,
    this.tags,
    this.begin,
    this.end,
    this.speakers});
}

Workshop whyGraphQL = Workshop(
  title: 'Why GraphQL ?',
  description:
  'You have heard that GraphQL is an amazing technology but you are not sure why? In this talk you will learn when and why to use GraphQL and how it can fit with existing backend services in your organisation to improve the performance.',
  level: 'Beginner',
  date: 'Feb 20, 2022',
  begin: '9:00 AM',
  end: '10:00 AM',
  speakers: [shipragupta],
);
Workshop buildAppReactApollo = Workshop(
  title: 'Building apps with React & Apollo Client',
  description:
  "React embraces declarative model for building UI's. But data fetching in typical applications is still imperative. GraphQL client libraries like Apollo Client solve this problem and help us use declarative data fetching to build apps and get rid of lot of data fetching boilerplate code. In this workshop, lets build a simple e-commerce app with React and learn how to leverage features of GraphQL & Apollo Client for effective data fetching, state management and real-time updates",
  level: 'Intermediate',
  date: 'Feb 20, 2022',
  begin: '10:30 AM',
  end: '12:00 AM',
  speakers: [kirankumaraburi],
  tags: [
    Tag(
      name: 'Apollo',
    ),
    Tag(
      name: 'React',
    ),
  ],
);
Workshop buildserverlessapps = Workshop(
  title: 'Building apps with React & Apollo Client',
  description:
  "Build high-performance GraphQL & serverless apps with the 3factor app architecture",
  level: 'Intermediate',
  date: 'Feb 20, 2022',
  begin: '01:00 PM',
  end: '03:00 PM',
  speakers: [tirumaraiselvan],
  tags: [
    Tag(
      name: 'Serverless',
    ),
    Tag(
      name: '3Factor',
    ),
  ],
);
Workshop buildscalabledgraph = Workshop(
  title: 'Building scalable GraphQL apps with ease using Dgraph',
  description:
  "If you want to get started with GraphQL in minutes and don't want to worry much about the server-side, this workshop is for you.That said you might still have questions that bother you regarding the scalability and performance of your GraphQL API, as your application grows and becomes more complex. Don't worry we will address all these questions in this fun-filled workshop.",
  level: 'Intermediate',
  date: 'Feb 20, 2022',
  begin: '03:30 PM',
  end: '06:30 PM',
  speakers: [michaelcompton],
  tags: [
    Tag(
      name: 'Serverless',
    ),
    Tag(
      name: '3Factor',
    ),
  ],
);
List<Workshop> graphqlasiaWorkshops = [
  whyGraphQL,
  buildAppReactApollo,
  buildserverlessapps,
  buildscalabledgraph,
];

Workshop powerGrapql = Workshop(
  title: 'Power of GraphQL Query Language',
  description:
  "GraphQL is a query language that provides an efficient, powerful and flexible approach to developing web APIs. GraphQL has gained immense popularity in the last few years with many Fortune 500 companies using them for their product development. In this talk, we will learn the core concepts of the GraphQL Query Language. You will learn about Types, Queries and Mutations, and how they are used to work with your API data. I will be showcasing these concepts using the GitHub's Public GraphQL API. You can follow along, and have fun learning the core concepts of the GraphQL Query Language. The purpose of this talk, is to spark your interest in GraphQL and understand the fundamental concepts of the GraphQL Query Language and Schema.",
  level: 'Beginner',
  date: 'Jan 31, 2021',
  begin: '5:15 PM',
  speakers: [adhitiRavichandran],
);
Workshop futurerealtimeoffline = Workshop(
  title: 'The Future of Real-time | Offline | Data',
  description:
  "Complexity, and the consistent attempts to reduce complexity, is at the core of the evolution of technology. As technology evolves, we then find harder problems to solve and are presented with new challenges. In the client space, we've seen innovation that has addressed how we deal with modern application concerns like real-time and offline data while GraphQL has continued to gain in market share. What happens when we take the advancements that GraphQL has introduced as a paradigm and combine them with a mental model that all data should be local and offline first, with eventual consistency to your database as a second thought? In this talk, I'll talk about a data store paradigm that allows developers to work with a single, local database and source of truth, and the idea that you should not have to make more than one write action to have (eventual) consistency across the client and server.",
  level: 'Beginner',
  date: 'Jan 31, 2021',
  begin: '05:40 PM',
  speakers: [naderdabit],
  tags: [
    Tag(
      name: 'Realtime',
    ),
    Tag(
      name: 'Serverless',
    ),
  ],
);
Workshop scalableserverlessperformant = Workshop(
  title: 'GraphQL as a scalable & performant data API for serverless',
  description:
  "Accessing and working with data is not easy with serverless, because traditional methods of database access don't work well. In this talk, I will discuss the key problems around working with databases when building serverless application logic and approaches to solving them. I will motivate problems like connection pooling, cold-starts, handling spiky concurrent loads, database transactions and transient failures. I will then present GraphQL as a possible solution for building a high-performance data API that can scale to serverless workloads. I will talk about the pros & cons of this approach. Finally, I will do some live code demos and make the problems and solutions discussed previously more concrete!",
  level: 'Intermediate',
  date: 'Jan 31, 2021',
  begin: '06:05 PM',
  speakers: [tanmanigopal],
  tags: [
    Tag(
      name: 'Realtime',
    ),
    Tag(
      name: 'Serverless',
    ),
  ],
);
Workshop graphqlwithoutdatabse = Workshop(
  title: 'GraphQL Without a Database',
  description:
  "Your frontend developers are pushing to get started with GraphQL, but you don't have the backend capacity to migrate your existing REST APIs to GraphQL? Or you want to have a GraphQL API next to your existing endpoints that are based on REST, without having to rewrite all your controllers? In this talk I'll show how to wrap existing REST APIs into one single GraphQL endpoint on both the client and server side. This allows you to access the power of GraphQL without having to change any of your existing code or connect to a database.",
  level: 'Intermediate',
  date: 'Jan 31, 2021',
  begin: '06:55 PM',
  speakers: [royderks],
  tags: [
    Tag(
      name: 'Realtime',
    ),
    Tag(
      name: 'Serverless',
    ),
    Tag(
      name: 'Database',
    ),
  ],
);
Workshop queryanalysis = Workshop(
  title: 'Query Analysis - Rebooted',
  description:
  "Your frontend developers are pushing to get started with GraphQL, but you don't have the backend capacity to migrate your existing REST APIs to GraphQL? Or you want to have a GraphQL API next to your existing endpoints that are based on REST, without having to rewrite all your controllers? In this talk I'll show how to wrap existing REST APIs into one single GraphQL endpoint on both the client and server side. This allows you to access the power of GraphQL without having to change any of your existing code or connect to a database.",
  level: 'Intermediate',
  date: 'Jan 31, 2021',
  begin: '07:20 PM',
  speakers: [claireknight],
  tags: [
    Tag(
      name: 'Query',
    ),
  ],
);
Workshop continuousmining = Workshop(
  title: 'Continuous Mining of Github with GraphQL',
  level: 'Beginner',
  date: 'Jan 31, 2021',
  begin: '07:45 PM',
  speakers: [banjoobayomi],
  tags: [
    Tag(
      name: 'Mining',
    ),
  ],
);
List<Workshop> byteconfWorkshops = [
  powerGrapql,
  futurerealtimeoffline,
  scalableserverlessperformant,
  graphqlwithoutdatabse,
  queryanalysis,
  continuousmining,
];