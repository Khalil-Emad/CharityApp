// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Product extends _Product with RealmEntity, RealmObject {
  Product(String s, {
    String? name,
    String? details,
    String? quantity,
    bool? active,
    String? date,
    String? image,
  }) {
    RealmObject.set(this, 'name', name);
    RealmObject.set(this, 'details', details);
    RealmObject.set(this, 'quantity', quantity);
    RealmObject.set(this, 'active', active);
    RealmObject.set(this, 'date', date);
    RealmObject.set(this, 'image', image);
  }

  Product._();

  @override
  String? get name => RealmObject.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObject.set(this, 'name', value);

  @override
  String? get details => RealmObject.get<String>(this, 'details') as String?;
  @override
  set details(String? value) => RealmObject.set(this, 'details', value);

  @override
  String? get quantity => RealmObject.get<String>(this, 'quantity') as String?;
  @override
  set quantity(String? value) => RealmObject.set(this, 'quantity', value);

  @override
  bool? get active => RealmObject.get<bool>(this, 'active') as bool?;
  @override
  set active(bool? value) => RealmObject.set(this, 'active', value);

  @override
  String? get date => RealmObject.get<String>(this, 'date') as String?;
  @override
  set date(String? value) => RealmObject.set(this, 'date', value);

  @override
  String? get image => RealmObject.get<String>(this, 'image') as String?;
  @override
  set image(String? value) => RealmObject.set(this, 'image', value);

  @override
  Stream<RealmObjectChanges<Product>> get changes =>
      RealmObject.getChanges<Product>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Product._);
    return const SchemaObject(Product, 'Product', [
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('details', RealmPropertyType.string, optional: true),
      SchemaProperty('quantity', RealmPropertyType.string, optional: true),
      SchemaProperty('active', RealmPropertyType.bool, optional: true),
      SchemaProperty('date', RealmPropertyType.string, optional: true),
      SchemaProperty('image', RealmPropertyType.string, optional: true),
    ]);
  }
}
