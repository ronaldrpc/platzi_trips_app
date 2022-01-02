import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'card_image.dart';

class CardImageList extends StatefulWidget {

  User user;

  CardImageList({required this.user});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardImageList();
  }

}

class _CardImageList extends State<CardImageList> {

  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      height: 350.0, //350
      child: StreamBuilder(
        stream: userBloc.placesStream,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.active:
              return showListViewPlaces(userBloc.buildPlaces(snapshot.data.docs, widget.user));
            case ConnectionState.done:
              return showListViewPlaces(userBloc.buildPlaces(snapshot.data.docs, widget.user));
            default:
              return showListViewPlaces(userBloc.buildPlaces(snapshot.data.docs, widget.user));
          }
        },
      ),
    );
  }

  Widget showListViewPlaces(List<Place> places){
    double height = 250.0;
    double width = 250.0;

    return ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(25.0),
      children: places.map((place) {
        return GestureDetector(
          onTap: (){
            print("Place: ${place.name}");
            userBloc.placeSelectedSink.add(place);
          },
          child: CardImage(
            pathImage: place.urlImage,
            width: width,
            height: height,
            iconData: place.liked ? Icons.favorite : Icons.favorite_border,
            onPressedFabIcon: (){
              setLiked(place);
            },
          ),
        );
      }).toList(),

    );
  }

  void setLiked(Place place) {
    setState(() {
      place.liked = !place.liked;
      userBloc.likePlace(place, widget.user.uid);
      place.likes = place.liked ? place.likes+1 : place.likes-1;
      userBloc.placeSelectedSink.add(place);
    });
  }

}


  // CardImage(pathImage:"images/albedo.png", iconData: Icons.favorite_border, height: height, width: width, onPressedFabIcon: () => {},),
  // CardImage(pathImage:"images/guoba.png", iconData: Icons.favorite_border, height: height, width: width, onPressedFabIcon: () => {}),
  // CardImage(pathImage:"images/khaenriah.png", iconData: Icons.favorite_border, height: height, width: width, onPressedFabIcon: () => {}),
  // CardImage(pathImage:"images/narukami.png", iconData: Icons.favorite_border, height: height, width: width, onPressedFabIcon: () => {}),
  // CardImage(pathImage:"images/xiao.png", iconData: Icons.favorite_border, height: height, width: width, onPressedFabIcon: () => {})


