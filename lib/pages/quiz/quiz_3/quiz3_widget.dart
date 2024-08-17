import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:math';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quiz3_model.dart';
export 'quiz3_model.dart';

class Quiz3Widget extends StatefulWidget {
  const Quiz3Widget({
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
  State<Quiz3Widget> createState() => _Quiz3WidgetState();
}

class _Quiz3WidgetState extends State<Quiz3Widget>
    with TickerProviderStateMixin {
  late Quiz3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Quiz3Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Quiz_3'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('QUIZ_3_PAGE_Quiz_3_ON_INIT_STATE');
      logFirebaseEvent('Quiz_3_start_periodic_action');
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
            backgroundColor: FlutterFlowTheme.of(context).challenge2,
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
        List<AppUsersRow> quiz3AppUsersRowList = snapshot.data!;

        final quiz3AppUsersRow =
            quiz3AppUsersRowList.isNotEmpty ? quiz3AppUsersRowList.first : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).challenge2,
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
                                color: FlutterFlowTheme.of(context).challenge2,
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
                                                'QUIZ_3_PAGE_Icon_yu12zzf8_ON_TAP');
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
                                            progressColor: Color(0xFF2643D3),
                                            backgroundColor: Color(0xFF142266),
                                            barRadius: Radius.circular(12.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        if (quiz3AppUsersRow?.plan !=
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
                                              Text(
                                                FFAppState().lives.toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Recolta Alt',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts: false,
                                                    ),
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
                                                      color: Color(0xFF162D59),
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
                                                                return 300;
                                                              } else if (widget!
                                                                      .index ==
                                                                  1) {
                                                                return 180;
                                                              } else if (widget!
                                                                      .index ==
                                                                  2) {
                                                                return 120;
                                                              } else {
                                                                return 100;
                                                              }
                                                            }(),
                                                            fontSize: 14.0,
                                                            batchId: '1',
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
                                                  color: Color(0xFF162D59),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 8.0, 12.0, 8.0),
                                                  child: Text(
                                                    'Q ${_model.nextIndex.toString()} - [Q ${widget!.lesson?.v2Batches?.toString()}]',
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
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
                                                          .order('created_at'),
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
                                                                  'QUIZ_3_PAGE_Container_xmt3lwbw_ON_TAP');
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
                                                                color: Color(
                                                                    0xFF1B3871),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        0.0,
                                                                    color: Color(
                                                                        0xFF3D5C98),
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
                                            color: Color(0xFF4D5CA9),
                                            offset: Offset(
                                              0.0,
                                              3.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'QUIZ_3_PAGE_Next_ON_TAP');
                                          logFirebaseEvent('Next_navigate_to');

                                          context.pushNamed('Quotes3');
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'dcbre32q' /* Continue */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  32.0, 0.0, 32.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF1B3871),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Recolta Alt',
                                                    color: Colors.white,
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
