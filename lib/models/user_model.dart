class User {
  final String uid;
  final String photoUrl;
  final String email;

  User({this.uid, this.photoUrl, this.email});

  @override
  String toString() {
    return 'User{uid: $uid, photoUrl: $photoUrl, email: $email}';
  }


}