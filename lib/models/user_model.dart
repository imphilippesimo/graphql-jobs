class User {
  final String name;
  final String uid;
  final String photoUrl;
  final String email;

  User({this.name, this.uid, this.photoUrl, this.email});

  @override
  String toString() {
    return 'User{uid: $uid, photoUrl: $photoUrl, email: $email}';
  }
}
