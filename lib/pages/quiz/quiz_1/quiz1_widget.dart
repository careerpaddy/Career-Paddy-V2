import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/quiz/answer_correct/answer_correct_widget.dart';
import '/pages/quiz/out_of_live/out_of_live_widget.dart';
import '/pages/search/incorrect_answer/incorrect_answer_widget.dart';
import 'dart:async';
import 'dart:math';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quiz1_model.dart';
export 'quiz1_model.dart';

class Quiz1Widget extends StatefulWidget {
  const Quiz1Widget({
    super.key,
    required this.lesson,
    required this.batchId,
    required this.index,
    required this.randomIds,
    required this.isLastIndex,
  });

  final LessonsRow? lesson;
  final int? batchId;
  final int? index;
  final List<int>? randomIds;
  final bool? isLastIndex;

  @override
  State<Quiz1Widget> createState() => _Quiz1WidgetState();
}

class _Quiz1WidgetState extends State<Quiz1Widget>
    with TickerProviderStateMixin {
  late Quiz1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Quiz1Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Quiz_1'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('QUIZ_1_PAGE_Quiz_1_ON_INIT_STATE');
      logFirebaseEvent('Quiz_1_start_periodic_action');
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {},
        startImmediately: true,
      );
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 100.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 10.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 10.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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

    return FutureBuilder<List<AppUsersRow>>(
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
            backgroundColor: FlutterFlowTheme.of(context).challenge1,
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
        List<AppUsersRow> quiz1AppUsersRowList = snapshot.data!;

        final quiz1AppUsersRow =
            quiz1AppUsersRowList.isNotEmpty ? quiz1AppUsersRowList.first : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).challenge1,
            body: SafeArea(
              top: true,
              child: FutureBuilder<List<QuestionsRow>>(
                future: QuestionsTable().querySingleRow(
                  queryFn: (q) => q
                      .eq(
                        'id',
                        widget!
                            .randomIds?[_model.index >= 4 ? 4 : _model.index],
                      )
                      .eq(
                        'lesson_id',
                        widget!.lesson?.id,
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
                  List<QuestionsRow> stackQuestionsRowList = snapshot.data!;

                  final stackQuestionsRow = stackQuestionsRowList.isNotEmpty
                      ? stackQuestionsRowList.first
                      : null;

                  return Stack(
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: colorFromCssString(
                                  valueOrDefault<String>(
                                    widget!.lesson?.v2Dark,
                                    '#ffffff',
                                  ),
                                  defaultColor: Colors.black,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 24.0, 20.0, 24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'QUIZ_1_PAGE_Icon_7p6v6acy_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon_navigate_to');

                                            context.goNamed('Home_page');
                                          },
                                          child: Icon(
                                            Icons.close_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            size: 32.0,
                                          ),
                                        ),
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: _model.nextIndex >=
                                                    widget!.randomIds!.length
                                                ? 1.0
                                                : (_model.index /
                                                    widget!.randomIds!.length),
                                            lineHeight: 12.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: colorFromCssString(
                                              valueOrDefault<String>(
                                                widget!
                                                    .lesson?.progressBarColor,
                                                '#094747',
                                              ),
                                              defaultColor: Color(0xFF094747),
                                            ),
                                            backgroundColor: colorFromCssString(
                                              valueOrDefault<String>(
                                                widget!
                                                    .lesson?.progressBackground,
                                                '#146665',
                                              ),
                                              defaultColor: Color(0xFF146665),
                                            ),
                                            barRadius: Radius.circular(12.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        if (quiz1AppUsersRow?.plan !=
                                            'Fun Learning Plan')
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
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
                                                  if (quiz1AppUsersRow?.plan ==
                                                      'Free') {
                                                    return Text(
                                                      FFAppState()
                                                          .lives
                                                          .toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Recolta Alt',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    );
                                                  } else {
                                                    return FaIcon(
                                                      FontAwesomeIcons.infinity,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white,
                                                      size: 16.0,
                                                    );
                                                  }
                                                },
                                              ),
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                      ].divide(SizedBox(width: 24.0)),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              widget!.lesson?.name,
                                              'Active Listening',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Recolta Alt',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              if (widget!.isLastIndex == false)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: colorFromCssString(
                                                        valueOrDefault<String>(
                                                          widget!.lesson
                                                              ?.v2SmallBackground,
                                                          '#0d4040',
                                                        ),
                                                        defaultColor:
                                                            Color(0xFF0D4040),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Icon(
                                                            Icons.timer_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .white,
                                                            size: 20.0,
                                                          ),
                                                          custom_widgets
                                                              .CountDown(
                                                            width: 50.0,
                                                            height: 20.0,
                                                            seconds: () {
                                                              if (widget!
                                                                      .index ==
                                                                  0) {
                                                                return 600;
                                                              } else if (widget!
                                                                      .index ==
                                                                  1) {
                                                                return 300;
                                                              } else if (widget!
                                                                      .index ==
                                                                  2) {
                                                                return 240;
                                                              } else {
                                                                return 240;
                                                              }
                                                            }(),
                                                            fontSize: 14.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .white,
                                                            batchId: widget!
                                                                .batchId!
                                                                .toString(),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation']!),
                                                ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: colorFromCssString(
                                                    valueOrDefault<String>(
                                                      widget!.lesson
                                                          ?.v2SmallBackground,
                                                      '#0d4040',
                                                    ),
                                                    defaultColor:
                                                        Color(0xFF0D4040),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 8.0, 12.0, 8.0),
                                                  child: Text(
                                                    'Q ${(_model.nextIndex + (((widget!.index!) - 1) * widget!.randomIds!.length)).toString()} - [Q ${((widget!.index!) * widget!.randomIds!.length).toString()}]',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Recolta Alt',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .white,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    stackQuestionsRow?.question,
                                                    'Question',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Recolta Alt',
                                                        color:
                                                            colorFromCssString(
                                                          widget!.lesson!
                                                              .v2QuestionColor!,
                                                          defaultColor:
                                                              Colors.white,
                                                        ),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -0.04),
                                                  child: FutureBuilder<
                                                      List<OptionsRow>>(
                                                    future: OptionsTable()
                                                        .queryRows(
                                                      queryFn: (q) => q
                                                          .eq(
                                                            'lesson_id',
                                                            widget!.lesson?.id,
                                                          )
                                                          .eq(
                                                            'question_id',
                                                            stackQuestionsRow
                                                                ?.id,
                                                          )
                                                          .order('created_at',
                                                              ascending: true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 45.0,
                                                            height: 45.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<OptionsRow>
                                                          listViewOptionsRowList =
                                                          snapshot.data!;

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewOptionsRowList
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 20.0),
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewOptionsRow =
                                                              listViewOptionsRowList[
                                                                  listViewIndex];
                                                          return InkWell(
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
                                                                  'QUIZ_1_PAGE_Container_3no4ecwu_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Container_update_page_state');
                                                              _model.option =
                                                                  listViewOptionsRow;
                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  listViewOptionsRow
                                                                              .id ==
                                                                          _model
                                                                              .option
                                                                              ?.id
                                                                      ? colorFromCssString(
                                                                          widget!
                                                                              .lesson!
                                                                              .v2BtnColor!,
                                                                          defaultColor:
                                                                              Color(0xFF0A6666),
                                                                        )
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .black,
                                                                  Colors.black,
                                                                ),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        0.0,
                                                                    color:
                                                                        colorFromCssString(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        widget!
                                                                            .lesson
                                                                            ?.v2OptionShadow,
                                                                        '#138080',
                                                                      ),
                                                                      defaultColor:
                                                                          Color(
                                                                              0xFF138080),
                                                                    ),
                                                                    offset:
                                                                        Offset(
                                                                      3.0,
                                                                      3.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        14.0,
                                                                        8.0,
                                                                        14.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    listViewOptionsRow
                                                                        .name,
                                                                    'This is the first option for the question',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Recolta Alt',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'listViewOnPageLoadAnimation']!);
                                                    },
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 24.0)),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 24.0)),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: colorFromCssString(
                                              valueOrDefault<String>(
                                                widget!.lesson?.v2OptionShadow,
                                                '#000',
                                              ),
                                              defaultColor: Colors.black,
                                            ),
                                            offset: Offset(
                                              0.0,
                                              3.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Builder(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'QUIZ_1_PAGE_Next_ON_TAP');
                                            var _shouldSetState = false;
                                            if (quiz1AppUsersRow!.lives < 1) {
                                              logFirebaseEvent(
                                                  'Next_alert_dialog');
                                              await showDialog(
                                                barrierDismissible: false,
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
                                                      child: Container(
                                                        height: 500.0,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        child: OutOfLiveWidget(
                                                          user:
                                                              quiz1AppUsersRow!,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              if (!(_model.option != null)) {
                                                logFirebaseEvent(
                                                    'Next_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'You need to select an option',
                                                      style: TextStyle(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                  ),
                                                );
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                              if (_model.nextIndex >
                                                  (widget!.randomIds!.length -
                                                      1)) {
                                                logFirebaseEvent(
                                                    'Next_update_page_state');
                                                _model.index = _model.index + 1;
                                                _model.nextIndex =
                                                    _model.nextIndex + 1;
                                                setState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'Next_update_page_state');
                                                _model.index = _model.index + 1;
                                                _model.nextIndex =
                                                    _model.nextIndex + 1;
                                                setState(() {});
                                              }

                                              if (FFAppState()
                                                  .option
                                                  .isCorrect) {
                                                logFirebaseEvent(
                                                    'Next_play_sound');
                                                _model.soundPlayer1 ??=
                                                    AudioPlayer();
                                                if (_model
                                                    .soundPlayer1!.playing) {
                                                  await _model.soundPlayer1!
                                                      .stop();
                                                }
                                                _model.soundPlayer1!
                                                    .setVolume(1.0);
                                                _model.soundPlayer1!
                                                    .setAsset(
                                                        'assets/audios/snd_fragment_retrievewav-14728.wav')
                                                    .then((_) => _model
                                                        .soundPlayer1!
                                                        .play());

                                                if (_model.index >=
                                                    (widget!.randomIds!.length -
                                                        1)) {
                                                  if (_model.index ==
                                                      (widget!.randomIds!
                                                              .length -
                                                          1)) {
                                                    logFirebaseEvent(
                                                        'Next_bottom_sheet');
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () =>
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: Container(
                                                              height: 300.0,
                                                              child:
                                                                  AnswerCorrectWidget(
                                                                questionCount:
                                                                    widget!
                                                                        .randomIds!
                                                                        .length,
                                                                points:
                                                                    FFAppState()
                                                                        .points,
                                                                lessonName:
                                                                    widget!
                                                                        .lesson!
                                                                        .name,
                                                                batchId: widget!
                                                                    .batchId!,
                                                                user:
                                                                    quiz1AppUsersRow!,
                                                                lesson: widget!
                                                                    .lesson!,
                                                                index: widget!
                                                                    .index!,
                                                                batchindex:
                                                                    widget!
                                                                        .index!,
                                                                option: _model
                                                                    .option,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                }
                                                logFirebaseEvent(
                                                    'Next_update_app_state');
                                                FFAppState().points =
                                                    FFAppState().points + 1;
                                                setState(() {});
                                                logFirebaseEvent(
                                                    'Next_update_page_state');
                                                _model.correctQuestions =
                                                    _model.correctQuestions + 1;
                                                setState(() {});
                                                logFirebaseEvent(
                                                    'Next_bottom_sheet');
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
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height: 300.0,
                                                          child:
                                                              AnswerCorrectWidget(
                                                            index: _model.index,
                                                            questionCount:
                                                                widget!
                                                                    .randomIds!
                                                                    .length,
                                                            points: _model
                                                                .correctQuestions,
                                                            lessonName: widget!
                                                                .lesson!.name,
                                                            batchId: widget!
                                                                .batchId!,
                                                            user:
                                                                quiz1AppUsersRow!,
                                                            lesson:
                                                                widget!.lesson!,
                                                            batchindex:
                                                                widget!.index!,
                                                            option:
                                                                _model.option,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                logFirebaseEvent(
                                                    'Next_update_app_state');
                                                FFAppState().option =
                                                    OptionStruct();
                                                setState(() {});
                                                logFirebaseEvent(
                                                    'Next_backend_call');
                                                unawaited(
                                                  () async {
                                                    _model.apiResultrzl =
                                                        await AnswerQuestionCall
                                                            .call(
                                                      isCorrect: true,
                                                      userId: currentUserUid,
                                                      questionId:
                                                          stackQuestionsRow?.id
                                                              ?.toString(),
                                                      lessonId:
                                                          widget!.lesson?.id,
                                                      batchId: widget!.batchId,
                                                    );
                                                  }(),
                                                );
                                                _shouldSetState = true;
                                              } else {
                                                logFirebaseEvent(
                                                    'Next_update_app_state');
                                                FFAppState()
                                                    .addToFailedQuestions(
                                                        widget!.index!);
                                                FFAppState().option =
                                                    OptionStruct();
                                                logFirebaseEvent(
                                                    'Next_play_sound');
                                                _model.soundPlayer2 ??=
                                                    AudioPlayer();
                                                if (_model
                                                    .soundPlayer2!.playing) {
                                                  await _model.soundPlayer2!
                                                      .stop();
                                                }
                                                _model.soundPlayer2!
                                                    .setVolume(1.0);
                                                _model.soundPlayer2!
                                                    .setAsset(
                                                        'assets/audios/all-processors-164964.mp3')
                                                    .then((_) => _model
                                                        .soundPlayer2!
                                                        .play());

                                                if (quiz1AppUsersRow?.plan !=
                                                    'Fun Learning Plan') {
                                                  logFirebaseEvent(
                                                      'Next_update_app_state');
                                                  FFAppState().lives =
                                                      FFAppState().lives + -1;
                                                  logFirebaseEvent(
                                                      'Next_backend_call');
                                                  await AppUsersTable().update(
                                                    data: {
                                                      'lives':
                                                          FFAppState().lives,
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'id',
                                                      currentUserUid,
                                                    ),
                                                  );
                                                }
                                                if (_model.index ==
                                                    (widget!.randomIds!.length -
                                                        1)) {
                                                  logFirebaseEvent(
                                                      'Next_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height: 300.0,
                                                            child:
                                                                IncorrectAnswerWidget(
                                                              index:
                                                                  _model.index,
                                                              questionCount:
                                                                  widget!
                                                                      .randomIds!
                                                                      .length,
                                                              points:
                                                                  FFAppState()
                                                                      .points,
                                                              lessonName:
                                                                  widget!
                                                                      .lesson!
                                                                      .name,
                                                              question:
                                                                  stackQuestionsRow!
                                                                      .question,
                                                              batchId: widget!
                                                                  .batchId!,
                                                              user:
                                                                  quiz1AppUsersRow!,
                                                              lesson: widget!
                                                                  .lesson!,
                                                              option:
                                                                  _model.option,
                                                              batchIndex:
                                                                  widget!
                                                                      .index!,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                                logFirebaseEvent(
                                                    'Next_bottom_sheet');
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
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height: 300.0,
                                                          child:
                                                              IncorrectAnswerWidget(
                                                            index:
                                                                widget!.index!,
                                                            questionCount:
                                                                widget!
                                                                    .randomIds!
                                                                    .length,
                                                            points: _model
                                                                .correctQuestions,
                                                            lessonName: widget!
                                                                .lesson!.name,
                                                            question:
                                                                stackQuestionsRow!
                                                                    .question,
                                                            batchId: widget!
                                                                .batchId!,
                                                            user:
                                                                quiz1AppUsersRow!,
                                                            lesson:
                                                                widget!.lesson!,
                                                            option:
                                                                _model.option,
                                                            batchIndex:
                                                                widget!.index!,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                logFirebaseEvent(
                                                    'Next_update_app_state');
                                                FFAppState().option =
                                                    OptionStruct();
                                                setState(() {});
                                                logFirebaseEvent(
                                                    'Next_backend_call');
                                                unawaited(
                                                  () async {
                                                    _model.apiResult95r =
                                                        await AnswerQuestionCall
                                                            .call(
                                                      userId: currentUserUid,
                                                      isCorrect: false,
                                                      lessonId:
                                                          widget!.lesson?.id,
                                                      questionId:
                                                          stackQuestionsRow?.id
                                                              ?.toString(),
                                                      batchId: widget!.batchId,
                                                    );
                                                  }(),
                                                );
                                                _shouldSetState = true;
                                              }

                                              logFirebaseEvent(
                                                  'Next_update_page_state');

                                              setState(() {});
                                              if (_model.index >=
                                                  (widget!.randomIds!.length -
                                                      1)) {
                                                logFirebaseEvent(
                                                    'Next_stop_periodic_action');
                                                _model.instantTimer?.cancel();
                                              } else {
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }

                                              logFirebaseEvent(
                                                  'Next_backend_call');
                                              unawaited(
                                                () async {
                                                  _model.completedBatch =
                                                      await CompleteModuleQuestionCall
                                                          .call(
                                                    userId: currentUserUid,
                                                    lessonId:
                                                        widget!.lesson?.id,
                                                    batchId: widget!.batchId,
                                                    points:
                                                        _model.correctQuestions,
                                                  );
                                                }(),
                                              );
                                              _shouldSetState = true;
                                              logFirebaseEvent(
                                                  'Next_backend_call');
                                              _model.streak =
                                                  await StreakCall.call(
                                                userId: currentUserUid,
                                              );

                                              _shouldSetState = true;
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'bcwz3bzh' /* Check Answer */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 48.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    32.0, 0.0, 32.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: colorFromCssString(
                                              valueOrDefault<String>(
                                                widget!.lesson?.v2BtnColor,
                                                '#000',
                                              ),
                                              defaultColor: Colors.black,
                                            ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Recolta Alt',
                                                      color: colorFromCssString(
                                                        widget!.lesson!
                                                            .v2BtnTextColor!,
                                                        defaultColor:
                                                            Colors.white,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 24.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
