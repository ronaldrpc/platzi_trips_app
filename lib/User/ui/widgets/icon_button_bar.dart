import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconButtonBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final bookmarkIcon = Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white
      ),
      child: Icon(
        Icons.bookmark_outline_sharp,
        color: Colors.indigo,
      ),
    );

    final cardGiftIcon = Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.5)
      ),
      child: Icon(
        Icons.card_giftcard,
        color: Colors.indigo,
      ),
    );

    final addIcon = Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
      ),
      child: Icon(
        Icons.add,
        color: Colors.indigo,
        size: 45.0,
      ),
    );

    final emailIcon = Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.5)
      ),
      child: Icon(
        Icons.email_outlined,
        color: Colors.indigo,
      ),
    );

    final personIcon = Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.5)
      ),
      child: Icon(
        Icons.person,
        color: Colors.indigo,
      ),
    );

    return Container(
      margin: EdgeInsets.only(
        left: 30.0,
        right: 30.0,
        top: 20.0,
      ),

      height: 70.0,
      //color: Colors.black.withOpacity(0.5),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          bookmarkIcon,
          cardGiftIcon,
          addIcon,
          emailIcon,
          personIcon
        ],
      ),
    );
  }

}