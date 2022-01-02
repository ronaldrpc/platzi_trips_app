import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import '../../../widgets/button_purple.dart';

class DescriptionPlace extends StatelessWidget{

  late String namePlace;
  late String descriptionPlace;
  late int numberStars;

  DescriptionPlace(this.namePlace, this.numberStars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    final fullStar = Container(
      margin: const EdgeInsets.only(
        top: 323.0,
        right: 3.0
      ),
      child: const Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );

    final halfStar = Container(
      margin: const EdgeInsets.only(
          top: 323.0,
          right: 3.0
      ),
      child: const Icon(
        Icons.star_half,
        color: Colors.amber,
      ),
    );

    final borderStar = Container(
      margin: const EdgeInsets.only(
          top: 323.0,
          right: 3.0
      ),
      child: const Icon(
        Icons.star_border,
        color: Colors.amber,
      ),
    );

    Widget description (String descriptionPlace) {
      return Container(
        margin: const EdgeInsets.only(
            top: 20.0,
            left: 20.0,
            right: 20.0
        ),
        child: Text(
          descriptionPlace,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              // color: Colors.grey,
              fontFamily: "Lato"
          ),
        ),
      );
    }

    Widget titleStars (Place place) {
      return Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
                top: 320.0,
                left: 20.0,
                right: 20.0
            ),
            child: Text(
              place.name,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                  fontFamily: "Lato"
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 320.0, left: 20.0, right: 20.0),
            child: Text(
              "Hearts: ${place.likes}",
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                color: Colors.amber
              ),
            ),
          ),
          // Row(
          //   children: [
          //     fullStar,
          //     fullStar,
          //     fullStar,
          //     halfStar,
          //     borderStar
          //   ],
          // )
        ],
      );
    }

    return StreamBuilder(
      stream: userBloc.placeSelectedStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          Place place = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleStars(place),
              description(place.description),
              ButtonPurple(buttonText: "Navigate", onPressed: (){},)
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container (
                margin: EdgeInsets.only(
                    top: 400.0,
                    left: 20.0,
                    right: 20.0
                ),
                child: Text(
                  "Selecciona un lugar",
                  style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900
                  ),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          );
        }
      }
    );

  }

}