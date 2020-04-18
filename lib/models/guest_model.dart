import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphqljobs/models/sociallink_model.dart';
import 'package:graphqljobs/models/user_model.dart';

import 'company_model.dart';

class Guest extends User {
  final String function;
  final List<SocialLink> socialLinks;
  final Company company;

  Guest(
      {this.socialLinks,
      this.company,
      this.function,
      name,
      uid,
      photoUrl,
      email})
      : super(name: name, uid: uid, photoUrl: photoUrl, email: email);
}

Guest robertzhu = Guest(
    company: aws,
    function: 'Principal technical Evangelist',
    name: 'Robert Zhu',
    photoUrl:
        'https://graphql.asia/static/Robert-Zhu-82597f14e2e94ef7746f07865ca72e25.png',
    socialLinks: [
      SocialLink(
          url: 'https://github.com/robzhu', icon: FontAwesomeIcons.github),
      SocialLink(
          url: 'https://twitter.com/rbzhu/', icon: FontAwesomeIcons.twitter),
    ]);
Guest manishjain = Guest(
    company: dgraph,
    function: 'Founder',
    name: 'Manish Jain',
    photoUrl:
        'https://graphql.asia/static/manish-jain-639dab9341aacc0b638d39e13812a218.jpeg',
    socialLinks: [
      SocialLink(
          url: 'https://manishrjain.github.io/', icon: FontAwesomeIcons.github),
      SocialLink(
          url: 'https://twitter.com/manishrjain',
          icon: FontAwesomeIcons.twitter),
    ]);
Guest vishakasingh = Guest(
    company: paypal,
    function: 'Software Engineer',
    name: 'Vishakha Singh',
    photoUrl:
        'https://graphql.asia/static/Vishakha-Singh-091b5808cd257b0ed9638a112e2e5a1b.png',
    socialLinks: [
      SocialLink(
          url: 'https://twitter.com/visheei', icon: FontAwesomeIcons.twitter),
    ]);
Guest ivangoncharov = Guest(
    company: apisdotguru,
    function: 'GraphQL Consultant',
    name: 'Ivan Goncharov',
    photoUrl:
        'https://graphql.asia/static/Ivan-Goncharov-cf8f3d373235ba5eef620bf1f7827692.png',
    socialLinks: [
      SocialLink(
        url: 'https://github.com/IvanGoncharov',
        icon: FontAwesomeIcons.github,
      ),
      SocialLink(
        url: 'https://twitter.com/E1Goncharov',
        icon: FontAwesomeIcons.twitter,
      ),
    ]);
Guest radoslovstankov = Guest(
    company: productHunt,
    function: 'Head of Engineering',
    name: 'Ivan Goncharov',
    photoUrl:
        'https://graphql.asia/static/Radoslav-Stankov-ad60bd440ab4555d8e8dfaf48f01796d.png',
    socialLinks: [
      SocialLink(
        url: 'https://gist.github.com/RStankov',
        icon: FontAwesomeIcons.github,
      ),
      SocialLink(
        url: 'https://twitter.com/rstankov',
        icon: FontAwesomeIcons.twitter,
      ),
    ]);
Guest tanmanigopal = Guest(
    company: hasura,
    function: 'CEO',
    name: 'Tanmani Gopal',
    photoUrl:
        'https://graphql.asia/static/Tanmai-de38a85a7cbcb8ca972373e0a3d9b617.jpg',
    socialLinks: [
      SocialLink(
        url: 'https://github.com/coco98',
        icon: FontAwesomeIcons.github,
      ),
      SocialLink(
        url: 'https://twitter.com/tanmaigo',
        icon: FontAwesomeIcons.twitter,
      ),
    ]);
Guest kirankumaraburi = Guest(
    company: neostack,
    function: 'FOUNDER',
    name: 'Kiran Kumar Aburi',
    photoUrl:
        'https://graphql.asia/static/Kiran-Kumar-b14e00bde96b6e06ff3f1cf0701c3dec.png',
    socialLinks: [
      SocialLink(
        url: 'https://twitter.com/kiran_abburi',
        icon: FontAwesomeIcons.twitter,
      ),
    ]);
Guest shipragupta = Guest(
    company: adobe,
    function: 'Computer scientist',
    name: 'Shipra Gupta',
    photoUrl:
        'https://graphql.asia/static/Shipra-Gupta-cb918227de9abde1525a3340e4f23098.png',
    socialLinks: [
      SocialLink(
        url: 'https://github.com/shipraguptaa',
        icon: FontAwesomeIcons.twitter,
      ),
    ]);
Guest michaelcompton = Guest(
    company: dgraph,
    function: 'GraphQL Lead',
    name: 'Michael Compton',
    photoUrl:
        'https://graphql.asia/static/Michael-Compton-9656ea78b34231f193d476e49c91e36c.jpg',
    socialLinks: [
      SocialLink(
        url: 'https://github.com/MichaelJCompton%E2%80%8B',
        icon: FontAwesomeIcons.github,
      ),
    ]);
Guest tirumaraiselvan = Guest(
  company: hasura,
  function: 'Product Manager',
  name: 'Tirumarai Selvan',
  photoUrl:
      'https://graphql.asia/static/tiru-f466870a791367478f65ef4b0ad65e5e.jpg',
);

Guest adhitiRavichandran = Guest(
    company: redivusHealth,
    name: 'Adhithi Ravichandran',
    photoUrl:
        'https://cdn.sanity.io/images/82qqyrei/byteconf/4f0c1a99d72baca515212e9d07988da95895d404-675x676.png?w=675&h=676&fit=crop',
    socialLinks: [
      SocialLink(
        url: 'http://adhithiravichandran.com/',
        icon: FontAwesomeIcons.link,
      ),
      SocialLink(
        url: 'https://github.com/adhithiravi',
        icon: FontAwesomeIcons.github,
      ),
      SocialLink(
        url: 'https://twitter.com/AdhithiRavi',
        icon: FontAwesomeIcons.twitter,
      ),
    ]);
Guest banjoobayomi = Guest(
    company: twoSixLabs,
    name: 'Banjo Obajomi',
    photoUrl:
        'https://cdn.sanity.io/images/82qqyrei/byteconf/7a4d8f81dbb97d64daa2cb12f80d2fce3e6a0752-400x400.jpg?w=400&h=400&fit=crop',
    socialLinks: [
      SocialLink(
        url: 'https://www.cloudscreen.io/',
        icon: FontAwesomeIcons.link,
      ),
      SocialLink(
        url: 'https://twitter.com/banjtheman',
        icon: FontAwesomeIcons.twitter,
      ),
    ]);
Guest claireknight = Guest(
    company: github,
    name: 'Claire Knight',
    photoUrl:
        'https://cdn.sanity.io/images/82qqyrei/byteconf/ed03cd1b375590624e0ca4a75994b07e42a86406-400x400.jpg?w=400&h=400&fit=crop',
    socialLinks: [
      SocialLink(
        url: 'https://t.co/Q0sJdcd0rz?amp=1',
        icon: FontAwesomeIcons.link,
      ),
      SocialLink(
        url: 'https://twitter.com/krider2010',
        icon: FontAwesomeIcons.twitter,
      ),
      SocialLink(
        url: 'https://github.com/krider2010',
        icon: FontAwesomeIcons.github,
      ),
    ]);
Guest naderdabit = Guest(
    company: amazon,
    name: 'Nader Dabit',
    photoUrl:
        'https://cdn.sanity.io/images/82qqyrei/byteconf/a0f6da2edab4584543e3552fc3bf434c4f87888a-580x580.png?w=580&h=580&fit=crop',
    socialLinks: [
      SocialLink(
        url: 'http://www.naderdabit.me/#/',
        icon: FontAwesomeIcons.link,
      ),
      SocialLink(
        url: 'https://twitter.com/dabit3',
        icon: FontAwesomeIcons.twitter,
      ),
      SocialLink(
        url: 'https://github.com/dabit3',
        icon: FontAwesomeIcons.github,
      ),
    ]);
Guest royderks = Guest(
    company: hackTeam,
    name: 'Roy Derks',
    photoUrl:
        'https://cdn.sanity.io/images/82qqyrei/byteconf/3e8dc910eea456a7ae5a15cea4a733f6b45e1063-900x900.jpg?w=900&h=900&fit=crop',
    socialLinks: [
      SocialLink(
        url: 'https://medium.com/hackteam',
        icon: FontAwesomeIcons.link,
      ),
      SocialLink(
        url: 'https://twitter.com/gethackteam',
        icon: FontAwesomeIcons.twitter,
      ),
      SocialLink(
        url: 'https://github.com/royderks',
        icon: FontAwesomeIcons.github,
      ),
    ]);

List<Guest> graphqlAsiaGuests = [
  tirumaraiselvan,
  michaelcompton,
  shipragupta,
  kirankumaraburi,
  tanmanigopal,
  radoslovstankov,
  ivangoncharov,
  vishakasingh,
  manishjain,
  robertzhu
];
List<Guest> byteConfGuests = [
  royderks,
  naderdabit,
  claireknight,
  banjoobayomi,
  adhitiRavichandran,
  tanmanigopal
];
