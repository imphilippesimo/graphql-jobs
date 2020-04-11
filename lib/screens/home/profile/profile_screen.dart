import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphqljobs/models/user_model.dart';
import 'package:graphqljobs/service/auth/auth.dart';
import 'package:graphqljobs/widgets/signin_button.dart';

class Profile extends StatefulWidget {
  final User user;
  final AuthService _auth = AuthService();

  Profile({Key key, this.user}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Text(
            'Hey ${widget.user.email != null ? widget.user.email : 'dear anonymous user'} 🤗 , \n\nThis is your profile preference page, \n\nFeel free to leave at any time.',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          )),
        ),
        Container(
          height: 50,
          width: 200,
          child: SignInButton(
            textContent: 'Log out',
            onPressed: () => _logOut(),
            foreGroundColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
            icon: FontAwesomeIcons.doorOpen,
          ),
        ),
      ],
    );
  }
  _logOut() async {
    await widget._auth.signOut();

  }
}
