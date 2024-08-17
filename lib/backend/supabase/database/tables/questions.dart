import '../database.dart';

class QuestionsTable extends SupabaseTable<QuestionsRow> {
  @override
  String get tableName => 'questions';

  @override
  QuestionsRow createRow(Map<String, dynamic> data) => QuestionsRow(data);
}

class QuestionsRow extends SupabaseDataRow {
  QuestionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QuestionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get question => getField<String>('question')!;
  set question(String value) => setField<String>('question', value);

  String get lessonId => getField<String>('lesson_id')!;
  set lessonId(String value) => setField<String>('lesson_id', value);

  int? get batchId => getField<int>('batch_id');
  set batchId(int? value) => setField<int>('batch_id', value);

  int? get questionBatchTen => getField<int>('question_batch_ten');
  set questionBatchTen(int? value) =>
      setField<int>('question_batch_ten', value);

  int get batches => getField<int>('batches')!;
  set batches(int value) => setField<int>('batches', value);

  bool get isLive => getField<bool>('is_live')!;
  set isLive(bool value) => setField<bool>('is_live', value);

  String? get scenario => getField<String>('scenario');
  set scenario(String? value) => setField<String>('scenario', value);

  String? get dialogue => getField<String>('dialogue');
  set dialogue(String? value) => setField<String>('dialogue', value);
}
