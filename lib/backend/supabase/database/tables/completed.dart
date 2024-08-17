import '../database.dart';

class CompletedTable extends SupabaseTable<CompletedRow> {
  @override
  String get tableName => 'completed';

  @override
  CompletedRow createRow(Map<String, dynamic> data) => CompletedRow(data);
}

class CompletedRow extends SupabaseDataRow {
  CompletedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CompletedTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get questionBatch => getField<int>('question_batch');
  set questionBatch(int? value) => setField<int>('question_batch', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get points => getField<int>('points');
  set points(int? value) => setField<int>('points', value);

  int? get questionBatchTens => getField<int>('question_batch_tens');
  set questionBatchTens(int? value) =>
      setField<int>('question_batch_tens', value);

  String? get lessonId => getField<String>('lesson_id');
  set lessonId(String? value) => setField<String>('lesson_id', value);
}
