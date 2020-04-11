import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqljobs/screens/home_screen.dart';
import 'package:graphqljobs/service/graphql_client/graphql_conf.dart';


void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'GraphQL Jobs',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color(0xFF3EBACE),
      accentColor: Color(0xFFD8ECF1),
      scaffoldBackgroundColor: Color(0xFFF3F5F7),
    ),
    home: GraphqlJobs(),
  ));
}

class GraphqlJobs extends StatelessWidget {
  final GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphQLConfiguration.client,
      child: CacheProvider(
        child: HomeScreen(),
      ),
    );
  }
}
