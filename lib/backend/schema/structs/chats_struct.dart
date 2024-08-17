// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsStruct extends FFFirebaseStruct {
  ChatsStruct({
    String? chatId,
    String? paddy,
    String? buddy,
    String? buddyName,
    String? paddyName,
    String? buddyImage,
    String? paddyImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _chatId = chatId,
        _paddy = paddy,
        _buddy = buddy,
        _buddyName = buddyName,
        _paddyName = paddyName,
        _buddyImage = buddyImage,
        _paddyImage = paddyImage,
        super(firestoreUtilData);

  // "chat_id" field.
  String? _chatId;
  String get chatId => _chatId ?? '';
  set chatId(String? val) => _chatId = val;

  bool hasChatId() => _chatId != null;

  // "paddy" field.
  String? _paddy;
  String get paddy => _paddy ?? '';
  set paddy(String? val) => _paddy = val;

  bool hasPaddy() => _paddy != null;

  // "buddy" field.
  String? _buddy;
  String get buddy => _buddy ?? '';
  set buddy(String? val) => _buddy = val;

  bool hasBuddy() => _buddy != null;

  // "buddy_name" field.
  String? _buddyName;
  String get buddyName => _buddyName ?? '';
  set buddyName(String? val) => _buddyName = val;

  bool hasBuddyName() => _buddyName != null;

  // "paddy_name" field.
  String? _paddyName;
  String get paddyName => _paddyName ?? '';
  set paddyName(String? val) => _paddyName = val;

  bool hasPaddyName() => _paddyName != null;

  // "buddy_image" field.
  String? _buddyImage;
  String get buddyImage => _buddyImage ?? '';
  set buddyImage(String? val) => _buddyImage = val;

  bool hasBuddyImage() => _buddyImage != null;

  // "paddy_image" field.
  String? _paddyImage;
  String get paddyImage => _paddyImage ?? '';
  set paddyImage(String? val) => _paddyImage = val;

  bool hasPaddyImage() => _paddyImage != null;

  static ChatsStruct fromMap(Map<String, dynamic> data) => ChatsStruct(
        chatId: data['chat_id'] as String?,
        paddy: data['paddy'] as String?,
        buddy: data['buddy'] as String?,
        buddyName: data['buddy_name'] as String?,
        paddyName: data['paddy_name'] as String?,
        buddyImage: data['buddy_image'] as String?,
        paddyImage: data['paddy_image'] as String?,
      );

  static ChatsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChatsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'chat_id': _chatId,
        'paddy': _paddy,
        'buddy': _buddy,
        'buddy_name': _buddyName,
        'paddy_name': _paddyName,
        'buddy_image': _buddyImage,
        'paddy_image': _paddyImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'chat_id': serializeParam(
          _chatId,
          ParamType.String,
        ),
        'paddy': serializeParam(
          _paddy,
          ParamType.String,
        ),
        'buddy': serializeParam(
          _buddy,
          ParamType.String,
        ),
        'buddy_name': serializeParam(
          _buddyName,
          ParamType.String,
        ),
        'paddy_name': serializeParam(
          _paddyName,
          ParamType.String,
        ),
        'buddy_image': serializeParam(
          _buddyImage,
          ParamType.String,
        ),
        'paddy_image': serializeParam(
          _paddyImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatsStruct(
        chatId: deserializeParam(
          data['chat_id'],
          ParamType.String,
          false,
        ),
        paddy: deserializeParam(
          data['paddy'],
          ParamType.String,
          false,
        ),
        buddy: deserializeParam(
          data['buddy'],
          ParamType.String,
          false,
        ),
        buddyName: deserializeParam(
          data['buddy_name'],
          ParamType.String,
          false,
        ),
        paddyName: deserializeParam(
          data['paddy_name'],
          ParamType.String,
          false,
        ),
        buddyImage: deserializeParam(
          data['buddy_image'],
          ParamType.String,
          false,
        ),
        paddyImage: deserializeParam(
          data['paddy_image'],
          ParamType.String,
          false,
        ),
      );

  static ChatsStruct fromAlgoliaData(Map<String, dynamic> data) => ChatsStruct(
        chatId: convertAlgoliaParam(
          data['chat_id'],
          ParamType.String,
          false,
        ),
        paddy: convertAlgoliaParam(
          data['paddy'],
          ParamType.String,
          false,
        ),
        buddy: convertAlgoliaParam(
          data['buddy'],
          ParamType.String,
          false,
        ),
        buddyName: convertAlgoliaParam(
          data['buddy_name'],
          ParamType.String,
          false,
        ),
        paddyName: convertAlgoliaParam(
          data['paddy_name'],
          ParamType.String,
          false,
        ),
        buddyImage: convertAlgoliaParam(
          data['buddy_image'],
          ParamType.String,
          false,
        ),
        paddyImage: convertAlgoliaParam(
          data['paddy_image'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ChatsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatsStruct &&
        chatId == other.chatId &&
        paddy == other.paddy &&
        buddy == other.buddy &&
        buddyName == other.buddyName &&
        paddyName == other.paddyName &&
        buddyImage == other.buddyImage &&
        paddyImage == other.paddyImage;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [chatId, paddy, buddy, buddyName, paddyName, buddyImage, paddyImage]);
}

ChatsStruct createChatsStruct({
  String? chatId,
  String? paddy,
  String? buddy,
  String? buddyName,
  String? paddyName,
  String? buddyImage,
  String? paddyImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatsStruct(
      chatId: chatId,
      paddy: paddy,
      buddy: buddy,
      buddyName: buddyName,
      paddyName: paddyName,
      buddyImage: buddyImage,
      paddyImage: paddyImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatsStruct? updateChatsStruct(
  ChatsStruct? chats, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chats
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatsStructData(
  Map<String, dynamic> firestoreData,
  ChatsStruct? chats,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chats == null) {
    return;
  }
  if (chats.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chats.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatsData = getChatsFirestoreData(chats, forFieldValue);
  final nestedData = chatsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chats.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatsFirestoreData(
  ChatsStruct? chats, [
  bool forFieldValue = false,
]) {
  if (chats == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chats.toMap());

  // Add any Firestore field values
  chats.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatsListFirestoreData(
  List<ChatsStruct>? chatss,
) =>
    chatss?.map((e) => getChatsFirestoreData(e, true)).toList() ?? [];
