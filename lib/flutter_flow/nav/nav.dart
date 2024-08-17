import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : Onboarding3Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : Onboarding3Widget(),
          routes: [
            FFRoute(
              name: 'Splashscreen',
              path: 'splashscreen',
              builder: (context, params) => SplashscreenWidget(),
            ),
            FFRoute(
              name: 'Termsandcondition',
              path: 'termsandcondition',
              builder: (context, params) => TermsandconditionWidget(),
            ),
            FFRoute(
              name: 'forgot_password',
              path: 'forgotPassword',
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: 'Lesson_Complete',
              path: 'lessonComplete',
              builder: (context, params) => LessonCompleteWidget(
                questionCount: params.getParam(
                  'questionCount',
                  ParamType.int,
                ),
                batchId: params.getParam(
                  'batchId',
                  ParamType.int,
                ),
                user: params.getParam<AppUsersRow>(
                  'user',
                  ParamType.SupabaseRow,
                ),
                lesson: params.getParam<LessonsRow>(
                  'lesson',
                  ParamType.SupabaseRow,
                ),
              ),
            ),
            FFRoute(
              name: 'Sign_In_Page',
              path: 'signInPage',
              builder: (context, params) => SignInPageWidget(),
            ),
            FFRoute(
              name: 'BuddyAccount',
              path: 'buddyAccount',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'BuddyAccount')
                  : BuddyAccountWidget(),
            ),
            FFRoute(
              name: 'Buddy_Edit_Profile',
              path: 'buddyEditProfile',
              builder: (context, params) => BuddyEditProfileWidget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                user: params.getParam<AppUsersRow>(
                  'user',
                  ParamType.SupabaseRow,
                ),
              ),
            ),
            FFRoute(
              name: 'PaymentSuccessful',
              path: 'paymentSuccessful',
              builder: (context, params) => PaymentSuccessfulWidget(),
            ),
            FFRoute(
              name: 'Leaderboard',
              path: 'leaderboard',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Leaderboard')
                  : LeaderboardWidget(),
            ),
            FFRoute(
              name: 'Onboarding_3',
              path: 'onboarding3',
              builder: (context, params) => Onboarding3Widget(),
            ),
            FFRoute(
              name: 'Help_Page',
              path: 'helpPage',
              builder: (context, params) => HelpPageWidget(),
            ),
            FFRoute(
              name: 'Get_Started',
              path: 'getStarted',
              builder: (context, params) => GetStartedWidget(),
            ),
            FFRoute(
              name: 'Streak_Page',
              path: 'streakPage',
              builder: (context, params) => StreakPageWidget(
                streaks: params.getParam(
                  'streaks',
                  ParamType.int,
                ),
                days: params.getParam<String>(
                  'days',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'PrivatePolicy',
              path: 'privacyPolicy',
              builder: (context, params) => PrivatePolicyWidget(),
            ),
            FFRoute(
              name: 'Email_Password',
              path: 'emailPassword',
              builder: (context, params) => EmailPasswordWidget(),
            ),
            FFRoute(
              name: 'Employament_status',
              path: 'employamentStatus',
              builder: (context, params) => EmployamentStatusWidget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'ABout_us',
              path: 'aBoutUs',
              builder: (context, params) => ABoutUsWidget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Experience',
              path: 'experience',
              builder: (context, params) => ExperienceWidget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Commitment',
              path: 'commitment',
              builder: (context, params) => CommitmentWidget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Home_page',
              path: 'homePage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Home_page')
                  : HomePageWidget(),
            ),
            FFRoute(
              name: 'Congrats_challenge',
              path: 'congratsChallenge',
              builder: (context, params) => CongratsChallengeWidget(),
            ),
            FFRoute(
              name: 'Scenario_questions',
              path: 'scenarioQuestions',
              builder: (context, params) => ScenarioQuestionsWidget(
                batch: params.getParam(
                  'batch',
                  ParamType.int,
                ),
                lesson: params.getParam<LessonsRow>(
                  'lesson',
                  ParamType.SupabaseRow,
                ),
                randomIds: params.getParam<int>(
                  'randomIds',
                  ParamType.int,
                  isList: true,
                ),
                batchIndex: params.getParam(
                  'batchIndex',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'Name',
              path: 'name',
              builder: (context, params) => NameWidget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Reset_password',
              path: 'resetPassword',
              builder: (context, params) => ResetPasswordWidget(),
            ),
            FFRoute(
              name: 'Comment_1',
              path: 'comment1',
              builder: (context, params) => Comment1Widget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'About_careerpaddy',
              path: 'aboutCareerpaddy',
              builder: (context, params) => AboutCareerpaddyWidget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Quotes',
              path: 'quotes',
              builder: (context, params) => QuotesWidget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Home_pageCopy',
              path: 'homePageCopy',
              builder: (context, params) => HomePageCopyWidget(),
            ),
            FFRoute(
              name: 'Question_timer_page',
              path: 'questionTimerPage',
              builder: (context, params) => QuestionTimerPageWidget(
                lesson: params.getParam<LessonsRow>(
                  'lesson',
                  ParamType.SupabaseRow,
                ),
                batchId: params.getParam(
                  'batchId',
                  ParamType.int,
                ),
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
                isScenario: params.getParam(
                  'isScenario',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'Failed_questions_prompter',
              path: 'failedQuestionsPrompter',
              builder: (context, params) => FailedQuestionsPrompterWidget(
                batch: params.getParam(
                  'batch',
                  ParamType.int,
                ),
                lesson: params.getParam<LessonsRow>(
                  'lesson',
                  ParamType.SupabaseRow,
                ),
                user: params.getParam<AppUsersRow>(
                  'user',
                  ParamType.SupabaseRow,
                ),
                batchId: params.getParam(
                  'batchId',
                  ParamType.int,
                ),
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'Bio',
              path: 'bio',
              builder: (context, params) => BioWidget(),
            ),
            FFRoute(
              name: 'Quiz_1',
              path: 'quiz1',
              builder: (context, params) => Quiz1Widget(
                lesson: params.getParam<LessonsRow>(
                  'lesson',
                  ParamType.SupabaseRow,
                ),
                batchId: params.getParam(
                  'batchId',
                  ParamType.int,
                ),
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
                randomIds: params.getParam<int>(
                  'randomIds',
                  ParamType.int,
                  isList: true,
                ),
                isLastIndex: params.getParam(
                  'isLastIndex',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'Quotes2',
              path: 'quotes2',
              builder: (context, params) => Quotes2Widget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Quotes2Copy',
              path: 'quotes2Copy',
              builder: (context, params) => Quotes2CopyWidget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Quotes6',
              path: 'quotes6',
              builder: (context, params) => Quotes6Widget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Quotes7',
              path: 'quotes7',
              builder: (context, params) => Quotes7Widget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Quotes8',
              path: 'quotes8',
              builder: (context, params) => Quotes8Widget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Quotes3',
              path: 'quotes3',
              builder: (context, params) => Quotes3Widget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Quotes4',
              path: 'quotes4',
              builder: (context, params) => Quotes4Widget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Quotes5',
              path: 'quotes5',
              builder: (context, params) => Quotes5Widget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Quotes9',
              path: 'quotes9',
              builder: (context, params) => Quotes9Widget(
                isEdit: params.getParam(
                  'isEdit',
                  ParamType.bool,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Quiz_2',
              path: 'quiz2',
              builder: (context, params) => Quiz2Widget(
                lesson: params.getParam<LessonsRow>(
                  'lesson',
                  ParamType.SupabaseRow,
                ),
                batchId: params.getParam(
                  'batchId',
                  ParamType.int,
                ),
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
                randomIds: params.getParam<int>(
                  'randomIds',
                  ParamType.int,
                  isList: true,
                ),
                isLastIndex: params.getParam(
                  'isLastIndex',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'Quiz_3',
              path: 'quiz3',
              builder: (context, params) => Quiz3Widget(
                lesson: params.getParam<LessonsRow>(
                  'lesson',
                  ParamType.SupabaseRow,
                ),
                batchId: params.getParam(
                  'batchId',
                  ParamType.int,
                ),
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
                randomIds: params.getParam<int>(
                  'randomIds',
                  ParamType.int,
                  isList: true,
                ),
                isLastIndex: params.getParam(
                  'isLastIndex',
                  ParamType.bool,
                ),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onboarding3';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 45.0,
                    height: 45.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
