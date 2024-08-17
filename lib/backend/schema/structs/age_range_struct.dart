// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgeRangeStruct extends FFFirebaseStruct {
  AgeRangeStruct({
    int? minAge,
    int? maxAge,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _minAge = minAge,
        _maxAge = maxAge,
        super(firestoreUtilData);

  // "minAge" field.
  int? _minAge;
  int get minAge => _minAge ?? 0;
  set minAge(int? val) => _minAge = val;

  void incrementMinAge(int amount) => minAge = minAge + amount;

  bool hasMinAge() => _minAge != null;

  // "maxAge" field.
  int? _maxAge;
  int get maxAge => _maxAge ?? 0;
  set maxAge(int? val) => _maxAge = val;

  void incrementMaxAge(int amount) => maxAge = maxAge + amount;

  bool hasMaxAge() => _maxAge != null;

  static AgeRangeStruct fromMap(Map<String, dynamic> data) => AgeRangeStruct(
        minAge: castToType<int>(data['minAge']),
        maxAge: castToType<int>(data['maxAge']),
      );

  static AgeRangeStruct? maybeFromMap(dynamic data) =>
      data is Map ? AgeRangeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'minAge': _minAge,
        'maxAge': _maxAge,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'minAge': serializeParam(
          _minAge,
          ParamType.int,
        ),
        'maxAge': serializeParam(
          _maxAge,
          ParamType.int,
        ),
      }.withoutNulls;

  static AgeRangeStruct fromSerializableMap(Map<String, dynamic> data) =>
      AgeRangeStruct(
        minAge: deserializeParam(
          data['minAge'],
          ParamType.int,
          false,
        ),
        maxAge: deserializeParam(
          data['maxAge'],
          ParamType.int,
          false,
        ),
      );

  static AgeRangeStruct fromAlgoliaData(Map<String, dynamic> data) =>
      AgeRangeStruct(
        minAge: convertAlgoliaParam(
          data['minAge'],
          ParamType.int,
          false,
        ),
        maxAge: convertAlgoliaParam(
          data['maxAge'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'AgeRangeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AgeRangeStruct &&
        minAge == other.minAge &&
        maxAge == other.maxAge;
  }

  @override
  int get hashCode => const ListEquality().hash([minAge, maxAge]);
}

AgeRangeStruct createAgeRangeStruct({
  int? minAge,
  int? maxAge,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AgeRangeStruct(
      minAge: minAge,
      maxAge: maxAge,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AgeRangeStruct? updateAgeRangeStruct(
  AgeRangeStruct? ageRange, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ageRange
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAgeRangeStructData(
  Map<String, dynamic> firestoreData,
  AgeRangeStruct? ageRange,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ageRange == null) {
    return;
  }
  if (ageRange.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ageRange.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ageRangeData = getAgeRangeFirestoreData(ageRange, forFieldValue);
  final nestedData = ageRangeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ageRange.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAgeRangeFirestoreData(
  AgeRangeStruct? ageRange, [
  bool forFieldValue = false,
]) {
  if (ageRange == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ageRange.toMap());

  // Add any Firestore field values
  ageRange.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAgeRangeListFirestoreData(
  List<AgeRangeStruct>? ageRanges,
) =>
    ageRanges?.map((e) => getAgeRangeFirestoreData(e, true)).toList() ?? [];
