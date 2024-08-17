// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommitmentStruct extends FFFirebaseStruct {
  CommitmentStruct({
    int? days,
    String? caption,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _days = days,
        _caption = caption,
        super(firestoreUtilData);

  // "days" field.
  int? _days;
  int get days => _days ?? 0;
  set days(int? val) => _days = val;

  void incrementDays(int amount) => days = days + amount;

  bool hasDays() => _days != null;

  // "caption" field.
  String? _caption;
  String get caption => _caption ?? '';
  set caption(String? val) => _caption = val;

  bool hasCaption() => _caption != null;

  static CommitmentStruct fromMap(Map<String, dynamic> data) =>
      CommitmentStruct(
        days: castToType<int>(data['days']),
        caption: data['caption'] as String?,
      );

  static CommitmentStruct? maybeFromMap(dynamic data) => data is Map
      ? CommitmentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'days': _days,
        'caption': _caption,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'days': serializeParam(
          _days,
          ParamType.int,
        ),
        'caption': serializeParam(
          _caption,
          ParamType.String,
        ),
      }.withoutNulls;

  static CommitmentStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommitmentStruct(
        days: deserializeParam(
          data['days'],
          ParamType.int,
          false,
        ),
        caption: deserializeParam(
          data['caption'],
          ParamType.String,
          false,
        ),
      );

  static CommitmentStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CommitmentStruct(
        days: convertAlgoliaParam(
          data['days'],
          ParamType.int,
          false,
        ),
        caption: convertAlgoliaParam(
          data['caption'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CommitmentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommitmentStruct &&
        days == other.days &&
        caption == other.caption;
  }

  @override
  int get hashCode => const ListEquality().hash([days, caption]);
}

CommitmentStruct createCommitmentStruct({
  int? days,
  String? caption,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CommitmentStruct(
      days: days,
      caption: caption,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CommitmentStruct? updateCommitmentStruct(
  CommitmentStruct? commitment, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    commitment
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCommitmentStructData(
  Map<String, dynamic> firestoreData,
  CommitmentStruct? commitment,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (commitment == null) {
    return;
  }
  if (commitment.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && commitment.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final commitmentData = getCommitmentFirestoreData(commitment, forFieldValue);
  final nestedData = commitmentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = commitment.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCommitmentFirestoreData(
  CommitmentStruct? commitment, [
  bool forFieldValue = false,
]) {
  if (commitment == null) {
    return {};
  }
  final firestoreData = mapToFirestore(commitment.toMap());

  // Add any Firestore field values
  commitment.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCommitmentListFirestoreData(
  List<CommitmentStruct>? commitments,
) =>
    commitments?.map((e) => getCommitmentFirestoreData(e, true)).toList() ?? [];
