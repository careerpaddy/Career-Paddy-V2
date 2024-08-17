import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _lives = await secureStorage.getInt('ff_lives') ?? _lives;
    });
    await _safeInitAsync(() async {
      _hasShownScenario = await secureStorage.getBool('ff_hasShownScenario') ??
          _hasShownScenario;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  DateTime? _Dateselect = DateTime.fromMillisecondsSinceEpoch(1695375840000);
  DateTime? get Dateselect => _Dateselect;
  set Dateselect(DateTime? value) {
    _Dateselect = value;
  }

  int _lives = 2;
  int get lives => _lives;
  set lives(int value) {
    _lives = value;
    secureStorage.setInt('ff_lives', value);
  }

  void deleteLives() {
    secureStorage.delete(key: 'ff_lives');
  }

  int _points = 1;
  int get points => _points;
  set points(int value) {
    _points = value;
  }

  String _fullname = '';
  String get fullname => _fullname;
  set fullname(String value) {
    _fullname = value;
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
  }

  String _location = '';
  String get location => _location;
  set location(String value) {
    _location = value;
  }

  String _image = '';
  String get image => _image;
  set image(String value) {
    _image = value;
  }

  String _jobtitle = '';
  String get jobtitle => _jobtitle;
  set jobtitle(String value) {
    _jobtitle = value;
  }

  String _bio = '';
  String get bio => _bio;
  set bio(String value) {
    _bio = value;
  }

  String _status = '';
  String get status => _status;
  set status(String value) {
    _status = value;
  }

  String _resume = '';
  String get resume => _resume;
  set resume(String value) {
    _resume = value;
  }

  List<String> _skills = [];
  List<String> get skills => _skills;
  set skills(List<String> value) {
    _skills = value;
  }

  void addToSkills(String value) {
    skills.add(value);
  }

  void removeFromSkills(String value) {
    skills.remove(value);
  }

  void removeAtIndexFromSkills(int index) {
    skills.removeAt(index);
  }

  void updateSkillsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    skills[index] = updateFn(_skills[index]);
  }

  void insertAtIndexInSkills(int index, String value) {
    skills.insert(index, value);
  }

  int _experience = 0;
  int get experience => _experience;
  set experience(int value) {
    _experience = value;
  }

  String _firstDegree = '';
  String get firstDegree => _firstDegree;
  set firstDegree(String value) {
    _firstDegree = value;
  }

  String _lastDegree = '';
  String get lastDegree => _lastDegree;
  set lastDegree(String value) {
    _lastDegree = value;
  }

  String _university = '';
  String get university => _university;
  set university(String value) {
    _university = value;
  }

  String _secondUniversity = '';
  String get secondUniversity => _secondUniversity;
  set secondUniversity(String value) {
    _secondUniversity = value;
  }

  String _employer = '';
  String get employer => _employer;
  set employer(String value) {
    _employer = value;
  }

  List<String> _services = [];
  List<String> get services => _services;
  set services(List<String> value) {
    _services = value;
  }

  void addToServices(String value) {
    services.add(value);
  }

  void removeFromServices(String value) {
    services.remove(value);
  }

  void removeAtIndexFromServices(int index) {
    services.removeAt(index);
  }

  void updateServicesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    services[index] = updateFn(_services[index]);
  }

  void insertAtIndexInServices(int index, String value) {
    services.insert(index, value);
  }

  int _timer = 0;
  int get timer => _timer;
  set timer(int value) {
    _timer = value;
  }

  List<int> _failedQuestions = [];
  List<int> get failedQuestions => _failedQuestions;
  set failedQuestions(List<int> value) {
    _failedQuestions = value;
  }

  void addToFailedQuestions(int value) {
    failedQuestions.add(value);
  }

  void removeFromFailedQuestions(int value) {
    failedQuestions.remove(value);
  }

  void removeAtIndexFromFailedQuestions(int index) {
    failedQuestions.removeAt(index);
  }

  void updateFailedQuestionsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    failedQuestions[index] = updateFn(_failedQuestions[index]);
  }

  void insertAtIndexInFailedQuestions(int index, int value) {
    failedQuestions.insert(index, value);
  }

  String _plan = '';
  String get plan => _plan;
  set plan(String value) {
    _plan = value;
  }

  AgeRangeStruct _range = AgeRangeStruct();
  AgeRangeStruct get range => _range;
  set range(AgeRangeStruct value) {
    _range = value;
  }

  void updateRangeStruct(Function(AgeRangeStruct) updateFn) {
    updateFn(_range);
  }

  String _hearus = '';
  String get hearus => _hearus;
  set hearus(String value) {
    _hearus = value;
  }

  CommitmentStruct _goal = CommitmentStruct();
  CommitmentStruct get goal => _goal;
  set goal(CommitmentStruct value) {
    _goal = value;
  }

  void updateGoalStruct(Function(CommitmentStruct) updateFn) {
    updateFn(_goal);
  }

  String _gender = '';
  String get gender => _gender;
  set gender(String value) {
    _gender = value;
  }

  String _phone = '';
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
  }

  bool _hasShownScenario = false;
  bool get hasShownScenario => _hasShownScenario;
  set hasShownScenario(bool value) {
    _hasShownScenario = value;
    secureStorage.setBool('ff_hasShownScenario', value);
  }

  void deleteHasShownScenario() {
    secureStorage.delete(key: 'ff_hasShownScenario');
  }

  OptionStruct _option = OptionStruct();
  OptionStruct get option => _option;
  set option(OptionStruct value) {
    _option = value;
  }

  void updateOptionStruct(Function(OptionStruct) updateFn) {
    updateFn(_option);
  }

  bool _isDialogShown = false;
  bool get isDialogShown => _isDialogShown;
  set isDialogShown(bool value) {
    _isDialogShown = value;
  }

  bool _timerEnabled = true;
  bool get timerEnabled => _timerEnabled;
  set timerEnabled(bool value) {
    _timerEnabled = value;
  }

  int _batchId = 0;
  int get batchId => _batchId;
  set batchId(int value) {
    _batchId = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
