import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'meeting_rooms_record.g.dart';

abstract class MeetingRoomsRecord
    implements Built<MeetingRoomsRecord, MeetingRoomsRecordBuilder> {
  static Serializer<MeetingRoomsRecord> get serializer =>
      _$meetingRoomsRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get image;

  @nullable
  BuiltList<String> get category;

  @nullable
  int get seats;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MeetingRoomsRecordBuilder builder) => builder
    ..name = ''
    ..image = ''
    ..category = ListBuilder()
    ..seats = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meeting_rooms');

  static Stream<MeetingRoomsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MeetingRoomsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  MeetingRoomsRecord._();
  factory MeetingRoomsRecord(
          [void Function(MeetingRoomsRecordBuilder) updates]) =
      _$MeetingRoomsRecord;

  static MeetingRoomsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMeetingRoomsRecordData({
  String name,
  String image,
  int seats,
}) =>
    serializers.toFirestore(
        MeetingRoomsRecord.serializer,
        MeetingRoomsRecord((m) => m
          ..name = name
          ..image = image
          ..category = null
          ..seats = seats));
