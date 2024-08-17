import '../database.dart';

class SubscriptionsTable extends SupabaseTable<SubscriptionsRow> {
  @override
  String get tableName => 'subscriptions';

  @override
  SubscriptionsRow createRow(Map<String, dynamic> data) =>
      SubscriptionsRow(data);
}

class SubscriptionsRow extends SupabaseDataRow {
  SubscriptionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SubscriptionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get amount => getField<int>('amount');
  set amount(int? value) => setField<int>('amount', value);

  String get duration => getField<String>('duration')!;
  set duration(String value) => setField<String>('duration', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get planCode => getField<String>('plan_code');
  set planCode(String? value) => setField<String>('plan_code', value);

  List<String> get benefits => getListField<String>('benefits');
  set benefits(List<String>? value) => setListField<String>('benefits', value);

  int get sessions => getField<int>('sessions')!;
  set sessions(int value) => setField<int>('sessions', value);

  bool get unlimited => getField<bool>('unlimited')!;
  set unlimited(bool value) => setField<bool>('unlimited', value);

  bool get isConsumable => getField<bool>('isConsumable')!;
  set isConsumable(bool value) => setField<bool>('isConsumable', value);

  String? get productAppleid => getField<String>('product_appleid');
  set productAppleid(String? value) =>
      setField<String>('product_appleid', value);

  String? get appleSubId => getField<String>('apple_sub_id');
  set appleSubId(String? value) => setField<String>('apple_sub_id', value);

  String? get androidPlanId => getField<String>('android_plan_id');
  set androidPlanId(String? value) =>
      setField<String>('android_plan_id', value);
}
