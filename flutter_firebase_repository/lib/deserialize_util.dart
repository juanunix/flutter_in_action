import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_repository/catalog_service.dart';

// Add the Firestore ID as the Product's ID so that we can reference later.
dynamic deserializeWithFirestoreId(
    DocumentSnapshot doc, Serializer serializer) {
  var dataWithID;
  if (doc["id"] == null || doc["id"] == "") {
    // add quantity if it's null
    var qty =
        (doc.data["quantityInCart"] != null || doc.data["quantityInCart"] != "")
            ? doc.data["quantityInCart"]
            : "0";

    dataWithID = new Map.from(doc.data)
      ..addEntries([
        new MapEntry("id", doc.documentID),
        new MapEntry("quantity", qty),
      ]);
  }
  return standardSerializers.deserializeWith(serializer, dataWithID);
}
