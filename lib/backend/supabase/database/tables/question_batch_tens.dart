import '../database.dart';

class QuestionBatchTensTable extends SupabaseTable<QuestionBatchTensRow> {
  @override
  String get tableName => 'question_batch_tens';

  @override
  QuestionBatchTensRow createRow(Map<String, dynamic> data) =>
      QuestionBatchTensRow(data);
}

class QuestionBatchTensRow extends SupabaseDataRow {
  QuestionBatchTensRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QuestionBatchTensTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get lessonId => getField<String>('lesson_id')!;
  set lessonId(String value) => setField<String>('lesson_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  List<String> get lessons => getListField<String>('lessons');
  set lessons(List<String>? value) => setListField<String>('lessons', value);

  int get totalQuestions => getField<int>('total_questions')!;
  set totalQuestions(int value) => setField<int>('total_questions', value);

  bool get isFirst => getField<bool>('is_first')!;
  set isFirst(bool value) => setField<bool>('is_first', value);

  double get xField => getField<double>('x')!;
  set xField(double value) => setField<double>('x', value);
}
