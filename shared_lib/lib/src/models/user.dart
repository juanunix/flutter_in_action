import 'package:shared_lib/src/e_commerce_models.dart';

class ECommerceUser {
  final String name;
  final String contact;
  List<Product> userProducts = [];

  ECommerceUser({this.name, this.contact, this.userProducts});
}
