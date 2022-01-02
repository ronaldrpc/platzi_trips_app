import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'card_photo_description.dart';

class CardPhoto extends StatelessWidget {

  // String pathImage;
  // String title;
  // String description;
  Place place;

  //CardPhoto(this.pathImage, this.title, this.description);
  CardPhoto(this.place);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
      height: 220.0, //350
      width: 360.0, //250

      // margin: EdgeInsets.only(
      //   top: 35.0, //80
      //   //left: 20.0
      //   bottom: 25.0,
      // ),

      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: NetworkImage(place.urlImage), // AssetImage(pathImage),
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
      )
    );

    return Container(
      margin: EdgeInsets.only(
        top: 20.0,
        bottom: 20.0
      ),

      padding: EdgeInsets.only(
        bottom: 50.0,
      ),

      child: Stack(
        alignment: Alignment(0.0, 1.8),
        children: [
          card,
          CardPhotoDescription(place.name, place.description, place.likes)
        ],
      ),
    );
  }

}