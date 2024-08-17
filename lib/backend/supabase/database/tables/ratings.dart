import '../database.dart';

class RatingsTable extends SupabaseTable<RatingsRow> {
  @override
  String get tableName => 'ratings';

  @override
  RatingsRow createRow(Map<String, dynamic> data) => RatingsRow(data);
}

class RatingsRow extends SupabaseDataRow {
  RatingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RatingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get bookingId => getField<int>('booking_id');
  set bookingId(int? value) => setField<int>('booking_id', value);

  int? get rating => getField<int>('rating');
  set rating(int? value) => setField<int>('rating', value);

  String? get qualityCheck => getField<String>('quality_check');
  set qualityCheck(String? value) => setField<String>('quality_check', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  String? get serviceType => getField<String>('service_type');
  set serviceType(String? value) => setField<String>('service_type', value);

  String? get servicesRendered => getField<String>('services_rendered');
  set servicesRendered(String? value) =>
      setField<String>('services_rendered', value);

  String? get paddyImprove => getField<String>('paddy_improve');
  set paddyImprove(String? value) => setField<String>('paddy_improve', value);

  int? get noSessions => getField<int>('no_sessions');
  set noSessions(int? value) => setField<int>('no_sessions', value);

  int? get sessionsCompleted => getField<int>('sessions_completed');
  set sessionsCompleted(int? value) =>
      setField<int>('sessions_completed', value);

  String? get buddy => getField<String>('buddy');
  set buddy(String? value) => setField<String>('buddy', value);

  String? get paddy => getField<String>('paddy');
  set paddy(String? value) => setField<String>('paddy', value);

  String? get explanation => getField<String>('explanation');
  set explanation(String? value) => setField<String>('explanation', value);

  String? get harassment => getField<String>('harassment');
  set harassment(String? value) => setField<String>('harassment', value);

  String? get improvement => getField<String>('improvement');
  set improvement(String? value) => setField<String>('improvement', value);

  String? get sentBy => getField<String>('sent_by');
  set sentBy(String? value) => setField<String>('sent_by', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get buddyname => getField<String>('buddyname');
  set buddyname(String? value) => setField<String>('buddyname', value);

  String? get paddyname => getField<String>('paddyname');
  set paddyname(String? value) => setField<String>('paddyname', value);
}
