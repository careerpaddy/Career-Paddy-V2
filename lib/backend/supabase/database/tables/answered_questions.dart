import '../database.dart';

class AnsweredQuestionsTable extends SupabaseTable<AnsweredQuestionsRow> {
  @override
  String get tableName => 'answered questions';

  @override
  AnsweredQuestionsRow createRow(Map<String, dynamic> data) =>
      AnsweredQuestionsRow(data);
}

class AnsweredQuestionsRow extends SupabaseDataRow {
  AnsweredQuestionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnsweredQuestionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int? get questionId => getField<int>('question_id');
  set questionId(int? value) => setField<int>('question_id', value);

  String? get lessonId => getField<String>('lesson_id');
  set lessonId(String? value) => setField<String>('lesson_id', value);

  int? get questionBatchTen => getField<int>('question_batch_ten');
  set questionBatchTen(int? value) =>
      setField<int>('question_batch_ten', value);

  int? get questionBatch => getField<int>('question_batch');
  set questionBatch(int? value) => setField<int>('question_batch', value);
}
