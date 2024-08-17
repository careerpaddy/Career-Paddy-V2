import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'failed_questions_prompter_model.dart';
export 'failed_questions_prompter_model.dart';

class FailedQuestionsPrompterWidget extends StatefulWidget {
  const FailedQuestionsPrompterWidget({
    super.key,
    required this.batch,
    required this.lesson,
    required this.user,
    required this.batchId,
    required this.index,
  });

  final int? batch;
  final LessonsRow? lesson;
  final AppUsersRow? user;
  final int? batchId;
  final int? index;

  @override
  State<FailedQuestionsPrompterWidget> createState() =>
      _FailedQuestionsPrompterWidgetState();
}

class _FailedQuestionsPrompterWidgetState
    extends State<FailedQuestionsPrompterWidget> with TickerProviderStateMixin {
  late FailedQuestionsPrompterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FailedQuestionsPrompterModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Failed_questions_prompter'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FAILED_QUESTIONS_PROMPTER_Failed_questio');
      logFirebaseEvent('Failed_questions_prompter_start_periodic');
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          logFirebaseEvent('Failed_questions_prompter_update_app_sta');
          FFAppState().timer = FFAppState().timer + 1;
        },
        startImmediately: true,
      );
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.08),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            actions: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).gray100,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'FAILED_QUESTIONS_PROMPTER_close_rounded_');
                      logFirebaseEvent('IconButton_navigate_to');

                      context.goNamed('Home_page');
                    },
                  ),
                ),
              ),
            ],
            centerTitle: false,
            elevation: 1.0,
          ),
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 230.0,
                height: 240.0,
                decoration: BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/jack_up.png',
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'ikzuxpx8' /* Let's try out questions you mi... */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Recolta Alt',
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation']!),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 0.0,
                      color: FlutterFlowTheme.of(context).buttonDropShadow,
                      offset: Offset(
                        0.0,
                        3.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'FAILED_QUESTIONS_PROMPTER_LETS_START_BTN');
                    var _shouldSetState = false;
                    logFirebaseEvent('Button_backend_call');
                    _model.questions = await GetModuleQuestionsCall.call(
                      userId: currentUserUid,
                      lessonId: widget!.lesson?.id,
                      batchId: widget!.batchId,
                      index: widget!.index,
                    );

                    _shouldSetState = true;
                    if ((_model.questions?.succeeded ?? true)) {
                      logFirebaseEvent('Button_update_app_state');
                      FFAppState().failedQuestions = [];
                      setState(() {});
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(
                        'Scenario_questions',
                        queryParameters: {
                          'batch': serializeParam(
                            widget!.batch,
                            ParamType.int,
                          ),
                          'lesson': serializeParam(
                            widget!.lesson,
                            ParamType.SupabaseRow,
                          ),
                          'randomIds': serializeParam(
                            (_model.questions?.jsonBody ?? ''),
                            ParamType.int,
                            isList: true,
                          ),
                          'batchIndex': serializeParam(
                            widget!.index,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Could not load questions',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                      if (_shouldSetState) setState(() {});
                      return;
                    }

                    if (_shouldSetState) setState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    'rrlwdgsc' /* Let's start */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Recolta Alt',
                          color: FlutterFlowTheme.of(context).white,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
