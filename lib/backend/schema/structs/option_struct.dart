// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OptionStruct extends FFFirebaseStruct {
  OptionStruct({
    int? id,
    String? name,
    bool? isCorrect,
    String? lessonId,
    String? questionId,
    String? explanation,
    int? batchId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _isCorrect = isCorrect,
        _lessonId = lessonId,
        _questionId = questionId,
        _explanation = explanation,
        _batchId = batchId,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "is_correct" field.
  bool? _isCorrect;
  bool get isCorrect => _isCorrect ?? false;
  set isCorrect(bool? val) => _isCorrect = val;

  bool hasIsCorrect() => _isCorrect != null;

  // "lesson_id" field.
  String? _lessonId;
  String get lessonId => _lessonId ?? '';
  set lessonId(String? val) => _lessonId = val;

  bool hasLessonId() => _lessonId != null;

  // "question_id" field.
  String? _questionId;
  String get questionId => _questionId ?? '';
  set questionId(String? val) => _questionId = val;

  bool hasQuestionId() => _questionId != null;

  // "explanation" field.
  String? _explanation;
  String get explanation => _explanation ?? '';
  set explanation(String? val) => _explanation = val;

  bool hasExplanation() => _explanation != null;

  // "batchId" field.
  int? _batchId;
  int get batchId => _batchId ?? 0;
  set batchId(int? val) => _batchId = val;

  void incrementBatchId(int amount) => batchId = batchId + amount;

  bool hasBatchId() => _batchId != null;

  static OptionStruct fromMap(Map<String, dynamic> data) => OptionStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        isCorrect: data['is_correct'] as bool?,
        lessonId: data['lesson_id'] as String?,
        questionId: data['question_id'] as String?,
        explanation: data['explanation'] as String?,
        batchId: castToType<int>(data['batchId']),
      );

  static OptionStruct? maybeFromMap(dynamic data) =>
      data is Map ? OptionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'is_correct': _isCorrect,
        'lesson_id': _lessonId,
        'question_id': _questionId,
        'explanation': _explanation,
        'batchId': _batchId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'is_correct': serializeParam(
          _isCorrect,
          ParamType.bool,
        ),
        'lesson_id': serializeParam(
          _lessonId,
          ParamType.String,
        ),
        'question_id': serializeParam(
          _questionId,
          ParamType.String,
        ),
        'explanation': serializeParam(
          _explanation,
          ParamType.String,
        ),
        'batchId': serializeParam(
          _batchId,
          ParamType.int,
        ),
      }.withoutNulls;

  static OptionStruct fromSerializableMap(Map<String, dynamic> data) =>
      OptionStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        isCorrect: deserializeParam(
          data['is_correct'],
          ParamType.bool,
          false,
        ),
        lessonId: deserializeParam(
          data['lesson_id'],
          ParamType.String,
          false,
        ),
        questionId: deserializeParam(
          data['question_id'],
          ParamType.String,
          false,
        ),
        explanation: deserializeParam(
          data['explanation'],
          ParamType.String,
          false,
        ),
        batchId: deserializeParam(
          data['batchId'],
          ParamType.int,
          false,
        ),
      );

  static OptionStruct fromAlgoliaData(Map<String, dynamic> data) =>
      OptionStruct(
        id: convertAlgoliaParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        isCorrect: convertAlgoliaParam(
          data['is_correct'],
          ParamType.bool,
          false,
        ),
        lessonId: convertAlgoliaParam(
          data['lesson_id'],
          ParamType.String,
          false,
        ),
        questionId: convertAlgoliaParam(
          data['question_id'],
          ParamType.String,
          false,
        ),
        explanation: convertAlgoliaParam(
          data['explanation'],
          ParamType.String,
          false,
        ),
        batchId: convertAlgoliaParam(
          data['batchId'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'OptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OptionStruct &&
        id == other.id &&
        name == other.name &&
        isCorrect == other.isCorrect &&
        lessonId == other.lessonId &&
        questionId == other.questionId &&
        explanation == other.explanation &&
        batchId == other.batchId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, isCorrect, lessonId, questionId, explanation, batchId]);
}

OptionStruct createOptionStruct({
  int? id,
  String? name,
  bool? isCorrect,
  String? lessonId,
  String? questionId,
  String? explanation,
  int? batchId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OptionStruct(
      id: id,
      name: name,
      isCorrect: isCorrect,
      lessonId: lessonId,
      questionId: questionId,
      explanation: explanation,
      batchId: batchId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OptionStruct? updateOptionStruct(
  OptionStruct? option, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    option
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOptionStructData(
  Map<String, dynamic> firestoreData,
  OptionStruct? option,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (option == null) {
    return;
  }
  if (option.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && option.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final optionData = getOptionFirestoreData(option, forFieldValue);
  final nestedData = optionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = option.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOptionFirestoreData(
  OptionStruct? option, [
  bool forFieldValue = false,
]) {
  if (option == null) {
    return {};
  }
  final firestoreData = mapToFirestore(option.toMap());

  // Add any Firestore field values
  option.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOptionListFirestoreData(
  List<OptionStruct>? options,
) =>
    options?.map((e) => getOptionFirestoreData(e, true)).toList() ?? [];
