import 'dart:io';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app/Place/ui/screens/add_place_screen.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/circle_button.dart';

class ButtonsBar extends StatelessWidget {
  
  late UserBloc userBloc;
  final ImagePicker _picker = ImagePicker();
  late String error = "error";
  BuildContext? pC;

  void _takeImage(BuildContext context) async {
    final navigator = Navigator.of(context);
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      print(pickedFile.path);
      await navigator.push(//Navigator.push(context
          MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: File(pickedFile.path)))
      );
    }
    /*
    * What the heck happened? How it works?
    * - The main answer is in the variable "final navigator". Why? Because it stores a reference of the navigator, so you don't need to use "context" afterward.
    *   look at the following link, there are another things that also help to solve that f***** problem >:v Madge!
    * (https://stackoverflow.com/questions/58456293/flutter-how-do-i-navigate-to-a-new-page-after-an-image-is-picked-with-the-image) <- saved my life
    * - I'm not sure if the await statement before navigator.push helps, but hey, if something works, DO NOT TOUCH IT xd.
    * */
  }

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            //CircleButton(true, Icons.turned_in_not, 20.0, Color.fromRGBO(255, 255, 255, 1)),
            CircleButton(false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1), () { _takeImage(context); }),
            CircleButton(true, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 0.6), () => { userBloc.signOut() })
          ],
        )
    );
  }

/*
  Future<void> test(contexto) async{
    // final previousContext = context;
    // print(previousContext);
    // setState(previousContext);
    //
    // XFile? xFile = await _picker.pickImage(source: ImageSource.camera);
    //
    // //print("Dobby es libre :v //");
    //
    // if(xFile != null){
    //   print(pC);
    //   // Navigator.push(context,
    //   //   MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: File(xFile.path)))
    //   // );
    // } else {
    //   print("Error al cargar la imagen -> button-bar");
    // }

    await _picker.pickImage(source: ImageSource.camera)
        .then((image) {
      //print(contexto);
      // if(image != null){
      //   Navigator.of(context).push(
      //       MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: File(image.path)))
      //   );
      // }
    }).catchError((onError) {print("Error"); print(onError);});
  }
*/
}