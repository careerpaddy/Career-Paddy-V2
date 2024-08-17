import '../database.dart';

class ModuleBatchProgressTable extends SupabaseTable<ModuleBatchProgressRow> {
  @override
  String get tableName => 'module batch progress';

  @override
  ModuleBatchProgressRow createRow(Map<String, dynamic> data) =>
      ModuleBatchProgressRow(data);
}

class ModuleBatchProgressRow extends SupabaseDataRow {
  ModuleBatchProgressRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ModuleBatchProgressTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get batchId => getField<int>('batch_id')!;
  set batchId(int value) => setField<int>('batch_id', value);

  String get lessonId => getField<String>('lesson_id')!;
  set lessonId(String value) => setField<String>('lesson_id', value);

  int get currentIndex => getField<int>('currentIndex')!;
  set currentIndex(int value) => setField<int>('currentIndex', value);
}
