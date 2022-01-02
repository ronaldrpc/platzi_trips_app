import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {

  double height;
  double width;
  final String text;
  final VoidCallback onPressed;

  ButtonGreen({Key? key, required this.text, required this.onPressed, this.width = 0.0, this.height = 0.0}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonGreen();
  }

}

class _ButtonGreen extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0
        ),

        height: widget.height,
        width: widget.width,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gradient: LinearGradient(
            colors: [
              Color(0xFFA7FF84),
              Color(0xFF1CBB78),
            ],
            begin: FractionalOffset(0.2, 0.0),
            end: FractionalOffset(1.0, 0.6),
            stops: [0.0, 0.6],
            tileMode: TileMode.clamp
          )
        ),

        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Lato",
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }

}