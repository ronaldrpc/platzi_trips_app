import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'card_photo.dart'; //

class CardPhotoList extends StatelessWidget {

  late UserBloc userBloc;
  final User user;

  CardPhotoList({required this.user});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of<UserBloc>(context);

    // Place place1 = Place(
    //     id: id,
    //     name: name,
    //     description: description,
    //     uriImage: uriImage,
    //     userOwner: userOwner
    // );

    return StreamBuilder(
      stream: userBloc.myPlacesListStream(user.uid),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.done:
            return Column(
              children: userBloc.buildMyPlaces(snapshot.data.docs),
            );
          case ConnectionState.active:
            return Column(
              children: userBloc.buildMyPlaces(snapshot.data.docs),
            );
          case ConnectionState.none:
            return CircularProgressIndicator();
          default:
            return Column(
              children: userBloc.buildMyPlaces(snapshot.data.docs),
            );
        }
      }
    );
  }

  /*
  * Column(
      children: [
        CardPhoto("images/khaenriah.png", "Khaenriah", "Smoge :d"),
        CardPhoto("images/narukami.png", "Narukami Shrine", "Yae miko e.e"),
        CardPhoto("images/guoba.png", "Guoba", "GuobaChad")
      ],
    );
  *
  * */

}
