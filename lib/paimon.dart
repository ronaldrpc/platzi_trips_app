import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Place/ui/screens/home_trips.dart';
import 'Place/ui/screens/search_trips.dart';
import 'User/ui/screens/profile_trips.dart';

class Paimon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final paimonBody = Center(
        child: Stack(
          children: <Widget>[
            Center(
              child: Image.asset('images/paimon.png'),
            ),
            Center(
              child: Container(
                color: const Color(0x00000000).withOpacity(0.5),
                height: 75,
              ),
            ),
            const Center(
              child: Text(
                'Que wen paimon :v',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    content: const Text('Yay! A SnackBar!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                    behavior: SnackBarBehavior.floating,
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('Show SnackBar'),
              ),
            )
          ],
        )
    );


    return Scaffold(
      body: paimonBody,
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: Colors.indigo,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: ""
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: ""
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: ""
            )
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch(index){
            case 0:
              return CupertinoTabView(
                builder: (BuildContext) => HomeTrips(),
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext) => SearchTrips(),
              );
            case 2:
              return CupertinoTabView(
                builder: (BuildContext) => Paimon(),
              );
            default:
              return CupertinoTabView(
                builder: (BuildContext) => HomeTrips(),
              );
          }
        },
      )
    );
  }

}