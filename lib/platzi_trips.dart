import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'Place/ui/screens/home_trips.dart';
import 'Place/ui/screens/search_trips.dart';
import 'User/ui/screens/profile_trips.dart';

class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlatziTrips();
  }
}

class _PlatziTrips extends State<PlatziTrips> {

  int indexTap = 0;
  late UserBloc userB;

  final List<Widget> widgetsChildren = [
    BlocProvider<UserBloc>(
      child: HomeTrips(),
      bloc: UserBloc(),
    ),
    SearchTrips(),
    BlocProvider<UserBloc>(
      child: ProfileTrips(),
      bloc: UserBloc(),
    )
  ];

  void onTapTapped(int index){
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      /*appBar: AppBar(
          title: const Text(
            "Traveler",
            textAlign: TextAlign.center,
          ),
          backgroundColor: const Color(0xFFd72181),
        ),*/
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme( // esto no es necesario, pero weno
          data: Theme.of(context).copyWith(
            //canvasColor: Colors.white, //Colors.white,
            //primaryColor: Colors.purple //No se para que es esto...enserio :'v
          ),
          child: BottomNavigationBar(
            onTap: onTapTapped,
            currentIndex: indexTap,
            selectedItemColor: Colors.indigo,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed, // en modo shifting, le cambia el color a los iconos asi que cuidado

            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "",
                backgroundColor: Colors.white // solo funciona en modo shifting (BottomNavigationBarType.shifting)
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "",
                backgroundColor: Colors.purple // solo funciona en modo shifting (BottomNavigationBarType.shifting)
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "",
                backgroundColor: Colors.pink, // solo funciona en modo shifting (BottomNavigationBarType.shifting)
              )
            ],
          )
      ),
    );
  }

}