// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends FFFirebaseStruct {
  UserStruct({
    String? fullName,
    String? objectID,
    String? id,
    String? email,
    String? jobRole,
    String? linkedIn,
    String? type,
    String? bio,
    String? imagew,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fullName = fullName,
        _objectID = objectID,
        _id = id,
        _email = email,
        _jobRole = jobRole,
        _linkedIn = linkedIn,
        _type = type,
        _bio = bio,
        _imagew = imagew,
        super(firestoreUtilData);

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "objectID" field.
  String? _objectID;
  String get objectID => _objectID ?? '';
  set objectID(String? val) => _objectID = val;

  bool hasObjectID() => _objectID != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

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

  // "linkedIn" field.
  String? _linkedIn;
  String get linkedIn => _linkedIn ?? '';
  set linkedIn(String? val) => _linkedIn = val;

  bool hasLinkedIn() => _linkedIn != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  set bio(String? val) => _bio = val;

  bool hasBio() => _bio != null;

  // "imagew" field.
  String? _imagew;
  String get imagew => _imagew ?? '';
  set imagew(String? val) => _imagew = val;

  bool hasImagew() => _imagew != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        fullName: data['full_name'] as String?,
        objectID: data['objectID'] as String?,
        id: data['id'] as String?,
        email: data['email'] as String?,
        jobRole: data['job_role'] as String?,
        linkedIn: data['linkedIn'] as String?,
        type: data['type'] as String?,
        bio: data['bio'] as String?,
        imagew: data['imagew'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'full_name': _fullName,
        'objectID': _objectID,
        'id': _id,
        'email': _email,
        'job_role': _jobRole,
        'linkedIn': _linkedIn,
        'type': _type,
        'bio': _bio,
        'imagew': _imagew,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'full_name': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'objectID': serializeParam(
          _objectID,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
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
        'linkedIn': serializeParam(
          _linkedIn,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'bio': serializeParam(
          _bio,
          ParamType.String,
        ),
        'imagew': serializeParam(
          _imagew,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        fullName: deserializeParam(
          data['full_name'],
          ParamType.String,
          false,
        ),
        objectID: deserializeParam(
          data['objectID'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
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
        linkedIn: deserializeParam(
          data['linkedIn'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        bio: deserializeParam(
          data['bio'],
          ParamType.String,
          false,
        ),
        imagew: deserializeParam(
          data['imagew'],
          ParamType.String,
          false,
        ),
      );

  static UserStruct fromAlgoliaData(Map<String, dynamic> data) => UserStruct(
        fullName: convertAlgoliaParam(
          data['full_name'],
          ParamType.String,
          false,
        ),
        objectID: convertAlgoliaParam(
          data['objectID'],
          ParamType.String,
          false,
        ),
        id: convertAlgoliaParam(
          data['id'],
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
        linkedIn: convertAlgoliaParam(
          data['linkedIn'],
          ParamType.String,
          false,
        ),
        type: convertAlgoliaParam(
          data['type'],
          ParamType.String,
          false,
        ),
        bio: convertAlgoliaParam(
          data['bio'],
          ParamType.String,
          false,
        ),
        imagew: convertAlgoliaParam(
          data['imagew'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        fullName == other.fullName &&
        objectID == other.objectID &&
        id == other.id &&
        email == other.email &&
        jobRole == other.jobRole &&
        linkedIn == other.linkedIn &&
        type == other.type &&
        bio == other.bio &&
        imagew == other.imagew;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [fullName, objectID, id, email, jobRole, linkedIn, type, bio, imagew]);
}

UserStruct createUserStruct({
  String? fullName,
  String? objectID,
  String? id,
  String? email,
  String? jobRole,
  String? linkedIn,
  String? type,
  String? bio,
  String? imagew,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserStruct(
      fullName: fullName,
      objectID: objectID,
      id: id,
      email: email,
      jobRole: jobRole,
      linkedIn: linkedIn,
      type: type,
      bio: bio,
      imagew: imagew,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserStruct? updateUserStruct(
  UserStruct? user, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    user
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserStructData(
  Map<String, dynamic> firestoreData,
  UserStruct? user,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (user == null) {
    return;
  }
  if (user.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && user.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userData = getUserFirestoreData(user, forFieldValue);
  final nestedData = userData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = user.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFirestoreData(
  UserStruct? user, [
  bool forFieldValue = false,
]) {
  if (user == null) {
    return {};
  }
  final firestoreData = mapToFirestore(user.toMap());

  // Add any Firestore field values
  user.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserListFirestoreData(
  List<UserStruct>? users,
) =>
    users?.map((e) => getUserFirestoreData(e, true)).toList() ?? [];
