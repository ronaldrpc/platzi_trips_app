import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'profile_header.dart';
import '../widgets/gradient_back_profile.dart';
import '../widgets/card_photo_list.dart';

class ProfileTrips extends StatelessWidget {

  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    userBloc = BlocProvider.of<UserBloc>(context);
    
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
          default:
            return showProfileData(snapshot);
        }
      },
    );
    // return Stack(
    //   children: [
    //     GradientBack(title: "", height: 400.0),//GradientBackProfile(""),
    //     ListView(
    //       children: [
    //         ProfileHeader(),
    //         CardPhotoList()
    //       ],
    //     )
    //   ],
    // );
  }

  Widget showProfileData (AsyncSnapshot snapshot){
    if (!snapshot.hasData || snapshot.hasError){
      print("No logeado -> profile-trips");
      return Stack(
        children: [
          GradientBack(title: "", height: 400.0),//GradientBackProfile(""),
          ListView(
            children: [
              Text("Usuario no logeado. Haz login"),
            ],
          )
        ],
      );
    } else {
      print("Logeado -> profile-trips");
      var usuario = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoURL
      );

      return Stack(
        children: [
          GradientBack(title: "", height: 400.0),//GradientBackProfile(""),
          ListView(
            children: [
              ProfileHeader(user: usuario),
              CardPhotoList(user: usuario)
            ],
          )
        ],
      );
    }
  }

}