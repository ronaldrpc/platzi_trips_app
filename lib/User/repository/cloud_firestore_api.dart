import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/User/model/user.dart' ;
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:platzi_trips_app/User/ui/widgets/card_photo.dart'; // fa = firebase_auth


class CloudFirestoreAPI {

  final String USERS = 'users';
  final String PLACES = "places";

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final fa.FirebaseAuth _auth = fa.FirebaseAuth.instance; // esto deberia ir aqui segun el patron bloc? susge

  Future<void> updateUserData(User user) async {
    DocumentReference ref  = _firestore.collection(USERS).doc(user.uid);
    return await ref.set({
      "uid": user.uid,
      "name": user.name,
      "email": user.email,
      "photoURL": user.photoURL,
      "myPlaces": user.myPlaces,
      "myFavoritePlaces": user.myFavoritePlaces,
      "lastSignIn": DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData (Place place) async {
    CollectionReference refPlaces = _firestore.collection(PLACES);

    fa.User currentUser = _auth.currentUser!;

    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'urlImage': place.urlImage,
      'userOwner': _firestore.doc("${USERS}/${currentUser.uid}"),
      'usersLiked': FieldValue.arrayUnion([])
    }).then((dr) {
      dr.get().then((snapshot) {
        //snapshot.id; // id place
        DocumentReference refUsers = _firestore.collection(USERS).doc(currentUser.uid);
        refUsers.update({
          'myPlaces': FieldValue.arrayUnion([_firestore.doc("${PLACES}/${snapshot.id}")])
        });
      });
    });
  }

  List<CardPhoto> buildMyPlaces (List<DocumentSnapshot> placesListSnapshot){
    List<CardPhoto> profilePlaces = [];
    placesListSnapshot.forEach((p) {
      profilePlaces.add(CardPhoto(
        Place(
          name: p['name'],
          description: p['description'],
          urlImage: p['urlImage'],
          likes: p['likes']
        )
      ));
    });

    return profilePlaces;
  }

  List<Place> buildPlaces (List<DocumentSnapshot> placesListSnapshot, User user) {
    List<Place> places = [];
    placesListSnapshot.forEach((p) {
      Place place = Place(id: p.id, name: p['name'], description: p['description'], urlImage: p['urlImage'], likes: p['likes']);

      List<dynamic>? usersLikedRefs = p['usersLiked'];
      place.liked = false;
      usersLikedRefs?.forEach((drUL) {
        if (user.uid == drUL.id){
          place.liked = true;
        }
      });

      places.add(place);
    });

    return places;
  }

  Future<void> likePlace (Place place, String uid) async {
    await _firestore.collection(PLACES).doc(place.id).get()
        .then((DocumentSnapshot snapshot) {
          int likes = snapshot["likes"];
          _firestore.collection(PLACES).doc(place.id)
              .update({
                'likes': place.liked ? likes+1 : likes-1,
                'usersLiked': place.liked? FieldValue.arrayUnion([_firestore.doc("${USERS}/${uid}")]) :
                                           FieldValue.arrayRemove([_firestore.doc("${USERS}/${uid}")])
              });
        });
  }

  // likePlace antes del cambio
  Future<void> likePlacev2(String idPlace) async {
    _firestore.runTransaction((transaction) async {
      DocumentSnapshot placeDS = await _firestore.collection(PLACES).doc(idPlace).get();

      await transaction.update(placeDS.reference, {
        'likes': placeDS['likes'] + 1
      });

    });
  }


}


// List<CardImage> buildPlaces (List<DocumentSnapshot> placesListSnapshot) {
//   double height = 250.0;
//   double width = 250.0;
//   IconData iconData = Icons.favorite_border;
//
//   List<CardImage> placeCards = [];
//   placesListSnapshot.forEach((p) {
//     placeCards.add(CardImage(
//         pathImage: p['urlImage'],
//         iconData: iconData,
//         height: height,
//         width: width,
//         onPressedFabIcon: (){
//           likePlacev2(p.id);
//         }
//     ));
//   });
//
//   return placeCards;
// }