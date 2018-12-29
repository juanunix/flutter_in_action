import 'package:shared_lib/e_commerce_app.dart';

class CatalogBloc {
  final CatalogService _service;

  CatalogBloc(this._service);

  // all these calls will call out to firebase, or a flat file.
  // Inject the 'repository' via a 'service' object.

  // get all products
  // get one product
  // update product
  // add new product to catalog


}