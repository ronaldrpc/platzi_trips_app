import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {

  final IconData iconData;
  VoidCallback onPressed;

  FloatingActionButtonGreen({
    required this.iconData,
    required this.onPressed
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _FloatingActionButtonGreen();
  }

}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen>{

  bool pressed = false;

  /*
  void onPressedFav(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: pressed ? Text("Ya no es favorito :c") : Text("Favorito :v"),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2, milliseconds: 500),
      )
    );
    setState(() {
      pressed = !pressed;
    });
  }
  */

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: widget.onPressed,
      child: Icon(widget.iconData),
      heroTag: null,
    );
  }

}