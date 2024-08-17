import '../database.dart';

class BookingsTable extends SupabaseTable<BookingsRow> {
  @override
  String get tableName => 'bookings';

  @override
  BookingsRow createRow(Map<String, dynamic> data) => BookingsRow(data);
}

class BookingsRow extends SupabaseDataRow {
  BookingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BookingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get buddy => getField<String>('buddy');
  set buddy(String? value) => setField<String>('buddy', value);

  String? get paddy => getField<String>('paddy');
  set paddy(String? value) => setField<String>('paddy', value);

  String? get time => getField<String>('time');
  set time(String? value) => setField<String>('time', value);

  String? get summary => getField<String>('summary');
  set summary(String? value) => setField<String>('summary', value);

  bool get isCompleted => getField<bool>('is_completed')!;
  set isCompleted(bool value) => setField<bool>('is_completed', value);

  bool get hasPaddyJoined => getField<bool>('has_paddy_joined')!;
  set hasPaddyJoined(bool value) => setField<bool>('has_paddy_joined', value);

  bool get hasBuddyJoined => getField<bool>('has_buddy_joined')!;
  set hasBuddyJoined(bool value) => setField<bool>('has_buddy_joined', value);

  bool get hasPaid => getField<bool>('has_paid')!;
  set hasPaid(bool value) => setField<bool>('has_paid', value);

  String? get buddyName => getField<String>('buddyName');
  set buddyName(String? value) => setField<String>('buddyName', value);

  String? get paddyName => getField<String>('paddyName');
  set paddyName(String? value) => setField<String>('paddyName', value);

  List<String> get users => getListField<String>('users');
  set users(List<String>? value) => setListField<String>('users', value);

  String? get lastMessage => getField<String>('last_message');
  set lastMessage(String? value) => setField<String>('last_message', value);

  String? get buddyImage => getField<String>('buddyImage');
  set buddyImage(String? value) => setField<String>('buddyImage', value);

  String? get paddyImage => getField<String>('paddyImage');
  set paddyImage(String? value) => setField<String>('paddyImage', value);

  bool get rescheduled => getField<bool>('rescheduled')!;
  set rescheduled(bool value) => setField<bool>('rescheduled', value);

  bool get hasExpired => getField<bool>('has_expired')!;
  set hasExpired(bool value) => setField<bool>('has_expired', value);

  String? get day => getField<String>('day');
  set day(String? value) => setField<String>('day', value);

  DateTime? get timestamp => getField<DateTime>('timestamp');
  set timestamp(DateTime? value) => setField<DateTime>('timestamp', value);

  String? get meetingLink => getField<String>('meeting_link');
  set meetingLink(String? value) => setField<String>('meeting_link', value);

  String? get paddyEmail => getField<String>('paddy_email');
  set paddyEmail(String? value) => setField<String>('paddy_email', value);

  String? get buddyEmail => getField<String>('buddy_email');
  set buddyEmail(String? value) => setField<String>('buddy_email', value);

  String? get buddyname => getField<String>('buddyname');
  set buddyname(String? value) => setField<String>('buddyname', value);

  String? get paddyname => getField<String>('paddyname');
  set paddyname(String? value) => setField<String>('paddyname', value);

  bool get rated => getField<bool>('rated')!;
  set rated(bool value) => setField<bool>('rated', value);
}
