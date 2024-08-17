import '../database.dart';

class HighestScorerTable extends SupabaseTable<HighestScorerRow> {
  @override
  String get tableName => 'Highest Scorer';

  @override
  HighestScorerRow createRow(Map<String, dynamic> data) =>
      HighestScorerRow(data);
}

class HighestScorerRow extends SupabaseDataRow {
  HighestScorerRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HighestScorerTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get month => getField<int>('month')!;
  set month(int value) => setField<int>('month', value);

  int get year => getField<int>('year')!;
  set year(int value) => setField<int>('year', value);
}
