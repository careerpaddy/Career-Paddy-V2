import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'question_timer_page_model.dart';
export 'question_timer_page_model.dart';

class QuestionTimerPageWidget extends StatefulWidget {
  const QuestionTimerPageWidget({
    super.key,
    required this.lesson,
    required this.batchId,
    required this.index,
    bool? isScenario,
  }) : this.isScenario = isScenario ?? false;

  final LessonsRow? lesson;
  final int? batchId;
  final int? index;
  final bool isScenario;

  @override
  State<QuestionTimerPageWidget> createState() =>
      _QuestionTimerPageWidgetState();
}

class _QuestionTimerPageWidgetState extends State<QuestionTimerPageWidget> {
  late QuestionTimerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionTimerPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Question_timer_page'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('QUESTION_TIMER_Question_timer_page_ON_IN');
      logFirebaseEvent('Question_timer_page_start_periodic_actio');
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 3000),
        callback: (timer) async {
          logFirebaseEvent('Question_timer_page_backend_call');
          _model.questions = await GetModuleQuestionsCall.call(
            userId: currentUserUid,
            lessonId: widget!.lesson?.id,
            batchId: widget!.batchId,
            index: widget!.index,
          );

          if ((_model.questions?.succeeded ?? true)) {
            logFirebaseEvent('Question_timer_page_stop_periodic_action');
            _model.instantTimer?.cancel();
            logFirebaseEvent('Question_timer_page_wait__delay');
            await Future.delayed(const Duration(milliseconds: 1500));
            if ((_model.questions?.succeeded ?? true)) {
              logFirebaseEvent('Question_timer_page_navigate_to');

              context.pushNamed(
                'Scenario_questions',
                queryParameters: {
                  'batch': serializeParam(
                    widget!.batchId,
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
              logFirebaseEvent('Question_timer_page_navigate_to');

              context.pushNamed(
                'Quiz_1',
                queryParameters: {
                  'lesson': serializeParam(
                    widget!.lesson,
                    ParamType.SupabaseRow,
                  ),
                  'batchId': serializeParam(
                    widget!.batchId,
                    ParamType.int,
                  ),
                  'index': serializeParam(
                    widget!.index,
                    ParamType.int,
                  ),
                  'randomIds': serializeParam(
                    (_model.questions?.jsonBody ?? ''),
                    ParamType.int,
                    isList: true,
                  ),
                  'isLastIndex': serializeParam(
                    widget!.lesson?.v2Batches == ((widget!.index!) + 1),
                    ParamType.bool,
                  ),
                }.withoutNulls,
              );
            }
          } else {
            logFirebaseEvent('Question_timer_page_show_snack_bar');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Could not load questions',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).error,
              ),
            );
            return;
          }
        },
        startImmediately: true,
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: colorFromCssString(
          widget!.lesson!.v2Dark!,
          defaultColor: Colors.black,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: colorFromCssString(
                widget!.lesson!.v2Dark!,
                defaultColor: Colors.black,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'rnqhq9ni' /* Are you Ready? */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Recolta Alt',
                              color: FlutterFlowTheme.of(context).white,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Exercise.png',
                        width: 200.0,
                        height: 210.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'c3do3vnd' /* The following questions will b... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Recolta Alt',
                            color: FlutterFlowTheme.of(context).white,
                            fontSize: 19.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ].divide(SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
