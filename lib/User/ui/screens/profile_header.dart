import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import '../widgets/profile_view.dart';
import '../widgets/icon_button_bar.dart';
import '../widgets/button_bar.dart';

class ProfileHeader extends StatelessWidget {
  late UserBloc userBloc;
  final User user;

  ProfileHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of<UserBloc>(context);

    return Column(
      children: [
        ProfileView(user),
        ButtonsBar(), //IconButtonBar(),
      ],
    );

    // return StreamBuilder(
    //   stream: userBloc.streamFirebase,
    //   builder: (BuildContext context, AsyncSnapshot snapshot){
    //     switch (snapshot.connectionState){
    //       case ConnectionState.waiting:
    //         return CircularProgressIndicator();
    //       case ConnectionState.none:
    //         return CircularProgressIndicator();
    //       case ConnectionState.active:
    //         return showProfileData(snapshot);
    //       case ConnectionState.done:
    //         return showProfileData(snapshot);
    //       default:
    //         return CircularProgressIndicator();
    //     }
    //   }
    // );

  }

  Widget showProfileData (AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      print("No logged->profile_header");
      return Container(
        margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0,
        ),
        child: Column(
          children: [
            CircularProgressIndicator(),
            Text("No se pudo cargar la información. Por favor, haz login")
          ],
        ),
      );
    } else {
      print("Logged->profile_header");
      //print(snapshot.data);

      // user = User(
      //     uid: snapshot.data.uid,
      //     name: snapshot.data.displayName,
      //     email: snapshot.data.email,
      //     photoURL: snapshot.data.photoURL
      // );

      return Column(
        children: [
          ProfileView(user),
          ButtonsBar(), //IconButtonBar(),
        ],
      );
    }
  }

}