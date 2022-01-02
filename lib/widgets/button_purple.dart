import 'package:flutter/material.dart';

class ButtonPurple extends StatelessWidget {

  final String buttonText;
  final VoidCallback onPressed;

  ButtonPurple({
    required this.buttonText,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final buttonPurple = Center(
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 18,
          fontFamily: "Lato",
          color: Colors.white
        ),
      ),
    );

    return Container(
      margin: EdgeInsets.only(
        top: 30.0,
        left: 20.0,
        right: 20.0,
        bottom: 20.0
      ),

      child: InkWell(
        onTap: onPressed,
        // onTap: (){
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text(buttonText),//Text("Deja de tocarme UwUn't"),
        //       behavior: SnackBarBehavior.floating,
        //       duration: Duration(seconds: 2, milliseconds: 500),
        //     )
        //   );
        // },
        child: Container(
          width: 180.0,
          height: 50.0,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            gradient: LinearGradient(
              colors: [
                Color(0Xff4268D3),
                Color(0Xff584CD1),
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp
            )
          ),

          child: buttonPurple,
        ),
      ),
    );
  }
  
}