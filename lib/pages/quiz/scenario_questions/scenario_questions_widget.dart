import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/quiz/answer_correct/answer_correct_widget.dart';
import '/pages/quiz/out_of_live/out_of_live_widget.dart';
import '/pages/quiz/scenario_options/scenario_options_widget.dart';
import '/pages/quiz/scenarios/scenarios_widget.dart';
import '/pages/quiz/well_done_1/well_done1_widget.dart';
import '/pages/search/incorrect_answer/incorrect_answer_widget.dart';
import '/payment/subscription/subscription_widget.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'scenario_questions_model.dart';
export 'scenario_questions_model.dart';

class ScenarioQuestionsWidget extends StatefulWidget {
  const ScenarioQuestionsWidget({
    super.key,
    required this.batch,
    required this.lesson,
    required this.randomIds,
    required this.batchIndex,
  });

  final int? batch;
  final LessonsRow? lesson;
  final List<int>? randomIds;
  final int? batchIndex;

  @override
  State<ScenarioQuestionsWidget> createState() =>
      _ScenarioQuestionsWidgetState();
}

class _ScenarioQuestionsWidgetState extends State<ScenarioQuestionsWidget> {
  late ScenarioQuestionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScenarioQuestionsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Scenario_questions'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SCENARIO_QUESTIONS_Scenario_questions_ON');
      if (FFAppState().hasShownScenario == false) {
        logFirebaseEvent('Scenario_questions_alert_dialog');
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
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: ScenariosWidget(),
                ),
              ),
            );
          },
        );
      }
      logFirebaseEvent('Scenario_questions_update_app_state');
      FFAppState().option = OptionStruct();
      FFAppState().batchId = widget!.batch!;
      setState(() {});
      logFirebaseEvent('Scenario_questions_start_periodic_action');
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          logFirebaseEvent('Scenario_questions_update_app_state');
          FFAppState().timer = FFAppState().timer + 1;
          setState(() {});
          if (FFAppState().timer ==
              (() {
                    if (widget!.batchIndex == 0) {
                      return 600;
                    } else if (widget!.batchIndex == 1) {
                      return 300;
                    } else {
                      return 240;
                    }
                  }() -
                  10)) {
            logFirebaseEvent('Scenario_questions_play_sound');
            _model.soundPlayer1 ??= AudioPlayer();
            if (_model.soundPlayer1!.playing) {
              await _model.soundPlayer1!.stop();
            }
            _model.soundPlayer1!.setVolume(1.0);
            _model.soundPlayer1!
                .setAsset('assets/audios/time_up.mp3')
                .then((_) => _model.soundPlayer1!.play());
          }
        },
        startImmediately: true,
      );
    });

    _model.switchValue = FFAppState().timerEnabled;
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
          List<AppUsersRow> scenarioQuestionsAppUsersRowList = snapshot.data!;

          final scenarioQuestionsAppUsersRow =
              scenarioQuestionsAppUsersRowList.isNotEmpty
                  ? scenarioQuestionsAppUsersRowList.first
                  : null;

          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 56.0, 20.0, 56.0),
                child: FutureBuilder<List<QuestionsRow>>(
                  future: QuestionsTable().querySingleRow(
                    queryFn: (q) => q.eq(
                      'id',
                      widget!.randomIds?[
                          _model.index >= (widget!.randomIds!.length - 1)
                              ? (widget!.randomIds!.length - 1)
                              : _model.index],
                    ),
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
                    List<QuestionsRow> columnQuestionsRowList = snapshot.data!;

                    final columnQuestionsRow = columnQuestionsRowList.isNotEmpty
                        ? columnQuestionsRowList.first
                        : null;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SCENARIO_QUESTIONS_Icon_7fowlqf2_ON_TAP');
                                logFirebaseEvent('Icon_update_app_state');
                                FFAppState().failedQuestions = [];
                                setState(() {});
                                logFirebaseEvent('Icon_navigate_to');

                                context.goNamed('Home_page');
                              },
                              child: Icon(
                                Icons.close_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 32.0,
                              ),
                            ),
                            LinearPercentIndicator(
                              percent: (int index, int total) {
                                return (index / total) > 1
                                    ? 1.0
                                    : (index / total);
                              }(_model.index, widget!.randomIds!.length),
                              width: MediaQuery.sizeOf(context).width * 0.6,
                              lineHeight: 12.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).primary,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).gray100,
                              barRadius: Radius.circular(8.0),
                              padding: EdgeInsets.zero,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.favorite_rounded,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                                Builder(
                                  builder: (context) {
                                    if (scenarioQuestionsAppUsersRow?.plan ==
                                        'Free') {
                                      return Text(
                                        FFAppState().lives.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Recolta Alt',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                      );
                                    } else {
                                      return FaIcon(
                                        FontAwesomeIcons.infinity,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      );
                                    }
                                  },
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ].divide(SizedBox(width: 16.0)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray200,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 4.0, 8.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (FFAppState().timerEnabled)
                                  Icon(
                                    Icons.timer_rounded,
                                    color: FlutterFlowTheme.of(context).gray700,
                                    size: 24.0,
                                  ),
                                if (FFAppState().timerEnabled)
                                  custom_widgets.CountDown(
                                    width: 50.0,
                                    height: 20.0,
                                    seconds: () {
                                      if (widget!.batchIndex == 0) {
                                        return 600;
                                      } else if (widget!.batchIndex == 1) {
                                        return 300;
                                      } else if (widget!.batchIndex == 2) {
                                        return 240;
                                      } else {
                                        return 240;
                                      }
                                    }(),
                                    fontSize: 14.0,
                                    batchId: widget!.batch!.toString(),
                                  ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.1,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.06,
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) => Switch.adaptive(
                                      value: _model.switchValue!,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.switchValue = newValue!);
                                        if (newValue!) {
                                          logFirebaseEvent(
                                              'SCENARIO_QUESTIONS_Switch_g1cusapc_ON_TO');
                                          logFirebaseEvent(
                                              'Switch_update_app_state');
                                          FFAppState().timerEnabled = true;
                                          setState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'SCENARIO_QUESTIONS_Switch_g1cusapc_ON_TO');
                                          if (scenarioQuestionsAppUsersRow
                                                  ?.plan ==
                                              'Free') {
                                            logFirebaseEvent(
                                                'Switch_set_form_field');
                                            setState(() {
                                              _model.switchValue = true;
                                            });
                                            logFirebaseEvent(
                                                'Switch_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () => FocusScope.of(
                                                            dialogContext)
                                                        .unfocus(),
                                                    child: Container(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.7,
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.9,
                                                      child:
                                                          SubscriptionWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          } else {
                                            logFirebaseEvent(
                                                'Switch_update_app_state');
                                            FFAppState().timerEnabled = false;
                                            setState(() {});
                                            logFirebaseEvent(
                                                'Switch_backend_call');
                                            await AppUsersTable().update(
                                              data: {
                                                'timerEnabled': false,
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                currentUserUid,
                                              ),
                                            );
                                          }
                                        }
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).primary,
                                      inactiveTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      inactiveThumbColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ),
                        ),
                        if (_model.index < widget!.randomIds!.length)
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 16.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget!.lesson?.name,
                                              'Active Listening',
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Recolta Alt',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .gray900,
                                                  fontSize: 19.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 4.0, 8.0, 4.0),
                                        child: Text(
                                          'Q ${(_model.nextIndex + (widget!.randomIds!.length * ((widget!.batchIndex!) - 1))).toString()} - [Q ${((widget!.batchIndex!) * widget!.randomIds!.length).toString()}]',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Recolta Alt',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      if (columnQuestionsRow?.scenario !=
                                              null &&
                                          columnQuestionsRow?.scenario != '')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'we9drll5' /* Scenario */,
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Recolta Alt',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .gray900,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      if (columnQuestionsRow?.scenario !=
                                              null &&
                                          columnQuestionsRow?.scenario != '')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              columnQuestionsRow?.scenario,
                                              'Ola (A young and eager marketing associate.) and Tunde ( A seasoned and respected marketing manager.)   are standing in line at the office coffee machine. Tunde turns to Ola and starts talking about a recent industry trend.',
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Recolta Alt',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: colorFromCssString(
                                            widget!.lesson!.v2SmallBackground!,
                                            defaultColor: Colors.black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                  if (columnQuestionsRow?.dialogue != null &&
                                      columnQuestionsRow?.dialogue != '')
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/Female.png',
                                            width: 24.0,
                                            height: 24.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '233ktxkd' /* Dialogue */,
                                                ),
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Recolta Alt',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .gray900,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Container(
                                                width: 285.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .gray100,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(2.0),
                                                    bottomRight:
                                                        Radius.circular(12.0),
                                                    topLeft:
                                                        Radius.circular(12.0),
                                                    topRight:
                                                        Radius.circular(12.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      columnQuestionsRow
                                                          ?.dialogue,
                                                      'Dialogue',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Recolta Alt',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  if (columnQuestionsRow?.question != null &&
                                      columnQuestionsRow?.question != '')
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/Female.png',
                                            width: 24.0,
                                            height: 24.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5wyza02v' /* Question */,
                                                ),
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Recolta Alt',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .gray900,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Container(
                                                width: 285.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .gray100,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x15101828),
                                                      offset: Offset(
                                                        0.0,
                                                        4.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(2.0),
                                                    bottomRight:
                                                        Radius.circular(12.0),
                                                    topLeft:
                                                        Radius.circular(12.0),
                                                    topRight:
                                                        Radius.circular(12.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      columnQuestionsRow
                                                          ?.question,
                                                      'Question',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Recolta Alt',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  if (FFAppState().option.name == null ||
                                      FFAppState().option.name == '')
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ml571dkc' /* Tap to see options */,
                                                ),
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Recolta Alt',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .gray900,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Builder(
                                                builder: (context) => InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'SCENARIO_QUESTIONS_Container_ypgm7rax_ON');
                                                    logFirebaseEvent(
                                                        'Container_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus(),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.9,
                                                              child:
                                                                  ScenarioOptionsWidget(
                                                                question:
                                                                    columnQuestionsRow!,
                                                                lesson: widget!
                                                                    .lesson!,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 285.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFB1D8FF),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                2.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          's08kwgvr' /* Tap to see options */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Recolta Alt',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/Male_(1).png',
                                            width: 24.0,
                                            height: 24.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  if (FFAppState().option.name != null &&
                                      FFAppState().option.name != '')
                                    Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SCENARIO_QUESTIONS_Row_9ypg439v_ON_TAP');
                                          logFirebaseEvent('Row_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () => FocusScope.of(
                                                          dialogContext)
                                                      .unfocus(),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    child:
                                                        ScenarioOptionsWidget(
                                                      question:
                                                          columnQuestionsRow!,
                                                      lesson: widget!.lesson!,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'a86py8wb' /* Your answer */,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Recolta Alt',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gray900,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.7,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFB1D8FF),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                2.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        FFAppState().option !=
                                                                null
                                                            ? FFAppState()
                                                                .option
                                                                .name
                                                            : 'This is the answer to the scenario question asked',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Recolta Alt',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .black,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'few2bw2h' /* Tap to change answer */,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Recolta Alt',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gray500,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Male_(1).png',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        Container(
                          width: double.infinity,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0.0,
                                color: Color(0xFF0B61CB),
                                offset: Offset(
                                  0.0,
                                  3.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Builder(
                            builder: (context) => FFButtonWidget(
                              onPressed: (FFAppState().option.name == null ||
                                      FFAppState().option.name == '')
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'SCENARIO_QUESTIONS_CHECK_ANSWER_BTN_ON_T');
                                      var _shouldSetState = false;
                                      if ((scenarioQuestionsAppUsersRow!.lives <
                                              1) &&
                                          (scenarioQuestionsAppUsersRow?.plan ==
                                              'Free')) {
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(dialogContext)
                                                        .unfocus(),
                                                child: Container(
                                                  height: 500.0,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.9,
                                                  child: OutOfLiveWidget(
                                                    user:
                                                        scenarioQuestionsAppUsersRow!,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        if (!(FFAppState().option != null)) {
                                          logFirebaseEvent(
                                              'Button_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'You need to select an option',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          );
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                        if (_model.nextIndex >
                                            (widget!.randomIds!.length - 1)) {
                                          if (FFAppState().option.isCorrect) {
                                            logFirebaseEvent(
                                                'Button_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              isDismissible: false,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () =>
                                                      FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: 300.0,
                                                      child:
                                                          AnswerCorrectWidget(
                                                        questionCount: widget!
                                                            .randomIds!.length,
                                                        points:
                                                            FFAppState().points,
                                                        lessonName: widget!
                                                            .lesson!.name,
                                                        batchId: widget!.batch!,
                                                        user:
                                                            scenarioQuestionsAppUsersRow!,
                                                        lesson: widget!.lesson!,
                                                        index: _model.index,
                                                        manualOption:
                                                            FFAppState().option,
                                                        batchindex:
                                                            widget!.batchIndex!,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          } else {
                                            logFirebaseEvent(
                                                'Button_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              isDismissible: false,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () =>
                                                      FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: 300.0,
                                                      child:
                                                          IncorrectAnswerWidget(
                                                        index: _model.index,
                                                        questionCount: widget!
                                                            .randomIds!.length,
                                                        points:
                                                            FFAppState().points,
                                                        lessonName: widget!
                                                            .lesson!.name,
                                                        question:
                                                            columnQuestionsRow!
                                                                .question,
                                                        batchId: widget!.batch!,
                                                        user:
                                                            scenarioQuestionsAppUsersRow!,
                                                        lesson: widget!.lesson!,
                                                        manualOption:
                                                            FFAppState().option,
                                                        batchIndex:
                                                            widget!.batchIndex!,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }

                                          logFirebaseEvent(
                                              'Button_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () => FocusScope.of(
                                                          dialogContext)
                                                      .unfocus(),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    child: WellDone1Widget(
                                                      user:
                                                          scenarioQuestionsAppUsersRow!,
                                                      completedIndex: (widget!
                                                              .batchIndex!) +
                                                          1,
                                                      batchId: widget!.batch!,
                                                      lesson: widget!.lesson!,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );

                                          if (_shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          logFirebaseEvent(
                                              'Button_update_page_state');
                                          _model.index = _model.index + 1;
                                          _model.nextIndex =
                                              _model.nextIndex + 1;
                                          setState(() {});
                                        }

                                        if (FFAppState().option.isCorrect) {
                                          logFirebaseEvent('Button_play_sound');
                                          _model.soundPlayer2 ??= AudioPlayer();
                                          if (_model.soundPlayer2!.playing) {
                                            await _model.soundPlayer2!.stop();
                                          }
                                          _model.soundPlayer2!.setVolume(1.0);
                                          _model.soundPlayer2!
                                              .setAsset(
                                                  'assets/audios/snd_fragment_retrievewav-14728.wav')
                                              .then((_) =>
                                                  _model.soundPlayer2!.play());

                                          if (_model.index >=
                                              (widget!.randomIds!.length - 1)) {
                                            if (_model.index >=
                                                (widget!.randomIds!.length)) {
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Completed ',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                              logFirebaseEvent(
                                                  'Button_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                isDismissible: false,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () =>
                                                        FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: Container(
                                                        height: 300.0,
                                                        child:
                                                            AnswerCorrectWidget(
                                                          questionCount: widget!
                                                              .randomIds!
                                                              .length,
                                                          points: FFAppState()
                                                              .points,
                                                          lessonName: widget!
                                                              .lesson!.name,
                                                          batchId:
                                                              widget!.batch!,
                                                          user:
                                                              scenarioQuestionsAppUsersRow!,
                                                          lesson:
                                                              widget!.lesson!,
                                                          index: _model.index,
                                                          manualOption:
                                                              FFAppState()
                                                                  .option,
                                                          batchindex: widget!
                                                              .batchIndex!,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              logFirebaseEvent(
                                                  'Button_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus(),
                                                      child: WellDone1Widget(
                                                        user:
                                                            scenarioQuestionsAppUsersRow!,
                                                        completedIndex: (widget!
                                                                .batchIndex!) +
                                                            1,
                                                        batchId: widget!.batch!,
                                                        lesson: widget!.lesson!,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );

                                              logFirebaseEvent(
                                                  'Button_update_app_state');
                                              FFAppState().option =
                                                  OptionStruct();
                                              FFAppState().failedQuestions = [];
                                              setState(() {});
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              _model.streakdatas =
                                                  await StreakCall.call(
                                                userId: currentUserUid,
                                              );

                                              _shouldSetState = true;
                                              if (StreakCall.isNew(
                                                (_model.streakdatas?.jsonBody ??
                                                    ''),
                                              )!) {
                                                logFirebaseEvent(
                                                    'Button_navigate_to');

                                                context.pushNamed(
                                                  'Streak_Page',
                                                  queryParameters: {
                                                    'streaks': serializeParam(
                                                      StreakCall.streaks(
                                                        (_model.streakdatas
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                    'days': serializeParam(
                                                      StreakCall.days(
                                                        (_model.streakdatas
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          }
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().points =
                                              FFAppState().points + 1;
                                          setState(() {});
                                          logFirebaseEvent(
                                              'Button_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: Container(
                                                    height: 300.0,
                                                    child: AnswerCorrectWidget(
                                                      index: _model.index,
                                                      questionCount: widget!
                                                          .randomIds!.length,
                                                      points: _model
                                                          .correctQuestions,
                                                      lessonName:
                                                          widget!.lesson!.name,
                                                      batchId: widget!.batch!,
                                                      user:
                                                          scenarioQuestionsAppUsersRow!,
                                                      lesson: widget!.lesson!,
                                                      manualOption:
                                                          FFAppState().option,
                                                      batchindex:
                                                          widget!.batchIndex!,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().option = OptionStruct();
                                          setState(() {});
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          unawaited(
                                            () async {
                                              _model.apiResultrzl =
                                                  await AnswerQuestionCall.call(
                                                isCorrect: true,
                                                userId: currentUserUid,
                                                questionId: columnQuestionsRow
                                                    ?.id
                                                    ?.toString(),
                                                lessonId: widget!.lesson?.id,
                                                batchId: widget!.batch,
                                              );
                                            }(),
                                          );
                                          _shouldSetState = true;
                                        } else {
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().addToFailedQuestions(
                                              widget!.randomIds![_model.index]);
                                          setState(() {});
                                          if (_model.index >=
                                              (widget!.randomIds!.length - 1)) {
                                            if (_model.index >=
                                                (widget!.randomIds!.length)) {
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Completed ',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                              logFirebaseEvent(
                                                  'Button_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                isDismissible: false,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () =>
                                                        FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: Container(
                                                        height: 300.0,
                                                        child:
                                                            IncorrectAnswerWidget(
                                                          index: _model.index,
                                                          questionCount: widget!
                                                              .randomIds!
                                                              .length,
                                                          points: FFAppState()
                                                              .points,
                                                          lessonName: widget!
                                                              .lesson!.name,
                                                          question:
                                                              columnQuestionsRow!
                                                                  .question,
                                                          batchId:
                                                              widget!.batch!,
                                                          user:
                                                              scenarioQuestionsAppUsersRow!,
                                                          lesson:
                                                              widget!.lesson!,
                                                          manualOption:
                                                              FFAppState()
                                                                  .option,
                                                          batchIndex: widget!
                                                              .batchIndex!,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              logFirebaseEvent(
                                                  'Button_update_app_state');
                                              FFAppState().failedQuestions = [];
                                              setState(() {});
                                              logFirebaseEvent(
                                                  'Button_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus(),
                                                      child: WellDone1Widget(
                                                        user:
                                                            scenarioQuestionsAppUsersRow!,
                                                        completedIndex: (widget!
                                                                .batchIndex!) +
                                                            1,
                                                        batchId: widget!.batch!,
                                                        lesson: widget!.lesson!,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );

                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          }
                                          logFirebaseEvent('Button_play_sound');
                                          _model.soundPlayer3 ??= AudioPlayer();
                                          if (_model.soundPlayer3!.playing) {
                                            await _model.soundPlayer3!.stop();
                                          }
                                          _model.soundPlayer3!.setVolume(1.0);
                                          _model.soundPlayer3!
                                              .setAsset(
                                                  'assets/audios/all-processors-164964.mp3')
                                              .then((_) =>
                                                  _model.soundPlayer3!.play());

                                          if (FFAppState()
                                                  .failedQuestions
                                                  .length >=
                                              4) {
                                            logFirebaseEvent(
                                                'Button_alert_dialog');
                                            await showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () => FocusScope.of(
                                                            dialogContext)
                                                        .unfocus(),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.9,
                                                      child: WellDone1Widget(
                                                        user:
                                                            scenarioQuestionsAppUsersRow!,
                                                        completedIndex:
                                                            widget!.batchIndex!,
                                                        batchId: widget!.batch!,
                                                        lesson: widget!.lesson!,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                          if (scenarioQuestionsAppUsersRow
                                                  ?.plan ==
                                              'Free') {
                                            logFirebaseEvent(
                                                'Button_update_app_state');
                                            FFAppState().lives =
                                                FFAppState().lives + -1;
                                            setState(() {});
                                            logFirebaseEvent(
                                                'Button_backend_call');
                                            await AppUsersTable().update(
                                              data: {
                                                'lives': FFAppState().lives,
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                currentUserUid,
                                              ),
                                            );
                                          }
                                          if (_model.index ==
                                              (widget!.randomIds!.length - 1)) {
                                            logFirebaseEvent(
                                                'Button_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () =>
                                                      FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: 300.0,
                                                      child:
                                                          IncorrectAnswerWidget(
                                                        index: _model.index,
                                                        questionCount: widget!
                                                            .randomIds!.length,
                                                        points:
                                                            FFAppState().points,
                                                        lessonName: widget!
                                                            .lesson!.name,
                                                        question:
                                                            columnQuestionsRow!
                                                                .question,
                                                        batchId: widget!.batch!,
                                                        user:
                                                            scenarioQuestionsAppUsersRow!,
                                                        lesson: widget!.lesson!,
                                                        manualOption:
                                                            FFAppState().option,
                                                        batchIndex:
                                                            widget!.batchIndex!,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            logFirebaseEvent(
                                                'Button_update_app_state');
                                            FFAppState().option =
                                                OptionStruct();
                                            setState(() {});
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                          logFirebaseEvent(
                                              'Button_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: Container(
                                                    height: 300.0,
                                                    child:
                                                        IncorrectAnswerWidget(
                                                      index: _model.index,
                                                      questionCount: widget!
                                                          .randomIds!.length,
                                                      points: _model
                                                          .correctQuestions,
                                                      lessonName:
                                                          widget!.lesson!.name,
                                                      question:
                                                          columnQuestionsRow!
                                                              .question,
                                                      batchId: widget!.batch!,
                                                      user:
                                                          scenarioQuestionsAppUsersRow!,
                                                      lesson: widget!.lesson!,
                                                      manualOption:
                                                          FFAppState().option,
                                                      batchIndex:
                                                          widget!.batchIndex!,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().option = OptionStruct();
                                          setState(() {});
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          unawaited(
                                            () async {
                                              _model.apiResult95r =
                                                  await AnswerQuestionCall.call(
                                                userId: currentUserUid,
                                                isCorrect: false,
                                                lessonId: widget!.lesson?.id,
                                                questionId: columnQuestionsRow
                                                    ?.id
                                                    ?.toString(),
                                                batchId: widget!.batch,
                                              );
                                            }(),
                                          );
                                          _shouldSetState = true;
                                        }

                                        if (_model.index >=
                                            (widget!.randomIds!.length - 1)) {
                                          logFirebaseEvent(
                                              'Button_stop_periodic_action');
                                          _model.instantTimer?.cancel();
                                        } else {
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        logFirebaseEvent('Button_backend_call');
                                        unawaited(
                                          () async {
                                            _model.completedBatch =
                                                await CompleteModuleQuestionCall
                                                    .call(
                                              userId: currentUserUid,
                                              lessonId: widget!.lesson?.id,
                                              batchId: widget!.batch,
                                              points: _model.correctQuestions,
                                            );
                                          }(),
                                        );
                                        _shouldSetState = true;
                                        logFirebaseEvent('Button_backend_call');
                                        _model.streak = await StreakCall.call(
                                          userId: currentUserUid,
                                        );

                                        _shouldSetState = true;
                                      }

                                      if (_shouldSetState) setState(() {});
                                    },
                              text: FFLocalizations.of(context).getText(
                                'icygc16i' /* Check answer */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Recolta Alt',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
