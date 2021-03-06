import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {

  final String hintText;
  TextInputType? inputType;
  final TextEditingController controller;
  int maxLines;

  TextInput({
    required this.hintText,
    this.inputType,
    required this.controller,
    this.maxLines = 1
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(
        right: 20.0,
        left: 20.0
      ),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: 15.0,
          fontFamily: "Lato",
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold
        ),

        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFE5E5E5),
          border: InputBorder.none,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide : BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(Radius.circular(9.0))
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFe5e5e5)),
              borderRadius: BorderRadius.all(Radius.circular(9.0))
          )
        ),
      ),
    );
  }

}