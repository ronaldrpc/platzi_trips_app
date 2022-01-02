import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/model/user.dart';

class ProfileView extends StatelessWidget {

  User user;

  ProfileView(this.user);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final profilePhoto = Container(
      margin: EdgeInsets.only(
        left: 0.0
      ),

      width: 100.0,
      height: 100.0,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(user.photoURL) //AssetImage(user.photoURL)
        ),
        border: Border.all(
          color: Colors.white,
          width: 3
        )
      ),
    );

    final profileName = Container(
      margin: EdgeInsets.only(
        left: 10.0,
      ),
      child: Text(
        user.name,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 25.0,
          color: Colors.white
        ),
      ),
    );

    final profileEmail = Container(
      margin: EdgeInsets.only(
        left: 10.0,
      ),
      child: Text(
        user.email,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 15.0,
            color: Colors.white30
        ),
      ),
    );

    final profileNameEmail = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        profileName,
        profileEmail
      ],
    );

    final profileText = Container(
      margin: EdgeInsets.only(
        top: 50.0
      ),
      child: Text(
        "Profile",
        style: TextStyle(
            fontFamily: "Lato",
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 35.0
        ),
      ),
      alignment: Alignment(-0.8, -0.6)
    );

    final profileDetails = Row(
      children: [
        profilePhoto,
        profileNameEmail
      ],
    );

    return Column(
      children: [
        profileText,
        Container(
          margin: EdgeInsets.only(
            left: 30.0,
            right: 30.0,
            top: 20.0, //130
          ),
          height: 100.0,
          //color: Colors.black.withOpacity(0.5),
          child: profileDetails,
        ),
      ],
    );
  }

}