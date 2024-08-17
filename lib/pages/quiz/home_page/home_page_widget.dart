import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/learning_outcome/learning_outcome_widget.dart';
import '/payment/skill_gapanalysis/skill_gapanalysis_widget.dart';
import '/payment/subscription/subscription_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/admob_util.dart' as admob;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home_page'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_Home_page_ON_INIT_STATE');
      logFirebaseEvent('Home_page_alert_dialog');
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () => FocusScope.of(dialogContext).unfocus(),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.75,
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: SkillGapanalysisWidget(),
              ),
            ),
          );
        },
      );

      logFirebaseEvent('Home_page_backend_call');
      _model.user = await GetUserCall.call(
        userId: currentUserUid,
      );

      if ((_model.user?.succeeded ?? true)) {
        logFirebaseEvent('Home_page_update_app_state');
        FFAppState().lives = GetUserCall.lives(
          (_model.user?.jsonBody ?? ''),
        )!;
        FFAppState().plan = valueOrDefault<String>(
          GetUserCall.plan(
            (_model.user?.jsonBody ?? ''),
          ),
          'Free',
        );
        FFAppState().timerEnabled = GetUserCall.timerEnabled(
          (_model.user?.jsonBody ?? ''),
        )!;
        FFAppState().batchId = 0;
        FFAppState().update(() {});
        if ((GetUserCall.lives(
                  (_model.user?.jsonBody ?? ''),
                ) ==
                0) &&
            (GetUserCall.plan(
                  (_model.user?.jsonBody ?? ''),
                ) ==
                'Free')) {
          logFirebaseEvent('Home_page_alert_dialog');
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: GestureDetector(
                  onTap: () => FocusScope.of(dialogContext).unfocus(),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    child: SubscriptionWidget(),
                  ),
                ),
              );
            },
          );
        }
      }
      logFirebaseEvent('Home_page_custom_action');
      unawaited(
        () async {
          await actions.signInOneSignal(
            currentUserUid,
          );
        }(),
      );
      logFirebaseEvent('Home_page_ad_mob');
      unawaited(
        () async {
          admob.loadInterstitialAd(
            "ca-app-pub-3654537783104507/3025849782",
            "ca-app-pub-3654537783104507/7156666489",
            false,
          );
        }(),
      );
      logFirebaseEvent('Home_page_backend_call');
      _model.scorer = await GetHighestScorerCall.call(
        uid: currentUserUid,
      );

      if (GetHighestScorerCall.isHighest(
        (_model.scorer?.jsonBody ?? ''),
      )!) {
        logFirebaseEvent('Home_page_navigate_to');

        context.pushNamed('Congrats_challenge');
      }
      logFirebaseEvent('Home_page_custom_action');
      await actions.inAppReview(
        context,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => FutureBuilder<List<AppUsersRow>>(
        future: AppUsersTable().querySingleRow(
          queryFn: (q) => q.eq(
            'id',
            currentUserUid,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Center(
                child: SizedBox(
                  width: 45.0,
                  height: 45.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),
            );
          }
          List<AppUsersRow> homePageAppUsersRowList = snapshot.data!;

          final homePageAppUsersRow = homePageAppUsersRowList.isNotEmpty
              ? homePageAppUsersRowList.first
              : null;

          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('HOME_PAGE_PAGE_Column_qh6dyalm_ON_TAP');
                      logFirebaseEvent('Column_custom_action');
                      await actions.inAppReview(
                        context,
                      );
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 5.0, 15.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Welcome ${loggedIn ? homePageAppUsersRow?.fullName : 'Guest'}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Recolta Alt',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'qyf1tfck' /* What skill will you like to ch... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Recolta Alt',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray600,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 2.0)),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  offset: Offset(
                                    0.0,
                                    0.0,
                                  ),
                                )
                              ],
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (loggedIn)
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              FFIcons.kbolt,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                              size: 24.0,
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                homePageAppUsersRow?.streaks
                                                    ?.toString(),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Recolta Alt',
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.coins,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .successText,
                                              size: 24.0,
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                homePageAppUsersRow?.coins
                                                    ?.toString(),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Recolta Alt',
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.favorite_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              size: 24.0,
                                            ),
                                            Builder(
                                              builder: (context) {
                                                if (homePageAppUsersRow?.plan ==
                                                    'Free') {
                                                  return Text(
                                                    valueOrDefault<String>(
                                                      homePageAppUsersRow?.lives
                                                          ?.toString(),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Recolta Alt',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                  );
                                                } else {
                                                  return FaIcon(
                                                    FontAwesomeIcons.infinity,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  );
                                                }
                                              },
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '44uilx37' /* Skill Check! */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Recolta Alt',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'cqc8jwko' /* Soft skills are general traits... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Recolta Alt',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                          FutureBuilder<List<LessonsRow>>(
                            future: LessonsTable().queryRows(
                              queryFn: (q) => q
                                  .eq(
                                    'isLive',
                                    true,
                                  )
                                  .order('index', ascending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 45.0,
                                    height: 45.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<LessonsRow> allCoursesLessonsRowList =
                                  snapshot.data!;

                              return SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      allCoursesLessonsRowList.length,
                                      (allCoursesIndex) {
                                    final allCoursesLessonsRow =
                                        allCoursesLessonsRowList[
                                            allCoursesIndex];
                                    return SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Container(
                                                  width: 110.0,
                                                  decoration: BoxDecoration(
                                                    color: colorFromCssString(
                                                      valueOrDefault<String>(
                                                        allCoursesLessonsRow
                                                            .v2Color,
                                                        '#4c80f4',
                                                      ),
                                                      defaultColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2Button,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                allCoursesLessonsRow
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Recolta Alt',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .white,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  allCoursesLessonsRow
                                                                      .description,
                                                                  'Description',
                                                                ),
                                                                maxLines: 3,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Recolta Alt',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .white,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .timelapse_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .white,
                                                                    size: 16.0,
                                                                  ),
                                                                  Text(
                                                                    '${(allCoursesLessonsRow.v2BatchesId.length * 9).toString()}mins',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Recolta Alt',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).white,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                        Builder(
                                                          builder: (context) =>
                                                              InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'HOME_PAGE_PAGE_Icon_v7m7sqkz_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Icon_alert_dialog');
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () =>
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus(),
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.6,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.9,
                                                                        child:
                                                                            LearningOutcomeWidget(
                                                                          lesson:
                                                                              allCoursesLessonsRow,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Icon(
                                                              FFIcons.kbookOpen,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .white,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Visibility(
                                              visible: allCoursesLessonsRow
                                                      .v2BatchesId.length >
                                                  0,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    if (allCoursesLessonsRow
                                                            .v2Batches >=
                                                        2)
                                                      SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            if (allCoursesLessonsRow
                                                                    .v2Batches >
                                                                0)
                                                              custom_widgets
                                                                  .ModuleTile(
                                                                width: 100.0,
                                                                height: 100.0,
                                                                index: 0,
                                                                userId:
                                                                    homePageAppUsersRow
                                                                        ?.id,
                                                                lesson:
                                                                    allCoursesLessonsRow,
                                                                isUnlocked:
                                                                    true,
                                                              ),
                                                            if (allCoursesLessonsRow
                                                                    .v2Batches >
                                                                1)
                                                              custom_widgets
                                                                  .ModuleTile(
                                                                width: 100.0,
                                                                height: 100.0,
                                                                index: 1,
                                                                userId:
                                                                    homePageAppUsersRow
                                                                        ?.id,
                                                                lesson:
                                                                    allCoursesLessonsRow,
                                                                isUnlocked:
                                                                    false,
                                                              ),
                                                          ].divide(SizedBox(
                                                              width: 16.0)),
                                                        ),
                                                      ),
                                                    if (allCoursesLessonsRow
                                                            .v2Batches >
                                                        2)
                                                      SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if (allCoursesLessonsRow
                                                                    .v2Batches >=
                                                                3)
                                                              custom_widgets
                                                                  .ModuleTile(
                                                                width: 100.0,
                                                                height: 100.0,
                                                                index: 2,
                                                                userId:
                                                                    homePageAppUsersRow
                                                                        ?.id,
                                                                lesson:
                                                                    allCoursesLessonsRow,
                                                                isUnlocked:
                                                                    false,
                                                              ),
                                                            if (allCoursesLessonsRow
                                                                    .v2Batches >=
                                                                4)
                                                              custom_widgets
                                                                  .ModuleTile(
                                                                width: 100.0,
                                                                height: 100.0,
                                                                index: 3,
                                                                userId:
                                                                    homePageAppUsersRow
                                                                        ?.id,
                                                                lesson:
                                                                    allCoursesLessonsRow,
                                                                isUnlocked:
                                                                    false,
                                                              ),
                                                            if (allCoursesLessonsRow
                                                                    .v2Batches >=
                                                                5)
                                                              custom_widgets
                                                                  .ModuleTile(
                                                                width: 100.0,
                                                                height: 100.0,
                                                                index: 4,
                                                                userId:
                                                                    homePageAppUsersRow
                                                                        ?.id,
                                                                lesson:
                                                                    allCoursesLessonsRow,
                                                                isUnlocked:
                                                                    false,
                                                              ),
                                                          ].divide(SizedBox(
                                                              width: 16.0)),
                                                        ),
                                                      ),
                                                    if (allCoursesLessonsRow
                                                            .v2Batches >
                                                        5)
                                                      SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if (allCoursesLessonsRow
                                                                    .v2Batches >=
                                                                6)
                                                              custom_widgets
                                                                  .ModuleTile(
                                                                width: 100.0,
                                                                height: 100.0,
                                                                index: 5,
                                                                userId:
                                                                    homePageAppUsersRow
                                                                        ?.id,
                                                                lesson:
                                                                    allCoursesLessonsRow,
                                                                isUnlocked:
                                                                    false,
                                                              ),
                                                            if (allCoursesLessonsRow
                                                                    .v2Batches >=
                                                                7)
                                                              custom_widgets
                                                                  .ModuleTile(
                                                                width: 100.0,
                                                                height: 100.0,
                                                                index: 6,
                                                                userId:
                                                                    homePageAppUsersRow
                                                                        ?.id,
                                                                lesson:
                                                                    allCoursesLessonsRow,
                                                                isUnlocked:
                                                                    false,
                                                              ),
                                                          ].divide(SizedBox(
                                                              width: 16.0)),
                                                        ),
                                                      ),
                                                    SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          custom_widgets
                                                              .BadgeTile(
                                                            width: 100.0,
                                                            height: 100.0,
                                                            userId:
                                                                currentUserUid,
                                                            lesson:
                                                                allCoursesLessonsRow,
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 16.0)),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 12.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0x00FFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 0.0,
                                                              color:
                                                                  colorFromCssString(
                                                                allCoursesLessonsRow
                                                                    .v2Color!,
                                                                defaultColor:
                                                                    Colors
                                                                        .black,
                                                              ),
                                                              offset: Offset(
                                                                0.0,
                                                                3.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Visibility(
                                                          visible:
                                                              allCoursesLessonsRow
                                                                      .v2Batches >
                                                                  0,
                                                          child: Builder(
                                                            builder: (context) =>
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'HOME_certificate-download_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'certificate-download_alert_dialog');
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () =>
                                                                            FocusScope.of(dialogContext).unfocus(),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.75,
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.95,
                                                                          child:
                                                                              SkillGapanalysisWidget(),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              text:
                                                                  'Review Skill Strength',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.45,
                                                                height: 48.0,
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color:
                                                                    colorFromCssString(
                                                                  allCoursesLessonsRow
                                                                      .v2Color!,
                                                                  defaultColor:
                                                                      Colors
                                                                          .black,
                                                                ),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Recolta Alt',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 6.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 24.0)),
                                      ),
                                    );
                                  }).divide(SizedBox(height: 48.0)),
                                ),
                              );
                            },
                          ),
                        ].divide(SizedBox(height: 24.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
