import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:graphqljobs/models/github.dart';
import 'package:graphqljobs/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static const String GITHUB_CLIENT_ID = 'b917e227c0f892a03643';
  static const GITHUB_CLIENT_SECRET =
      '6fc3e7f056ab3deb6efc45b37a0fb7b65b37292d';

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((fbUser) => _userFromFirebaseUser(fbUser));
  }

  //create user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser fbUser) {
    return fbUser != null
        ? User(uid: fbUser.uid, photoUrl: fbUser.photoUrl, email: fbUser.email)
        : null;
  }

  //sign in via anon
  Future<User> logInAnonymous() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print("Anonymous login happen due to: " + e.toString());
      return null;
    }
  }

  //sign in via github
  Future<User> loginWithGitHub(String code) async {
    //ACCESS TOKEN REQUEST
    final response = await http.post(
      "https://github.com/login/oauth/access_token",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: jsonEncode(GitHubLoginRequest(
        clientId: GITHUB_CLIENT_ID,
        clientSecret: GITHUB_CLIENT_SECRET,
        code: code,
      )),
    );

    GitHubLoginResponse loginResponse =
        GitHubLoginResponse.fromJson(json.decode(response.body));

    //FIREBASE STUFF
    final AuthCredential credential = GithubAuthProvider.getCredential(
      token: loginResponse.accessToken,
    );

    final FirebaseUser user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    return _userFromFirebaseUser(user);
    ;
  }

  //sign in via google

  //sign in via linkedIn

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("Sign out error happen due to: " + e.toString());
      return null;
    }
  }
}
