import '../database.dart';

class BankAccountsTable extends SupabaseTable<BankAccountsRow> {
  @override
  String get tableName => 'bank accounts';

  @override
  BankAccountsRow createRow(Map<String, dynamic> data) => BankAccountsRow(data);
}

class BankAccountsRow extends SupabaseDataRow {
  BankAccountsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BankAccountsTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get accNumber => getField<String>('acc_number');
  set accNumber(String? value) => setField<String>('acc_number', value);

  String? get bankCode => getField<String>('bank_code');
  set bankCode(String? value) => setField<String>('bank_code', value);

  String get accountName => getField<String>('account_name')!;
  set accountName(String value) => setField<String>('account_name', value);
}
