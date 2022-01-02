import 'package:flutter/material.dart';

class GradientBackProfile extends StatelessWidget{

  String title;

  GradientBackProfile(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 400.0,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4268D3),
            Color(0xFF584CD1)
          ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp
        )
      ),

      child: Text(
        title,
        style: TextStyle(
          fontFamily: "Lato",
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 35.0
        ),
      ),

      alignment: Alignment(-0.8, -0.6),

    );
  }
  
}