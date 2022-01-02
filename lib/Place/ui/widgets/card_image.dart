import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../widgets/floating_action_button_green.dart';

class CardImage extends StatelessWidget{

  final String pathImage;
  final double height;
  final double width;
  double left = 20.0;
  double bottom = 20.0;
  final VoidCallback onPressedFabIcon;
  final IconData iconData;

  CardImage({
    required this.pathImage,
    required this.iconData,
    this.height = 250.0,
    this.width = 250.0,
    required this.onPressedFabIcon
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
      height: height, //350
      width: width, //250

      margin: EdgeInsets.only(
        //top: 80.0, //80
        left: left,
        bottom: bottom
      ),

      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: pathImage.contains('http') ? CachedNetworkImageProvider(pathImage) : FileImage(File(pathImage)) as ImageProvider, // casting xd
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]
      ),
    );

    return Stack(
      alignment: Alignment(0.9, 1.0), //0.9, 1.1
      children: [
        card,
        FloatingActionButtonGreen(
          iconData: iconData,
          onPressed: onPressedFabIcon,
        )
      ],
    );
  }

}