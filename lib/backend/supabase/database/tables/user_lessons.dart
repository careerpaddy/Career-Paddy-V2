import '../database.dart';

class UserLessonsTable extends SupabaseTable<UserLessonsRow> {
  @override
  String get tableName => 'user lessons';

  @override
  UserLessonsRow createRow(Map<String, dynamic> data) => UserLessonsRow(data);
}

class UserLessonsRow extends SupabaseDataRow {
  UserLessonsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserLessonsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  bool get completed => getField<bool>('completed')!;
  set completed(bool value) => setField<bool>('completed', value);

  int? get questionBatch => getField<int>('question_batch');
  set questionBatch(int? value) => setField<int>('question_batch', value);

  String? get lessonName => getField<String>('lesson_name');
  set lessonName(String? value) => setField<String>('lesson_name', value);

  int? get questionBatchTens => getField<int>('question_batch_tens');
  set questionBatchTens(int? value) =>
      setField<int>('question_batch_tens', value);

  String? get lessonId => getField<String>('lesson_id');
  set lessonId(String? value) => setField<String>('lesson_id', value);
}
