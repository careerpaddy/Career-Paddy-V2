import '../database.dart';

class ChatsTable extends SupabaseTable<ChatsRow> {
  @override
  String get tableName => 'chats';

  @override
  ChatsRow createRow(Map<String, dynamic> data) => ChatsRow(data);
}

class ChatsRow extends SupabaseDataRow {
  ChatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatsTable();

  String get chatId => getField<String>('chat_id')!;
  set chatId(String value) => setField<String>('chat_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get paddy => getField<String>('paddy');
  set paddy(String? value) => setField<String>('paddy', value);

  String? get buddy => getField<String>('buddy');
  set buddy(String? value) => setField<String>('buddy', value);

  String? get buddyName => getField<String>('buddy_name');
  set buddyName(String? value) => setField<String>('buddy_name', value);

  String? get paddyName => getField<String>('paddy_name');
  set paddyName(String? value) => setField<String>('paddy_name', value);

  String? get buddyImage => getField<String>('buddy_image');
  set buddyImage(String? value) => setField<String>('buddy_image', value);

  String? get paddyImage => getField<String>('paddy_image');
  set paddyImage(String? value) => setField<String>('paddy_image', value);

  String? get lastMessage => getField<String>('last_message');
  set lastMessage(String? value) => setField<String>('last_message', value);

  List<String> get users => getListField<String>('users');
  set users(List<String>? value) => setListField<String>('users', value);

  int get paddyNotifications => getField<int>('paddy_notifications')!;
  set paddyNotifications(int value) =>
      setField<int>('paddy_notifications', value);

  int get buddyNotifications => getField<int>('buddy_notifications')!;
  set buddyNotifications(int value) =>
      setField<int>('buddy_notifications', value);
}
