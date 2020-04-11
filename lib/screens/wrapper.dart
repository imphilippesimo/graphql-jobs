import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqljobs/models/user_model.dart';
import 'package:graphqljobs/screens/authenticate/authenticate.dart';
import 'package:graphqljobs/screens/home/home_screen.dart';
import 'package:graphqljobs/service/graphql_client/graphql_conf.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    print(user.toString());
    //return either home or authenticate widget
    final GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
    return GraphQLProvider(
      client: graphQLConfiguration.client,
      child: CacheProvider(
        //child: HomeScreen(),
        child: user == null ? AuthenticateScreen() : HomeScreen(user: user),
      ),
    );
  }
}
