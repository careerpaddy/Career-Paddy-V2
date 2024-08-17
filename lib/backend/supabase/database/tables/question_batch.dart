import '../database.dart';

class QuestionBatchTable extends SupabaseTable<QuestionBatchRow> {
  @override
  String get tableName => 'question batch';

  @override
  QuestionBatchRow createRow(Map<String, dynamic> data) =>
      QuestionBatchRow(data);
}

class QuestionBatchRow extends SupabaseDataRow {
  QuestionBatchRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QuestionBatchTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get lessonId => getField<String>('lesson_id')!;
  set lessonId(String value) => setField<String>('lesson_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get totalQuestions => getField<int>('total_questions');
  set totalQuestions(int? value) => setField<int>('total_questions', value);

  double get xField => getField<double>('x')!;
  set xField(double value) => setField<double>('x', value);

  List<String> get completed => getListField<String>('completed');
  set completed(List<String>? value) =>
      setListField<String>('completed', value);

  bool get isFirst => getField<bool>('is_first')!;
  set isFirst(bool value) => setField<bool>('is_first', value);

  bool get isLive => getField<bool>('isLive')!;
  set isLive(bool value) => setField<bool>('isLive', value);

  bool get isScenario => getField<bool>('isScenario')!;
  set isScenario(bool value) => setField<bool>('isScenario', value);
}
