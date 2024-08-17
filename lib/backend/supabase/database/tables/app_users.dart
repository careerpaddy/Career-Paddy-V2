import '../database.dart';

class AppUsersTable extends SupabaseTable<AppUsersRow> {
  @override
  String get tableName => 'App Users';

  @override
  AppUsersRow createRow(Map<String, dynamic> data) => AppUsersRow(data);
}

class AppUsersRow extends SupabaseDataRow {
  AppUsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppUsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  int? get experience => getField<int>('experience');
  set experience(int? value) => setField<int>('experience', value);

  String? get jobRole => getField<String>('job_role');
  set jobRole(String? value) => setField<String>('job_role', value);

  String? get linkedIn => getField<String>('linkedIn');
  set linkedIn(String? value) => setField<String>('linkedIn', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get bio => getField<String>('bio');
  set bio(String? value) => setField<String>('bio', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get degree => getField<String>('degree');
  set degree(String? value) => setField<String>('degree', value);

  int get paddyPoints => getField<int>('paddy_points')!;
  set paddyPoints(int value) => setField<int>('paddy_points', value);

  int get sessions => getField<int>('sessions')!;
  set sessions(int value) => setField<int>('sessions', value);

  List<String> get skills => getListField<String>('skills');
  set skills(List<String>? value) => setListField<String>('skills', value);

  String? get resume => getField<String>('resume');
  set resume(String? value) => setField<String>('resume', value);

  String? get social => getField<String>('social');
  set social(String? value) => setField<String>('social', value);

  int get streaks => getField<int>('streaks')!;
  set streaks(int value) => setField<int>('streaks', value);

  int get trophies => getField<int>('trophies')!;
  set trophies(int value) => setField<int>('trophies', value);

  int get lives => getField<int>('lives')!;
  set lives(int value) => setField<int>('lives', value);

  bool get isPaused => getField<bool>('is_paused')!;
  set isPaused(bool value) => setField<bool>('is_paused', value);

  int get fee => getField<int>('fee')!;
  set fee(int value) => setField<int>('fee', value);

  int get rating => getField<int>('rating')!;
  set rating(int value) => setField<int>('rating', value);

  int get timesRated => getField<int>('times_rated')!;
  set timesRated(int value) => setField<int>('times_rated', value);

  String get plan => getField<String>('plan')!;
  set plan(String value) => setField<String>('plan', value);

  int get coursesCompleted => getField<int>('courses_completed')!;
  set coursesCompleted(int value) => setField<int>('courses_completed', value);

  int get learningPoints => getField<int>('learning_points')!;
  set learningPoints(int value) => setField<int>('learning_points', value);

  String? get university => getField<String>('university');
  set university(String? value) => setField<String>('university', value);

  String? get sessionType => getField<String>('session_type');
  set sessionType(String? value) => setField<String>('session_type', value);

  String? get currency => getField<String>('currency');
  set currency(String? value) => setField<String>('currency', value);

  int get correctAnswers => getField<int>('correct_answers')!;
  set correctAnswers(int value) => setField<int>('correct_answers', value);

  int get incorrectAnswers => getField<int>('incorrect_answers')!;
  set incorrectAnswers(int value) => setField<int>('incorrect_answers', value);

  String? get firstDegree => getField<String>('first_degree');
  set firstDegree(String? value) => setField<String>('first_degree', value);

  String? get lastDegree => getField<String>('last_degree');
  set lastDegree(String? value) => setField<String>('last_degree', value);

  String? get secondUniversity => getField<String>('second_university');
  set secondUniversity(String? value) =>
      setField<String>('second_university', value);

  String? get employer => getField<String>('employer');
  set employer(String? value) => setField<String>('employer', value);

  int get noSession => getField<int>('no_session')!;
  set noSession(int value) => setField<int>('no_session', value);

  int? get discount => getField<int>('discount');
  set discount(int? value) => setField<int>('discount', value);

  DateTime? get streakDate => getField<DateTime>('streak_date');
  set streakDate(DateTime? value) => setField<DateTime>('streak_date', value);

  int get nextBatch => getField<int>('next_batch')!;
  set nextBatch(int value) => setField<int>('next_batch', value);

  String? get meetingLink => getField<String>('meeting_link');
  set meetingLink(String? value) => setField<String>('meeting_link', value);

  List<String> get availableDates => getListField<String>('available_dates');
  set availableDates(List<String>? value) =>
      setListField<String>('available_dates', value);

  List<String> get availableTime => getListField<String>('available_time');
  set availableTime(List<String>? value) =>
      setListField<String>('available_time', value);

  int get withdrawals => getField<int>('withdrawals')!;
  set withdrawals(int value) => setField<int>('withdrawals', value);

  List<String> get streakDays => getListField<String>('streak_days')!;
  set streakDays(List<String> value) =>
      setListField<String>('streak_days', value);

  List<String> get services => getListField<String>('services');
  set services(List<String>? value) => setListField<String>('services', value);

  bool get isApproved => getField<bool>('isApproved')!;
  set isApproved(bool value) => setField<bool>('isApproved', value);

  int? get notifications => getField<int>('notifications');
  set notifications(int? value) => setField<int>('notifications', value);

  String? get recipientId => getField<String>('recipient_id');
  set recipientId(String? value) => setField<String>('recipient_id', value);

  bool get declinedBreak => getField<bool>('declined_break')!;
  set declinedBreak(bool value) => setField<bool>('declined_break', value);

  bool get internshipAccepted => getField<bool>('internship_accepted')!;
  set internshipAccepted(bool value) =>
      setField<bool>('internship_accepted', value);

  DateTime? get internshipBonus => getField<DateTime>('internship_bonus');
  set internshipBonus(DateTime? value) =>
      setField<DateTime>('internship_bonus', value);

  DateTime? get lastLogin => getField<DateTime>('last_login');
  set lastLogin(DateTime? value) => setField<DateTime>('last_login', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get industry => getField<String>('industry');
  set industry(String? value) => setField<String>('industry', value);

  int get coins => getField<int>('coins')!;
  set coins(int value) => setField<int>('coins', value);

  bool get hasWatchAds => getField<bool>('hasWatchAds')!;
  set hasWatchAds(bool value) => setField<bool>('hasWatchAds', value);

  String? get year => getField<String>('year');
  set year(String? value) => setField<String>('year', value);

  String? get institution => getField<String>('institution');
  set institution(String? value) => setField<String>('institution', value);

  String? get course => getField<String>('course');
  set course(String? value) => setField<String>('course', value);

  dynamic? get commitment => getField<dynamic>('commitment');
  set commitment(dynamic? value) => setField<dynamic>('commitment', value);

  bool get isSemiPremium => getField<bool>('isSemiPremium')!;
  set isSemiPremium(bool value) => setField<bool>('isSemiPremium', value);

  bool get timerEnabled => getField<bool>('timerEnabled')!;
  set timerEnabled(bool value) => setField<bool>('timerEnabled', value);
}
