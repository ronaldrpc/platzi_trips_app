import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/text_input.dart';
import 'package:platzi_trips_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {

  late File image;

  AddPlaceScreen({Key? key, required this.image});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPlaceScreen();
  }

}

class _AddPlaceScreen extends State<AddPlaceScreen> {

  late double screenWidth;

  // mala practica xd?
  final _controllerTitlePlace = TextEditingController();
  final _controllerDescriptionPlace = TextEditingController();
  final _controllerTitleLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          GradientBack(title: "", height: 300.0),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 25.0,
                  left: 5.0
                ),
                child: SizedBox(
                  height: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 45),
                    onPressed: () => {
                      Navigator.of(context).pop()
                    },
                  ),
                ),
              ),

              Flexible(
                child: Container(
                  width: screenWidth,
                  padding: EdgeInsets.only(
                    top: 45.0,
                    left: 20.0,
                    right: 20.0
                  ),
                  child: TitleHeader(title: "Add a new place"),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 120.0,
              bottom: 20.0
            ),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CardImage(
                    pathImage: widget.image.path, //.contains('assets') ? AssetImage(widget.image.path) : File(widget.image.path), //"images/narukami.png",
                    iconData: Icons.camera_alt,
                    onPressedFabIcon: () {},
                    width: 350.0,
                    height: 250.0,
                  ),
                ),
                Container( // Primer text field (titulo)
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextInput(
                    hintText: "Title",
                    inputType: null,
                    maxLines: 1,
                    controller: _controllerTitlePlace,
                  ),
                ),
                TextInput(
                    hintText: "Description",
                    inputType: TextInputType.multiline,
                    maxLines: 4,
                    controller: _controllerDescriptionPlace
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hintText: "Add location",
                    iconData: Icons.location_on,
                    controller: _controllerTitleLocation,
                  ),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Add Place",
                    onPressed: (){
                      // 1. Subir img a Firebase Storage para obtener url de la img
                      userBloc.currentUser.then((User? user) {
                        if (user != null){
                          String uid = user.uid;
                          String path = "${uid}/${DateTime.now().toString()}.jpg";
                          userBloc.uploadFile(path, widget.image).then((UploadTask uploadTask) {
                            uploadTask.whenComplete(() {}).then((snapshot) {
                              snapshot.ref.getDownloadURL().then((urlImage) {
                                print("Image: $urlImage");

                                // 2. Usar Cloud Firestore para subir el objeto Place (title, description, url, userOwner, likes)
                                userBloc.updatePlaceData(Place(
                                  name: _controllerTitlePlace.text,
                                  description: _controllerDescriptionPlace.text,
                                  urlImage: urlImage,
                                  likes: 0,
                                )).whenComplete((){
                                  print("Terminó -> add_place_screen");
                                  Navigator.of(context).pop();
                                });

                              });
                            });
                          });
                        }
                      });

                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}