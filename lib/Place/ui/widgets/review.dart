import 'package:flutter/material.dart';

class Review extends StatelessWidget{
  
  String pathDecorationImage;
  String name;
  String info;
  String comment;
  
  Review(this.pathDecorationImage, this.name, this.info, this.comment);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final fullStar = Container(
      margin: const EdgeInsets.only(
          left: 3.0
      ),
      child: const Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );

    final halfStar = Container(
      margin: const EdgeInsets.only(
          left: 3.0
      ),
      child: const Icon(
        Icons.star_half,
        color: Colors.amber,
      ),
    );

    final borderStar = Container(
      margin: const EdgeInsets.only(
          left: 3.0
      ),
      child: const Icon(
        Icons.star_border,
        color: Colors.amber,
      ),
    );

    final photo = Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0
      ),

      width: 80.0,
      height: 80.0,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathDecorationImage)
        )
      ),

    );

    final userName = Container(
      margin: EdgeInsets.only(
        left: 20.0
      ),

      child: Text(
        name,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 17.0
        ),
      ),
    );

    final userInfo = Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),

      child: Row(
        children: [
          Text(
            info,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 13.0,
              color: Colors.grey
            ),
          ),
          fullStar,
          fullStar,
          fullStar,
          halfStar,
          borderStar
        ],
      ),
    );

    final userComment = Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),

      child: Text(
        comment,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 17.0,
          fontWeight: FontWeight.w800
        ),
      ),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        userName,
        userInfo,
        userComment
      ],
    );

    return Row(
      children: <Widget>[
        photo,
        userDetails
      ],
    );
  }

}