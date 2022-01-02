import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/model/place.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final List<Place>? myPlaces;
  final List<Place>? myFavoritePlaces;

  // User({required this.uid, name, email, photoURL, myPlaces, myFavoritePlaces}){
  //   name != null ? this.name = name : this.name = "";
  //   email != null ? this.email = email : this.email = "";
  //   photoURL != null ? this.photoURL = photoURL : this.photoURL = "";
  //   myPlaces != null ? this.myPlaces = myPlaces : this.myPlaces = [];
  //   myFavoritePlaces != null ? this.myFavoritePlaces = myFavoritePlaces : this.myFavoritePlaces = [];
  // }

  User({
    Key? key,
    required this.uid,
    required this.name,
    required this.email,
    required this.photoURL,
    this.myPlaces,
    this.myFavoritePlaces
  });

  /*
  *
  * */

}