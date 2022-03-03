import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'accommodations_record.g.dart';

abstract class AccommodationsRecord
    implements Built<AccommodationsRecord, AccommodationsRecordBuilder> {
  static Serializer<AccommodationsRecord> get serializer =>
      _$accommodationsRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get image;

  @nullable
  LatLng get locatie;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AccommodationsRecordBuilder builder) => builder
    ..name = ''
    ..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Accommodations');

  static Stream<AccommodationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AccommodationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  AccommodationsRecord._();
  factory AccommodationsRecord(
          [void Function(AccommodationsRecordBuilder) updates]) =
      _$AccommodationsRecord;

  static AccommodationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAccommodationsRecordData({
  String name,
  String image,
  LatLng locatie,
}) =>
    serializers.toFirestore(
        AccommodationsRecord.serializer,
        AccommodationsRecord((a) => a
          ..name = name
          ..image = image
          ..locatie = locatie));
