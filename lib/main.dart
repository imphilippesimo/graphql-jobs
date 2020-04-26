import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:graphqljobs/models/user_model.dart';
import 'package:graphqljobs/screens/wrapper.dart';
import 'package:graphqljobs/service/auth/auth.dart';
import 'package:graphqljobs/widgets/graphql-colors.dart';
import 'package:graphqljobs/widgets/text_style_guide.dart';
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
          fontFamily: 'Montserrat'),
      home: Scaffold(
        body: Stack(
          children: [
            SplashScreen.navigate(
              backgroundColor: Colors.white,
              name: 'assets/animations/splashscreen.flr',
              next: (context) => GraphqlJobs(),
              until: () => Future.delayed(Duration(seconds: 5)),
              loopAnimation: 'go',
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = Offset(0.0, 1.0);
                var end = Offset.zero;
                var curve = Curves.easeInOut;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
            Positioned(
              bottom: 300,
              left: 150,
              child: Text(
                "GraBQL",
                style: TextStyleGuide.mainTitle(GraphQLColors.main)
                    .copyWith(fontFamily: 'Montserrat'),
              ),
            ),
            Positioned(
              bottom: 80,
              left: 125,
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/zerofiltre.png'),
                    height: 50,
                    width: 50,
                  ),
                  Text(
                    "By zerofiltre.tech",
                    style: TextStyleGuide.eventDetailDescription(
                      Color(0xFF3EBACE),
                    ).copyWith(fontFamily: 'Montserrat'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  ));
}

class GraphqlJobs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrapper();
  }
}
