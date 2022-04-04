import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cart_record.g.dart';

abstract class CartRecord implements Built<CartRecord, CartRecordBuilder> {
  static Serializer<CartRecord> get serializer => _$cartRecordSerializer;

  @nullable
  String get name;

  @nullable
  double get price;

  @nullable
  int get quantity;

  @nullable
  String get imageurl;

  @nullable
  DocumentReference get user;

  @nullable
  BuiltList<DocumentReference> get cart;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CartRecordBuilder builder) => builder
    ..name = ''
    ..price = 0.0
    ..quantity = 0
    ..imageurl = ''
    ..cart = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cart');

  static Stream<CartRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CartRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CartRecord._();
  factory CartRecord([void Function(CartRecordBuilder) updates]) = _$CartRecord;

  static CartRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCartRecordData({
  String name,
  double price,
  int quantity,
  String imageurl,
  DocumentReference user,
}) =>
    serializers.toFirestore(
        CartRecord.serializer,
        CartRecord((c) => c
          ..name = name
          ..price = price
          ..quantity = quantity
          ..imageurl = imageurl
          ..user = user
          ..cart = null));
