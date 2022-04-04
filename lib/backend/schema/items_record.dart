import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'items_record.g.dart';

abstract class ItemsRecord implements Built<ItemsRecord, ItemsRecordBuilder> {
  static Serializer<ItemsRecord> get serializer => _$itemsRecordSerializer;

  @nullable
  String get name;

  @nullable
  double get value;

  @nullable
  String get imageurl;

  @nullable
  String get description;

  @nullable
  String get type;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ItemsRecordBuilder builder) => builder
    ..name = ''
    ..value = 0.0
    ..imageurl = ''
    ..description = ''
    ..type = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('items');

  static Stream<ItemsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ItemsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ItemsRecord._();
  factory ItemsRecord([void Function(ItemsRecordBuilder) updates]) =
      _$ItemsRecord;

  static ItemsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createItemsRecordData({
  String name,
  double value,
  String imageurl,
  String description,
  String type,
}) =>
    serializers.toFirestore(
        ItemsRecord.serializer,
        ItemsRecord((i) => i
          ..name = name
          ..value = value
          ..imageurl = imageurl
          ..description = description
          ..type = type));
