import 'package:flutter/material.dart';
import 'package:graphqljobs/models/user_model.dart';
import 'package:graphqljobs/screens/wrapper.dart';
import 'package:graphqljobs/service/auth/auth.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(StreamProvider<User>.value(
    value: AuthService().user,
    child: MaterialApp(
      title: 'GraphQL Jobs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: GraphqlJobs(),
    ),
  ));
}

class GraphqlJobs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrapper();
  }
}
