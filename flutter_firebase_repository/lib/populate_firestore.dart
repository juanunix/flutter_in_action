import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_repository/catalog_service.dart';
import 'package:shared_lib/shared_lib.dart';

Serializers standardSerializers = serializers;

/// If this isn't the first time running the app,
/// This won't do anything because the documents list isn't empty
Future<void> populateFirestore(Firestore firestore) async {
  QuerySnapshot snapshot = await firestore.collection("catalog").getDocuments();
  if (snapshot.documents.isEmpty) {
    var firestoreService = FlutterCatalogService(firestore);
    Catalog catalog = populateCatalog();
    try {
      catalog.availableProducts.forEach((e) {
        firestoreService.addNewProduct(e);
      });
    } catch (e) {
      throw (e);
    }
    return null;
  }
}
