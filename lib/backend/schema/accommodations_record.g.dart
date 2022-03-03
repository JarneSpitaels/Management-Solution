// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accommodations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AccommodationsRecord> _$accommodationsRecordSerializer =
    new _$AccommodationsRecordSerializer();

class _$AccommodationsRecordSerializer
    implements StructuredSerializer<AccommodationsRecord> {
  @override
  final Iterable<Type> types = const [
    AccommodationsRecord,
    _$AccommodationsRecord
  ];
  @override
  final String wireName = 'AccommodationsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AccommodationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.locatie;
    if (value != null) {
      result
        ..add('locatie')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  AccommodationsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccommodationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'locatie':
          result.locatie = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$AccommodationsRecord extends AccommodationsRecord {
  @override
  final String name;
  @override
  final String image;
  @override
  final LatLng locatie;
  @override
  final DocumentReference<Object> reference;

  factory _$AccommodationsRecord(
          [void Function(AccommodationsRecordBuilder) updates]) =>
      (new AccommodationsRecordBuilder()..update(updates)).build();

  _$AccommodationsRecord._(
      {this.name, this.image, this.locatie, this.reference})
      : super._();

  @override
  AccommodationsRecord rebuild(
          void Function(AccommodationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccommodationsRecordBuilder toBuilder() =>
      new AccommodationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccommodationsRecord &&
        name == other.name &&
        image == other.image &&
        locatie == other.locatie &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), image.hashCode), locatie.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AccommodationsRecord')
          ..add('name', name)
          ..add('image', image)
          ..add('locatie', locatie)
          ..add('reference', reference))
        .toString();
  }
}

class AccommodationsRecordBuilder
    implements Builder<AccommodationsRecord, AccommodationsRecordBuilder> {
  _$AccommodationsRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  LatLng _locatie;
  LatLng get locatie => _$this._locatie;
  set locatie(LatLng locatie) => _$this._locatie = locatie;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  AccommodationsRecordBuilder() {
    AccommodationsRecord._initializeBuilder(this);
  }

  AccommodationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _image = $v.image;
      _locatie = $v.locatie;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccommodationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccommodationsRecord;
  }

  @override
  void update(void Function(AccommodationsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AccommodationsRecord build() {
    final _$result = _$v ??
        new _$AccommodationsRecord._(
            name: name, image: image, locatie: locatie, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
