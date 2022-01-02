import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/repository/firebase_storage_repository.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/User/model/user.dart' as userModel;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart'; // Madge >:'v
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_trips_app/User/ui/widgets/card_photo.dart';


class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  final _firebaseStorageRepository = FirebaseStorageRepository();

  // Flujo de datos -> Streams (en ese caso, proviene de Firebase)
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;
  Future<User?> get currentUser async => FirebaseAuth.instance.currentUser;

  // Casos de uso
  // 1. SignIn/SignOut a la aplicación Google
  Future<UserCredential?> signIn() {
    return _auth_repository.signInFirebase();
  }

  void signOut() {
    _auth_repository.signOut();
  }

  // 2. Registrar usuario y place en Firestore db
  Future<void> updateUserData(userModel.User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updatePlaceData (Place place) => _cloudFirestoreRepository.updatePlaceData(place);

  // Ojo, esto es una mala practica, desde el bloc no se deberia acceder al FirebaseFirestore, sino al repository
  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance.collection(CloudFirestoreAPI().PLACES).snapshots();
  Stream<QuerySnapshot> get placesStream => placesListStream;

  Stream<QuerySnapshot> myPlacesListStream(String uid) =>
      FirebaseFirestore.instance.collection(CloudFirestoreAPI().PLACES)
          .where("userOwner", isEqualTo: FirebaseFirestore.instance.doc("${CloudFirestoreAPI().USERS}/${uid}"))
          .snapshots();

  List<CardPhoto> buildMyPlaces(List<DocumentSnapshot> placeListSnapshot) => _cloudFirestoreRepository.buildMyPlaces(placeListSnapshot);

  // 3 Firebase Storage
  Future<UploadTask> uploadFile (String path, File image) => _firebaseStorageRepository.uploadFile(path, image);

  Future<void> likePlace (Place place, String uid) => _cloudFirestoreRepository.likePlace(place, uid);

  List<Place> buildPlaces (List<DocumentSnapshot> placesListSnapshot, userModel.User user) => _cloudFirestoreRepository.buildPlaces(placesListSnapshot, user);

  // Stream Personalizado
  StreamController placeSelectedStreamController = StreamController();
  Stream get placeSelectedStream => placeSelectedStreamController.stream;
  StreamSink get placeSelectedSink => placeSelectedStreamController.sink;


  @override
  void dispose() {
    // TODO: implement dispose
    placeSelectedStreamController.close();
  }

}