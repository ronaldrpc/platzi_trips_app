import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import '../../../widgets/gradient_back.dart';
import '../widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget{

  //late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showPlaceData(snapshot);
          case ConnectionState.done:
            return showPlaceData(snapshot);
          default:
            return showPlaceData(snapshot);
        }
      },
    );

  }

  Widget showPlaceData (AsyncSnapshot snapshot){
    if (!snapshot.hasData || snapshot.hasError){
      print("No logeado -> header-appbar");
      return Stack(
        children: [
          GradientBack(title: "", height: 250.0),//GradientBack del Home
          Text("Usuario no logeado. Haz login"),
        ],
      );
    } else {
      print("Logeado -> header-appbar");
      User user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL
      );

      return Stack(
        children: [
          GradientBack(title: "Welcome Traveler!", height: 250.0),
          CardImageList(user: user)
        ],
      );
    }
  }

}