import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'Place/ui/screens/home_trips.dart';
import 'Place/ui/screens/search_trips.dart';
import 'User/ui/screens/profile_trips.dart';

class PlatziTripsCupertino extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: Colors.indigo,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              //label: ""
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              //label: ""
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              //label: ""
            )
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch(index){
            case 0:
              return CupertinoTabView(
                builder: (BuildContext) {
                  return BlocProvider<UserBloc>(
                    child: HomeTrips(),
                    bloc: UserBloc()
                  );
                },
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext) => SearchTrips(),
              );
            case 2:
              return CupertinoTabView(
                builder: (BuildContext) {
                  return BlocProvider<UserBloc>(
                      child: ProfileTrips(),
                      bloc: UserBloc()
                  );
                }
              );
            default:
              return CupertinoTabView(
                builder: (BuildContext) {
                  return BlocProvider<UserBloc>(
                      child: HomeTrips(),
                      bloc: UserBloc()
                  );
                },
              );
          }
        },
      ),
    );
  }

}