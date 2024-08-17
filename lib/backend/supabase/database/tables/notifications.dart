import '../database.dart';

class NotificationsTable extends SupabaseTable<NotificationsRow> {
  @override
  String get tableName => 'notifications';

  @override
  NotificationsRow createRow(Map<String, dynamic> data) =>
      NotificationsRow(data);
}

class NotificationsRow extends SupabaseDataRow {
  NotificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get body => getField<String>('body');
  set body(String? value) => setField<String>('body', value);

  String? get senderImage => getField<String>('sender_image');
  set senderImage(String? value) => setField<String>('sender_image', value);

  String? get senderId => getField<String>('sender_id');
  set senderId(String? value) => setField<String>('sender_id', value);

  String? get senderName => getField<String>('sender_name');
  set senderName(String? value) => setField<String>('sender_name', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userImage => getField<String>('user_image');
  set userImage(String? value) => setField<String>('user_image', value);

  String? get time => getField<String>('time');
  set time(String? value) => setField<String>('time', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get day => getField<String>('day');
  set day(String? value) => setField<String>('day', value);

  DateTime? get timestamp => getField<DateTime>('timestamp');
  set timestamp(DateTime? value) => setField<DateTime>('timestamp', value);

  String? get meetingLink => getField<String>('meeting_link');
  set meetingLink(String? value) => setField<String>('meeting_link', value);

  String? get service => getField<String>('service');
  set service(String? value) => setField<String>('service', value);

  String? get userEmail => getField<String>('user_email');
  set userEmail(String? value) => setField<String>('user_email', value);

  String? get senderEmail => getField<String>('sender_email');
  set senderEmail(String? value) => setField<String>('sender_email', value);

  String? get buddyEmail => getField<String>('buddy_email');
  set buddyEmail(String? value) => setField<String>('buddy_email', value);

  String? get paddyEmail => getField<String>('paddy_email');
  set paddyEmail(String? value) => setField<String>('paddy_email', value);

  List<String> get users => getListField<String>('users');
  set users(List<String>? value) => setListField<String>('users', value);

  String? get dataid => getField<String>('dataid');
  set dataid(String? value) => setField<String>('dataid', value);

  bool get read => getField<bool>('read')!;
  set read(bool value) => setField<bool>('read', value);
}
