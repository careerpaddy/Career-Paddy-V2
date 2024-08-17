// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchStruct extends FFFirebaseStruct {
  SearchStruct({
    String? type,
    String? fullName,
    String? email,
    String? jobRole,
    String? degree,
    String? university,
    String? image,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _fullName = fullName,
        _email = email,
        _jobRole = jobRole,
        _degree = degree,
        _university = university,
        _image = image,
        _id = id,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "job_role" field.
  String? _jobRole;
  String get jobRole => _jobRole ?? '';
  set jobRole(String? val) => _jobRole = val;

  bool hasJobRole() => _jobRole != null;

  // "degree" field.
  String? _degree;
  String get degree => _degree ?? '';
  set degree(String? val) => _degree = val;

  bool hasDegree() => _degree != null;

  // "university" field.
  String? _university;
  String get university => _university ?? '';
  set university(String? val) => _university = val;

  bool hasUniversity() => _university != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static SearchStruct fromMap(Map<String, dynamic> data) => SearchStruct(
        type: data['type'] as String?,
        fullName: data['full_name'] as String?,
        email: data['email'] as String?,
        jobRole: data['job_role'] as String?,
        degree: data['degree'] as String?,
        university: data['university'] as String?,
        image: data['image'] as String?,
        id: data['id'] as String?,
      );

  static SearchStruct? maybeFromMap(dynamic data) =>
      data is Map ? SearchStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'full_name': _fullName,
        'email': _email,
        'job_role': _jobRole,
        'degree': _degree,
        'university': _university,
        'image': _image,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'full_name': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'job_role': serializeParam(
          _jobRole,
          ParamType.String,
        ),
        'degree': serializeParam(
          _degree,
          ParamType.String,
        ),
        'university': serializeParam(
          _university,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static SearchStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        fullName: deserializeParam(
          data['full_name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        jobRole: deserializeParam(
          data['job_role'],
          ParamType.String,
          false,
        ),
        degree: deserializeParam(
          data['degree'],
          ParamType.String,
          false,
        ),
        university: deserializeParam(
          data['university'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  static SearchStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SearchStruct(
        type: convertAlgoliaParam(
          data['type'],
          ParamType.String,
          false,
        ),
        fullName: convertAlgoliaParam(
          data['full_name'],
          ParamType.String,
          false,
        ),
        email: convertAlgoliaParam(
          data['email'],
          ParamType.String,
          false,
        ),
        jobRole: convertAlgoliaParam(
          data['job_role'],
          ParamType.String,
          false,
        ),
        degree: convertAlgoliaParam(
          data['degree'],
          ParamType.String,
          false,
        ),
        university: convertAlgoliaParam(
          data['university'],
          ParamType.String,
          false,
        ),
        image: convertAlgoliaParam(
          data['image'],
          ParamType.String,
          false,
        ),
        id: convertAlgoliaParam(
          data['id'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SearchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchStruct &&
        type == other.type &&
        fullName == other.fullName &&
        email == other.email &&
        jobRole == other.jobRole &&
        degree == other.degree &&
        university == other.university &&
        image == other.image &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([type, fullName, email, jobRole, degree, university, image, id]);
}

SearchStruct createSearchStruct({
  String? type,
  String? fullName,
  String? email,
  String? jobRole,
  String? degree,
  String? university,
  String? image,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SearchStruct(
      type: type,
      fullName: fullName,
      email: email,
      jobRole: jobRole,
      degree: degree,
      university: university,
      image: image,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SearchStruct? updateSearchStruct(
  SearchStruct? search, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    search
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSearchStructData(
  Map<String, dynamic> firestoreData,
  SearchStruct? search,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (search == null) {
    return;
  }
  if (search.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && search.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final searchData = getSearchFirestoreData(search, forFieldValue);
  final nestedData = searchData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = search.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSearchFirestoreData(
  SearchStruct? search, [
  bool forFieldValue = false,
]) {
  if (search == null) {
    return {};
  }
  final firestoreData = mapToFirestore(search.toMap());

  // Add any Firestore field values
  search.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSearchListFirestoreData(
  List<SearchStruct>? searchs,
) =>
    searchs?.map((e) => getSearchFirestoreData(e, true)).toList() ?? [];
