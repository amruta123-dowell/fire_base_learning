import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learning/models/user_model.dart';

import '../custom_widgets/coffee_class.dart';

class DataBaseService {
  final String? uid;
  DataBaseService({this.uid});

  final CollectionReference coffeeCollection =
      // The entry point for accessing a [FirebaseFirestore].
      FirebaseFirestore.instance.collection("coffee");

  ///update user data using UID .If that UID is not present, firebase creates new data with UID.
  Future updateUserData(
      {required String sugarCubes,
      required String name,
      required int strength}) async {
    return await coffeeCollection
        .doc(uid)
        .set({"sugars": sugarCubes, "name": name, "strength": strength});
  }

  ///To get the firestore data into our app
  ///SnapShot -> The current documents and their properties and values inside the collection and values at that moment in the time
  ///QuerySnapShot -> This is the snapshot of the firestore collection at that moment in the time when something changes

  ///get coffee stream
  // Stream<QuerySnapshot> get coffee {
  //   coffeeCollection.snapshots().map((event) => _getListOfCoffeeFromSnapShot);

  //   return coffeeCollection.snapshots();
  // }

  ///Coffee list from snapshot
  List<CoffeeClass?> _getListOfCoffeeFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      return CoffeeClass(
          name: data?["name"] ?? '',
          strength: data?["strength"] ?? 0,
          sugars: data?["sugars"] ?? '');
    }).toList();
  }

  ///To get the coffeeList
  Stream<List<CoffeeClass?>> get getCoffeeList {
    return coffeeCollection.snapshots().map(_getListOfCoffeeFromSnapShot);
  }

  /// Get user document
  Stream<UserDataModel> get getUserData {
    return coffeeCollection.doc(uid).snapshots().map(_getUserDataFromSnapshot);
  }

  ///UserDataModel from snapshot
  UserDataModel _getUserDataFromSnapshot(DocumentSnapshot userSnapShot) {
    Map<String, dynamic>? userData =
        userSnapShot.data() as Map<String, dynamic>?;
    return UserDataModel(
        uid: uid ?? '',
        name: userData?["name"] ?? '',
        sugars: userData?["sugars"] ?? '',
        sugarStrength: userData?["strength"] ?? 0);
  }
}
