import 'package:realm/realm.dart';
part 'product.g.dart';

@RealmModel()
class _Product {
  String? name;
  String? details;
  String? quantity;
  bool? active;
  String? date;
  // List? availability;
  String? image;



}
