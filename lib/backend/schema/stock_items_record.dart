import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'stock_items_record.g.dart';

abstract class StockItemsRecord
    implements Built<StockItemsRecord, StockItemsRecordBuilder> {
  static Serializer<StockItemsRecord> get serializer =>
      _$stockItemsRecordSerializer;

  @nullable
  String get name;

  @nullable
  double get maximumStockLevel;

  @nullable
  double get currentStockLevel;

  @nullable
  String get image;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StockItemsRecordBuilder builder) => builder
    ..name = ''
    ..maximumStockLevel = 0.0
    ..currentStockLevel = 0.0
    ..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stock_items');

  static Stream<StockItemsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<StockItemsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  StockItemsRecord._();
  factory StockItemsRecord([void Function(StockItemsRecordBuilder) updates]) =
      _$StockItemsRecord;

  static StockItemsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createStockItemsRecordData({
  String name,
  double maximumStockLevel,
  double currentStockLevel,
  String image,
}) =>
    serializers.toFirestore(
        StockItemsRecord.serializer,
        StockItemsRecord((s) => s
          ..name = name
          ..maximumStockLevel = maximumStockLevel
          ..currentStockLevel = currentStockLevel
          ..image = image));
