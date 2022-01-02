import 'package:flutter/material.dart';
import '../widgets/review_list.dart';
import '../widgets/description_place.dart';
import 'header_appbar.dart';

class HomeTrips extends StatelessWidget {

  String descriptionExample = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Stack(
      children: [
        ListView(
          children: [
            DescriptionPlace("Pepegalandia", 4, descriptionExample),
            ReviewList()
          ],
        ),
        HeaderAppBar()
      ],
    );
  }
  
}