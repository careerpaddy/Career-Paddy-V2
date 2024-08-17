import '../database.dart';

class LessonsTable extends SupabaseTable<LessonsRow> {
  @override
  String get tableName => 'lessons';

  @override
  LessonsRow createRow(Map<String, dynamic> data) => LessonsRow(data);
}

class LessonsRow extends SupabaseDataRow {
  LessonsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LessonsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  int get questionsCount => getField<int>('questions_count')!;
  set questionsCount(int value) => setField<int>('questions_count', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String get color => getField<String>('color')!;
  set color(String value) => setField<String>('color', value);

  List<String> get keyTopics => getListField<String>('key_topics');
  set keyTopics(List<String>? value) =>
      setListField<String>('key_topics', value);

  bool get isLive => getField<bool>('isLive')!;
  set isLive(bool value) => setField<bool>('isLive', value);

  int get batches => getField<int>('batches')!;
  set batches(int value) => setField<int>('batches', value);

  String? get progressColor => getField<String>('progress_color');
  set progressColor(String? value) => setField<String>('progress_color', value);

  String? get optionColor => getField<String>('option_color');
  set optionColor(String? value) => setField<String>('option_color', value);

  String? get optionClicked => getField<String>('option_clicked');
  set optionClicked(String? value) => setField<String>('option_clicked', value);

  String? get optionTextColor => getField<String>('option_text_color');
  set optionTextColor(String? value) =>
      setField<String>('option_text_color', value);

  String? get borderColor => getField<String>('border_color');
  set borderColor(String? value) => setField<String>('border_color', value);

  String? get dropShadow => getField<String>('drop_shadow');
  set dropShadow(String? value) => setField<String>('drop_shadow', value);

  String? get buttonColor => getField<String>('button_color');
  set buttonColor(String? value) => setField<String>('button_color', value);

  String? get clickedTextColor => getField<String>('clicked_text_color');
  set clickedTextColor(String? value) =>
      setField<String>('clicked_text_color', value);

  int get duration => getField<int>('duration')!;
  set duration(int value) => setField<int>('duration', value);

  String? get v2Color => getField<String>('v2Color');
  set v2Color(String? value) => setField<String>('v2Color', value);

  int get v2Batches => getField<int>('v2Batches')!;
  set v2Batches(int value) => setField<int>('v2Batches', value);

  List<int> get v2BatchesId => getListField<int>('v2BatchesId');
  set v2BatchesId(List<int>? value) => setListField<int>('v2BatchesId', value);

  String? get v2Light => getField<String>('v2_light');
  set v2Light(String? value) => setField<String>('v2_light', value);

  String? get v2Dark => getField<String>('v2_dark');
  set v2Dark(String? value) => setField<String>('v2_dark', value);

  String? get v2BtnColor => getField<String>('v2_btn_color');
  set v2BtnColor(String? value) => setField<String>('v2_btn_color', value);

  String? get v2QuestionColor => getField<String>('v2_question_color');
  set v2QuestionColor(String? value) =>
      setField<String>('v2_question_color', value);

  String? get v2SmallTextColor => getField<String>('v2_small_text_color');
  set v2SmallTextColor(String? value) =>
      setField<String>('v2_small_text_color', value);

  String? get v2SmallBackground => getField<String>('v2_small_background');
  set v2SmallBackground(String? value) =>
      setField<String>('v2_small_background', value);

  String? get outcome => getField<String>('outcome');
  set outcome(String? value) => setField<String>('outcome', value);

  int? get index => getField<int>('index');
  set index(int? value) => setField<int>('index', value);

  String? get v2BtnTextColor => getField<String>('v2_btn_text_color');
  set v2BtnTextColor(String? value) =>
      setField<String>('v2_btn_text_color', value);

  String? get progressBarColor => getField<String>('progressBarColor');
  set progressBarColor(String? value) =>
      setField<String>('progressBarColor', value);

  String? get progressBackground => getField<String>('progressBackground');
  set progressBackground(String? value) =>
      setField<String>('progressBackground', value);

  String? get v2OptionColor => getField<String>('v2_option_color');
  set v2OptionColor(String? value) =>
      setField<String>('v2_option_color', value);

  String? get v2OptionShadow => getField<String>('v2_option_shadow');
  set v2OptionShadow(String? value) =>
      setField<String>('v2_option_shadow', value);

  String? get v2OptionSelected => getField<String>('v2_option_selected');
  set v2OptionSelected(String? value) =>
      setField<String>('v2_option_selected', value);
}
