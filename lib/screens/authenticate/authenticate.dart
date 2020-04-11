import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphqljobs/widgets/signin_button.dart';
import 'package:graphqljobs/service/auth/auth.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthenticateScreen extends StatefulWidget {
  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  static const String GITHUB_CLIENT_ID = 'b917e227c0f892a03643';
  static const GITHUB_CLIENT_SECRET =
      '6fc3e7f056ab3deb6efc45b37a0fb7b65b37292d';
  AuthService _authService = AuthService();

  StreamSubscription _subs;

  @override
  void initState() {
    _initDeepLinkListener();
    super.initState();
  }

  @override
  void dispose() {
    _disposeDeepLinkListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 200.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Sign in with',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 100.0),
              SignInButton(
                  textContent: 'Github',
                  icon: FontAwesomeIcons.github,
                  backgroundColor: Colors.black,
                  foreGroundColor: Colors.white,
                  onPressed: () => _fireGithubSignIn()),
              SizedBox(height: 20.0),
              SignInButton(
                textContent: 'Google',
                icon: FontAwesomeIcons.google,
                backgroundColor: Colors.pinkAccent,
                foreGroundColor: Colors.white,
                onPressed: () => _fireGoogleSignIn(),
              ),
              SizedBox(height: 20.0),
              SignInButton(
                textContent: 'LinkedIn',
                icon: FontAwesomeIcons.linkedin,
                backgroundColor: Colors.blueAccent,
                foreGroundColor: Colors.white,
                onPressed: () => _fireLinkedInSignIn(),
              ),
              SizedBox(height: 20.0),
              SignInButton(
                textContent: 'Incognito',
                icon: FontAwesomeIcons.user,
                backgroundColor: Theme.of(context).primaryColor,
                foreGroundColor: Colors.white,
                onPressed: () => _fireAnonymousSignIn(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _fireGithubSignIn() {
    onClickGitHubLoginButton();
  }

  _fireGoogleSignIn() {
    print('google sign in fired');
  }

  _fireLinkedInSignIn() {
    print('linked in sign in fired');
  }

  _fireAnonymousSignIn() {
    onClickAnonymousLoginButton();
  }

  void onClickGitHubLoginButton() async {
    const String url = "https://github.com/login/oauth/authorize" +
        "?client_id=" +
        GITHUB_CLIENT_ID +
        "&scope=public_repo%20read:user%20user:email";

    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      print("CANNOT LAUNCH THIS URL!");
    }
  }

  void onClickAnonymousLoginButton() async {
    await _authService.logInAnonymous().then((firebaseUser) {
      print("LOGGED IN AS: " + firebaseUser.toString());
    }).catchError((e) {
      print("LOGIN ERROR: " + e.toString());
    });;
  }

  void _initDeepLinkListener() async {
    _subs = getLinksStream().listen((String link) {
      _checkDeepLink(link);
    }, cancelOnError: true);
  }

  void _checkDeepLink(String link) {
    if (link != null) {
      print("Link = " + link);
      String code = link.substring(link.indexOf(RegExp('code=')) + 5);
      print("code= " + code);
      _authService.loginWithGitHub(code).then((firebaseUser) {
        print("LOGGED IN AS: " + firebaseUser.toString());
      }).catchError((e) {
        print("LOGIN ERROR: " + e.toString());
      });
    }
  }

  void _disposeDeepLinkListener() {
    if (_subs != null) {
      _subs.cancel();
      _subs = null;
    }
  }
}
