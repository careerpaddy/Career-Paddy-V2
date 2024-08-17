import '../database.dart';

class OptionsTable extends SupabaseTable<OptionsRow> {
  @override
  String get tableName => 'options';

  @override
  OptionsRow createRow(Map<String, dynamic> data) => OptionsRow(data);
}

class OptionsRow extends SupabaseDataRow {
  OptionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OptionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  bool get isCorrect => getField<bool>('is_correct')!;
  set isCorrect(bool value) => setField<bool>('is_correct', value);

  String get lessonId => getField<String>('lesson_id')!;
  set lessonId(String value) => setField<String>('lesson_id', value);

  int get questionId => getField<int>('question_id')!;
  set questionId(int value) => setField<int>('question_id', value);

  String? get explanation => getField<String>('explanation');
  set explanation(String? value) => setField<String>('explanation', value);

  int? get batchId => getField<int>('batch_id');
  set batchId(int? value) => setField<int>('batch_id', value);
}
