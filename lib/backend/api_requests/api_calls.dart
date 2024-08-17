import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AddAccountCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? fullName = '',
    String? bio = '',
    String? image = '',
    String? type = 'buddy',
    String? location = '',
    String? userId = '',
    String? linkedin = '',
    int? experience,
    String? status = 'Unemployed',
    String? jobTitle = '',
    String? resume = '',
    String? degree = '',
    List<String>? skillsList,
    String? social = '',
    int? fee = 0,
  }) async {
    final skills = _serializeList(skillsList);

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "full_name": "${fullName}",
  "bio": "${bio}",
  "image": "${image}",
  "type": "${type}",
  "location": "${location}",
  "userId": "${userId}",
  "linkedin": "${linkedin}",
  "experience": ${experience},
  "status": "${status}",
  "job_title": "${jobTitle}",
  "resume": "${resume}",
  "degree": "${degree}",
  "skills": ${skills},
  "social": "${social}",
  "fee": ${fee}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addAccount',
      apiUrl: 'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/newPaddy',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class IndexUserCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? fullName = '',
    String? bio = '',
    String? image = '',
    String? type = 'buddy',
    String? location = '',
    String? userId = '',
    String? linkedin = '',
    int? experience,
    String? status = 'Unemployed',
    String? jobTitle = '',
    String? resume = '',
    String? degree = '',
    List<String>? skillsList,
    String? social = '',
    int? fee = 0,
  }) async {
    final skills = _serializeList(skillsList);

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "full_name": "${fullName}",
  "bio": "${bio}",
  "image": "${image}",
  "type": "${type}",
  "location": "${location}",
  "id": "${userId}",
  "linkedin": "${linkedin}",
  "experience": ${experience},
  "status": "${status}",
  "job_title": "${jobTitle}",
  "resume": "${resume}",
  "degree": "${degree}",
  "skills": ${skills},
  "social": "${social}",
  "fee": ${fee},
  "objectID": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'indexUser',
      apiUrl: 'https://M0ITHO7B3R.algolia.net/1/indexes/users',
      callType: ApiCallType.POST,
      headers: {
        'X-Algolia-Application-Id': 'M0ITHO7B3R',
        'X-Algolia-API-Key': '6d930ec00945358e5e8c960ef332d789',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RequestBookingCall {
  static Future<ApiCallResponse> call({
    String? buddyId = '',
    String? paddyId = '',
    String? day = '',
    String? summary = '',
    String? time = '',
  }) async {
    final ffApiRequestBody = '''
{
  "buddy_id": "${buddyId}",
  "paddy_id": "${paddyId}",
  "time": "${time}",
  "summary": "${summary}",
"day": "${day}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'requestBooking',
      apiUrl: 'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/book',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class RescheduleBookingCall {
  static Future<ApiCallResponse> call({
    String? buddyId = '',
    String? paddyId = '',
    String? time = '',
    String? bookingId = '',
    String? day = '',
    String? meetingLink = '',
    bool? isNotification,
  }) async {
    final ffApiRequestBody = '''
{
  "buddy_id": "${buddyId}",
  "paddy_id": "${paddyId}",
  "time": "${time}",
  "day": "${day}",
  "booking_id": "${bookingId}",
  "meeting_link": "${meetingLink}",
  "isNotification": ${isNotification}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'rescheduleBooking',
      apiUrl:
          'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/updateBooking',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class DeactivateAccountCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deactivateAccount',
      apiUrl: 'https://xxj3xp-3000.csb.app/deactivate',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DecideBookingCall {
  static Future<ApiCallResponse> call({
    String? decision = '',
    int? notificationId,
  }) async {
    final ffApiRequestBody = '''
{
  "decision": "${decision}",
  "notification_id": ${notificationId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'decideBooking',
      apiUrl:
          'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/decideBooking',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBookingCall {
  static Future<ApiCallResponse> call({
    String? buddyId = '',
    String? paddyId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "buddy_id": "${buddyId}",
  "paddy_id": "${paddyId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getBooking',
      apiUrl:
          'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/getBooking',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? buddy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.buddy''',
      ));
  static String? paddy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.paddy''',
      ));
  static String? time(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.time''',
      ));
  static String? summary(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.summary''',
      ));
  static bool? isCompleted(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.is_completed''',
      ));
  static bool? paddyJoined(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.has_paddy_joined''',
      ));
  static bool? buddyJoined(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.has_buddy_joined''',
      ));
  static bool? hasPaid(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.has_paid''',
      ));
}

class GetChatCall {
  static Future<ApiCallResponse> call({
    String? buddy = '',
    String? paddy = '',
  }) async {
    final ffApiRequestBody = '''
{
  "buddy": "${buddy}",
  "paddy": "${paddy}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getChat',
      apiUrl: 'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/getChat',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? buddy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.buddy''',
      ));
  static String? paddy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.paddy''',
      ));
  static String? chatId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chat_id''',
      ));
  static String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.created_at''',
      ));
  static String? buddyName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.buddy_name''',
      ));
  static String? paddyName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.paddy_name''',
      ));
  static bool? exists(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.exists''',
      ));
}

class AddChatCall {
  static Future<ApiCallResponse> call({
    String? buddy = '',
    String? paddy = '',
  }) async {
    final ffApiRequestBody = '''
{
  "buddy": "${buddy}",
  "paddy": "${paddy}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addChat',
      apiUrl: 'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/addChat',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? buddy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.buddy''',
      ));
  static String? paddy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.paddy''',
      ));
  static String? chatId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chat_id''',
      ));
  static dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  static dynamic buddyName(dynamic response) => getJsonField(
        response,
        r'''$.buddy_name''',
      );
  static dynamic paddyName(dynamic response) => getJsonField(
        response,
        r'''$.paddy_name''',
      );
  static dynamic exists(dynamic response) => getJsonField(
        response,
        r'''$.exists''',
      );
}

class GetUserCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getUser',
      apiUrl: 'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/getUser',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? streaks(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.streaks''',
      ));
  static int? trophies(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.trophies''',
      ));
  static int? lives(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.lives''',
      ));
  static String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.type''',
      ));
  static String? location(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.location''',
      ));
  static String? bio(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bio''',
      ));
  static String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.full_name''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  static int? learningPoints(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.learning_points''',
      ));
  static String? plan(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.plan''',
      ));
  static bool? timerEnabled(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.timerEnabled''',
      ));
}

class PaystackCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
    String? email = '',
    int? amount,
  }) async {
    final ffApiRequestBody = '''
{
  "uid": "${uid}",
  "email": "${email}",
  "amount": ${amount}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'paystack',
      apiUrl: 'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/paystack',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? link(dynamic response) => getJsonField(
        response,
        r'''$.link''',
      );
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? accessCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.link.access_code''',
      ));
  static String? ref(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.link.reference''',
      ));
  static String? authorizationUrl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.link.authorization_url''',
      ));
}

class GetBanksCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBanks',
      apiUrl: 'https://api.paystack.co/bank',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk_live_54d418da9907ee06e9c1b169e9a0ddf8449d068e',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List? id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?;
  static List? name(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?;
  static List? slug(dynamic response) => getJsonField(
        response,
        r'''$.data[:].slug''',
        true,
      ) as List?;
  static List? code(dynamic response) => getJsonField(
        response,
        r'''$.data[:].code''',
        true,
      ) as List?;
  static List? longcode(dynamic response) => getJsonField(
        response,
        r'''$.data[:].longcode''',
        true,
      ) as List?;
  static List? gateway(dynamic response) => getJsonField(
        response,
        r'''$.data[:].gateway''',
        true,
      ) as List?;
  static List? active(dynamic response) => getJsonField(
        response,
        r'''$.data[:].active''',
        true,
      ) as List?;
}

class VerifyBankAccountCall {
  static Future<ApiCallResponse> call({
    String? acctNum = '',
    String? bankCode = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'verifyBankAccount',
      apiUrl: 'https://api.paystack.co/bank/resolve',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk_live_54d418da9907ee06e9c1b169e9a0ddf8449d068e',
        'Content-Type': 'application/json',
      },
      params: {
        'account_number': acctNum,
        'bank_code': bankCode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? accountName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.account_name''',
      ));
}

class AnswerQuestionCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    bool? isCorrect = true,
    String? questionId = '',
    String? lessonId = '',
    int? batchId,
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "isCorrect": ${isCorrect},
  "question_id": "${questionId}",
  "lesson_id": "${lessonId}",
  "batch_id": ${batchId} 
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'answerQuestion',
      apiUrl:
          'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/answerQuestion',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StreakCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'streak',
      apiUrl: 'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/streak',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? days(dynamic response) => (getJsonField(
        response,
        r'''$.streakDays''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static bool? isNew(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.isNew''',
      ));
  static int? streaks(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.newStreak''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class CompleteQuestionCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    int? learningPoints,
    int? batchId,
    String? lessonId = '',
    String? lessonName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "learning_points": ${learningPoints},
  "batch_id": ${batchId},
  "lesson_id": "${lessonId}",
  "lesson_name": "${lessonName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'completeQuestion',
      apiUrl: 'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/complete',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GenerateCertificateCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generateCertificate',
      apiUrl: 'https://xxj3xp-3000.csb.app/certificate',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.url''',
      );
}

class WithdrawPointsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    int? amount,
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "amount": ${amount}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'withdrawPoints',
      apiUrl: 'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/withdraw',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
}

class SendEmailCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? message = '',
    String? text = '',
    String? paddyName = '',
    int? noSessions,
    int? sessionsAttended,
    String? paddyImprovement = '',
    String? improvement = '',
    String? servicesRendered = '',
    String? paddyServicesRendered = '',
    String? buddyName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "message": "${message}",
  "text": "${text}",
  "paddyName": "${paddyName}",
  "no_sessions": ${noSessions},
  "sessions_attached": ${sessionsAttended},
  "paddy_improvement": "${paddyImprovement}",
  "improvement": "${improvement}",
  "services_rendered": "${servicesRendered}",
  "paddy_services_rendered": ${paddyServicesRendered},
  "buddyName": "<buddy_name>"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendEmail',
      apiUrl: 'https://xxj3xp-3000.csb.app/send-email',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
}

class AlgoliaSearchCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    int? hitsPerPage = 2,
    int? getRankingInfo = 1,
    String? type = 'facetFilters=type:paddy',
  }) async {
    final ffApiRequestBody = '''
{
  "params": "${type}",
  "query": "${name}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'algoliaSearch',
      apiUrl: 'https://M0ITHO7B3R-dsn.algolia.net/1/indexes/users/query',
      callType: ApiCallType.POST,
      headers: {
        'X-Algolia-API-Key': '8bba8c4975a241fa871a038e9ff75f02',
        'X-Algolia-Application-Id': 'M0ITHO7B3R',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? hits(dynamic response) => getJsonField(
        response,
        r'''$.hits''',
        true,
      ) as List?;
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[:].email''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[:].full_name''',
      ));
  static String? bio(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[:].bio''',
      ));
  static String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[:].image''',
      ));
  static String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[:].type''',
      ));
  static String? location(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[:].location''',
      ));
  static dynamic userId(dynamic response) => getJsonField(
        response,
        r'''$.hits[:].userId''',
      );
}

class GetPreviousProgressCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    int? questionId,
    String? lessonId = '',
    int? batch,
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "batch": ${batch},
  "lesson_id": "${lessonId}",
  "question_id": ${questionId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getPreviousProgress',
      apiUrl:
          'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/getQuestions',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? questions(dynamic response) => getJsonField(
        response,
        r'''$.questions''',
        true,
      ) as List?;
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.questions[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$.questions[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? question(dynamic response) => (getJsonField(
        response,
        r'''$.questions[:].question''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lessonId(dynamic response) => (getJsonField(
        response,
        r'''$.questions[:].lesson_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? batchId(dynamic response) => (getJsonField(
        response,
        r'''$.questions[:].batch_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? questionBatchId(dynamic response) => (getJsonField(
        response,
        r'''$.questions[:].question_batch_ten''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? questionIds(dynamic response) => (getJsonField(
        response,
        r'''$.question_ids''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static int? questionlength(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.question_count''',
      ));
  static bool? isContinue(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.isContinue''',
      ));
}

class SendRegistrationEmailCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    bool? isPaddy,
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "isPaddy": ${isPaddy}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendRegistrationEmail',
      apiUrl: 'https://xxj3xp-3000.csb.app/new-user-email',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCompletedCoursesCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getCompletedCourses',
      apiUrl:
          'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/getCompleted',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static bool? completed(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.completed''',
      ));
}

class DeleteNotificationCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    int? notificationId,
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "notification_id": ${notificationId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteNotification',
      apiUrl:
          'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/deleteNotification',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DuplicateQuestionsCall {
  static Future<ApiCallResponse> call({
    String? lessonId = '',
    int? questionBatchesTen,
  }) async {
    final ffApiRequestBody = '''
{
  "lesson_id": "${lessonId}",
  "question_batches_ten": ${questionBatchesTen}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'duplicateQuestions',
      apiUrl: 'https://xxj3xp-3000.csb.app/duplicate-questions',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendChatNotificationCall {
  static Future<ApiCallResponse> call({
    String? text = '',
    String? chatId = '',
    String? senderUid = '',
    String? buddy = '',
    String? paddy = '',
  }) async {
    final ffApiRequestBody = '''
{
  "text": "${text}",
  "chat_id": "${chatId}",
  "senderUid": "${senderUid}",
  "buddy": "${buddy}",
  "paddy": "${paddy}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendChatNotification',
      apiUrl:
          'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/chatNotification',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendBookingEmailCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? buddy = '',
    String? paddy = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "buddy": "${buddy}",
  "paddy": "${paddy}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendBookingEmail',
      apiUrl: 'https://xxj3xp-3000.csb.app/send-booking-email',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuddyInternshipCheckCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'buddyInternshipCheck',
      apiUrl: 'https://xxj3xp-3000.csb.app/check-internship',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SavePaystackRecipientCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? accountNumber = '',
    String? bankCode = '',
    String? name = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "user_id": "${userId}",
  "account_number": "${accountNumber}",
  "bank_code": "${bankCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'savePaystackRecipient',
      apiUrl:
          'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/saveRecipient',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AdRewardCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'adReward',
      apiUrl: 'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/adBonus',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetLeadersCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLeaders',
      apiUrl:
          'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/getLeaders',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? fullName(dynamic response) => (getJsonField(
        response,
        r'''$[:].full_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? email(dynamic response) => (getJsonField(
        response,
        r'''$[:].email''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? learningPoints(dynamic response) => (getJsonField(
        response,
        r'''$[:].learning_points''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? image(dynamic response) => getJsonField(
        response,
        r'''$[:].image''',
        true,
      ) as List?;
  static List<int>? coins(dynamic response) => (getJsonField(
        response,
        r'''$[:].coins''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetModuleQuestionsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? lessonId = '',
    int? batchId,
    int? index,
    bool? isLast,
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "lessonId": "${lessonId}",
  "batchId": ${batchId},
  "index": ${index},
  "isLast": ${isLast}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getModuleQuestions',
      apiUrl:
          'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/getModuleQuestions',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CompleteModuleQuestionCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? lessonId = '',
    int? batchId,
    int? points,
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "batchId": ${batchId},
  "lessonId": "${lessonId}",
  "points": ${points}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'completeModuleQuestion',
      apiUrl:
          'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/completedModuleQuestion',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? isMore(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.isMore''',
      ));
}

class DownloadSkillReportCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'downloadSkillReport',
      apiUrl: 'https://careerpaddy-api.onrender.com',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DownloadBadgeCall {
  static Future<ApiCallResponse> call({
    String? lessonId = '',
    String? courseName = '',
    String? uid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "lessonId": "${lessonId}",
  "courseName": "${courseName}",
  "uid": "${uid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'downloadBadge',
      apiUrl: 'https://careerpaddy-fa3c40d58b6d.herokuapp.com/badge',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class DownloadSkillGapReportCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "uid": "${uid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'downloadSkillGapReport',
      apiUrl: 'https://careerpaddy-fa3c40d58b6d.herokuapp.com/skill-gap',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetModuleInfoCall {
  static Future<ApiCallResponse> call({
    String? lessonId = '',
    String? batchId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "batchId": "${batchId}",
  "lessonId": "${lessonId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getModuleInfo',
      apiUrl:
          'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/getModuleInfo',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  static bool? isScenario(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.isScenario''',
      ));
}

class GetHighestScorerCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "uid": "${uid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getHighestScorer',
      apiUrl:
          'https://jdqxspwzxxrzubegqrgn.supabase.co/functions/v1/getHighestScorer',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? isHighest(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.isHighest''',
      ));
}

class PaymentSuccessCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "uid": "${uid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'paymentSuccess',
      apiUrl: 'https://careerpaddy-fa3c40d58b6d.herokuapp.com/payment',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
