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
  String get email;

  @nullable
  String get location;

  @nullable
  String get backgroundImage;

  @nullable
  String get profileImage;

  @nullable
  String get phonenumber;

  @nullable
  BuiltList<String> get category;

  @nullable
  String get description;

  @nullable
  String get openingHours;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AccommodationsRecordBuilder builder) => builder
    ..name = ''
    ..email = ''
    ..location = ''
    ..backgroundImage = ''
    ..profileImage = ''
    ..phonenumber = ''
    ..category = ListBuilder()
    ..description = ''
    ..openingHours = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('accommodations');

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
  String email,
  String location,
  String backgroundImage,
  String profileImage,
  String phonenumber,
  String description,
  String openingHours,
}) =>
    serializers.toFirestore(
        AccommodationsRecord.serializer,
        AccommodationsRecord((a) => a
          ..name = name
          ..email = email
          ..location = location
          ..backgroundImage = backgroundImage
          ..profileImage = profileImage
          ..phonenumber = phonenumber
          ..category = null
          ..description = description
          ..openingHours = openingHours));
