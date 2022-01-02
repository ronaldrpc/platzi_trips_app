import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/ui/widgets/card_photo.dart';
import 'package:platzi_trips_app/widgets/circle_button.dart';
import '../../../widgets/floating_action_button_green.dart';

class CardPhotoDescription extends StatelessWidget {

  String title;
  String description;
  int likes;

  CardPhotoDescription(this.title, this.description, this.likes);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card_title = Container(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          fontFamily: "Lato"
        ),
      ),
    );

    final card_desc = Container(
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      child: Text(
        description,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: "Lato",
          color: Colors.grey
        ),
      )
    );

    final card_likes = Container(
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        child: Text(
          "Hearts: " + likes.toString(),
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: "Lato",
              color: Colors.amber
          ),
        )
    );

    final card_photo_info = Container(
      //height: 125.0, //creo que sin height, se expandira tanto como sus hijos vayan creciendo
      width: 260.0,

      // margin: EdgeInsets.only(
      //   top: 20.0, //80
      //   //left: 20.0
      //   bottom: 20.0,
      // ),
      padding: EdgeInsets.all(15.0),
      
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          card_title,
          card_desc,
          card_likes
        ],
      ),
    );

    return Stack(
      alignment: Alignment(0.9, 1.4),
      children: [
        card_photo_info,
        FloatingActionButtonGreen(
          iconData: Icons.favorite_border,
          onPressed: () {},
        )
      ],
    );
  }

}