import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_lib/e_commerce_app.dart';
import 'package:shared_lib/shared_lib.dart';

Serializers standardSerializers = serializers;

class FlutterCartService {
  static const String firestorePath = 'cart';

  final Firestore firestore;

  const FlutterCartService(this.firestore);

  CollectionReference _cartRef() {
    return this.firestore.collection(firestorePath);
  }

  DocumentReference _cartCountRef() {
    return this.firestore.document("$firestorePath/count");
  }

  Future<int> _currentCartCount() {
    return _cartCountRef()
        .get()
        .then((DocumentSnapshot s) => s.data["totalCount"]);
  }

  Future<int> _currentCountForProduct(Product p) {
    return _cartCountRef().get().then((DocumentSnapshot s) {
      if (s.data.containsKey(p.title)) {
        return s.data[p.title];
      }
      return 0;
    });
  }

  Stream<int> streamCartCount() {
    return _cartCountRef().snapshots().map((DocumentSnapshot s) {
      print('new snap');
      return s.data["totalCount"];
    });
  }

  Future<void> updateCart(Product p) async {
    var newTotalCount = await _currentCartCount() + p.quantityInCart;
    var newProductTotal = await _currentCountForProduct(p) + p.quantityInCart;
    return _cartCountRef()
        .updateData({"totalCount": newTotalCount, p.title: newProductTotal});
  }
}
