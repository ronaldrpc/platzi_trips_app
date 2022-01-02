import 'package:flutter/material.dart';
import 'review.dart';

class ReviewList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Review("images/pogPaimon.png", "PogPaimon", "1 review 1 photo", "Nice!"),
        Review("images/paimon.png", "PepegaPaimon", "0 reviews 0 photos", "PepegaClap"),
        Review("images/paimon.png", "PepegaPaimon2", "1 reviews 1 photos", "PepegaPaint")
      ],
    );
  }

}