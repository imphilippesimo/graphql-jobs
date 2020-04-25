import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graphqljobs/models/event_model.dart';
import 'package:graphqljobs/widgets/graphql-colors.dart';
import 'package:provider/provider.dart';

class EventDetailBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final event = Provider.of<Event>(context);

    return ClipPath(
      clipper: ImageClipper(),
      child: CachedNetworkImage(
        imageUrl: event.imageUrl,
        placeholder: (context, url) => SpinKitDoubleBounce(
          color: GraphQLColors.main,
          size: 50.0,
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
        height: screenHeight * 0.55,
        fit: BoxFit.cover,
        color: GraphQLColors.main,
        colorBlendMode: BlendMode.darken,
      ),
    );
  }
}

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.1);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.9,
        size.width * 0.8, size.height * 0.9);
    path.quadraticBezierTo(
        size.width, size.height * 0.9, size.width, size.height * 0.85);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
