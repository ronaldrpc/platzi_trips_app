import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/User/ui/widgets/card_photo.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  Future<void> updateUserDataFirestore(User user) async => _cloudFirestoreAPI.updateUserData(user);
  Future<void> updatePlaceData (Place place) async => _cloudFirestoreAPI.updatePlaceData(place);

  List<CardPhoto> buildMyPlaces(List<DocumentSnapshot> placeListSnapshot) => _cloudFirestoreAPI.buildMyPlaces(placeListSnapshot);
  Future<void> likePlace (Place place, String uid) async => _cloudFirestoreAPI.likePlace(place, uid);

  List<Place> buildPlaces (List<DocumentSnapshot> placesListSnapshot, User user) => _cloudFirestoreAPI.buildPlaces(placesListSnapshot, user);

}