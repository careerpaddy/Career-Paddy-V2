import '../database.dart';

class MessagesTable extends SupabaseTable<MessagesRow> {
  @override
  String get tableName => 'messages';

  @override
  MessagesRow createRow(Map<String, dynamic> data) => MessagesRow(data);
}

class MessagesRow extends SupabaseDataRow {
  MessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MessagesTable();

  int get messageId => getField<int>('message_id')!;
  set messageId(int value) => setField<int>('message_id', value);

  DateTime get timestamp => getField<DateTime>('timestamp')!;
  set timestamp(DateTime value) => setField<DateTime>('timestamp', value);

  String? get text => getField<String>('text');
  set text(String? value) => setField<String>('text', value);

  String get chatId => getField<String>('chat_id')!;
  set chatId(String value) => setField<String>('chat_id', value);

  String? get paddy => getField<String>('paddy');
  set paddy(String? value) => setField<String>('paddy', value);

  String? get sender => getField<String>('sender');
  set sender(String? value) => setField<String>('sender', value);

  String? get buddy => getField<String>('buddy');
  set buddy(String? value) => setField<String>('buddy', value);
}
