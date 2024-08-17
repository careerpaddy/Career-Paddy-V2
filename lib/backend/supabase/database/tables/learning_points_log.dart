import '../database.dart';

class LearningPointsLogTable extends SupabaseTable<LearningPointsLogRow> {
  @override
  String get tableName => 'Learning Points Log';

  @override
  LearningPointsLogRow createRow(Map<String, dynamic> data) =>
      LearningPointsLogRow(data);
}

class LearningPointsLogRow extends SupabaseDataRow {
  LearningPointsLogRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LearningPointsLogTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get learningPoints => getField<int>('learning_points')!;
  set learningPoints(int value) => setField<int>('learning_points', value);
}
