import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/quiz/welldone/welldone_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'well_done1_model.dart';
export 'well_done1_model.dart';

class WellDone1Widget extends StatefulWidget {
  const WellDone1Widget({
    super.key,
    required this.user,
    required this.completedIndex,
    required this.batchId,
    required this.lesson,
  });

  final AppUsersRow? user;
  final int? completedIndex;
  final int? batchId;
  final LessonsRow? lesson;

  @override
  State<WellDone1Widget> createState() => _WellDone1WidgetState();
}

class _WellDone1WidgetState extends State<WellDone1Widget> {
  late WellDone1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WellDone1Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 640.0,
      decoration: BoxDecoration(
        color: Color(0xFF094747),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    '${widget!.user?.fullName}, ${FFAppState().failedQuestions.length >= 4 ? 'We are rooting for you' : 'Keep Rocking'}!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Recolta Alt',
                          color: FlutterFlowTheme.of(context).white,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: 300.0,
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Music.png',
                      width: 200.0,
                      height: 210.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'nv3d3n37' /* Don't stop learning and assess... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Recolta Alt',
                          color: FlutterFlowTheme.of(context).white,
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.0,
                    color: Color(0xFF61D0C9),
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
                  onPressed: () async {
                    logFirebaseEvent(
                        'WELL_DONE_1_CONTINUE_LEARNING_BTN_ON_TAP');
                    var _shouldSetState = false;
                    logFirebaseEvent('Button_play_sound');
                    _model.soundPlayer ??= AudioPlayer();
                    if (_model.soundPlayer!.playing) {
                      await _model.soundPlayer!.stop();
                    }
                    _model.soundPlayer!.setVolume(1.0);
                    _model.soundPlayer!
                        .setAsset('assets/audios/button_click_1.mp3')
                        .then((_) => _model.soundPlayer!.play());

                    logFirebaseEvent('Button_backend_call');
                    _model.complete = await CompleteModuleQuestionCall.call(
                      userId: currentUserUid,
                      lessonId: widget!.lesson?.id,
                      batchId: widget!.batchId,
                      points: FFAppState().points,
                    );

                    _shouldSetState = true;
                    logFirebaseEvent('Button_backend_call');
                    await StreakCall.call(
                      userId: currentUserUid,
                    );

                    logFirebaseEvent('Button_update_app_state');
                    FFAppState().failedQuestions = [];
                    setState(() {});
                    if (CompleteModuleQuestionCall.isMore(
                          (_model.complete?.jsonBody ?? ''),
                        ) !=
                        true) {
                      logFirebaseEvent('Button_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              child: WelldoneWidget(
                                points: FFAppState().points,
                                lesson: widget!.lesson!,
                                batchId: widget!.batchId!,
                              ),
                            ),
                          );
                        },
                      );

                      if (_shouldSetState) setState(() {});
                      return;
                    }
                    logFirebaseEvent('Button_backend_call');
                    _model.apiResultdot = await GetModuleQuestionsCall.call(
                      userId: currentUserUid,
                      lessonId: widget!.lesson?.id,
                      batchId: widget!.batchId,
                      index: (widget!.completedIndex!) + 1,
                    );

                    _shouldSetState = true;
                    if ((_model.apiResultdot?.succeeded ?? true)) {
                      logFirebaseEvent('Button_backend_call');
                      _model.moduleinfo = await GetModuleInfoCall.call(
                        lessonId: widget!.lesson?.id,
                        batchId: widget!.batchId?.toString(),
                      );

                      _shouldSetState = true;
                      if ((_model.moduleinfo?.succeeded ?? true)) {
                        logFirebaseEvent('Button_update_app_state');
                        FFAppState().failedQuestions = [];
                        setState(() {});
                        logFirebaseEvent('Button_navigate_to');

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
                              (_model.apiResultdot?.jsonBody ?? ''),
                              ParamType.int,
                              isList: true,
                            ),
                            'batchIndex': serializeParam(
                              (widget!.completedIndex!) + 1,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        logFirebaseEvent('Button_navigate_to');
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
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
                              (widget!.completedIndex!) + 1,
                              ParamType.int,
                            ),
                            'randomIds': serializeParam(
                              (_model.apiResultdot?.jsonBody ?? ''),
                              ParamType.int,
                              isList: true,
                            ),
                            'isLastIndex': serializeParam(
                              widget!.lesson?.v2Batches ==
                                  ((widget!.completedIndex!) + 1),
                              ParamType.bool,
                            ),
                          }.withoutNulls,
                        );
                      }
                    } else {
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'An error occurred',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).errorText,
                        ),
                      );
                    }

                    if (_shouldSetState) setState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    'zctm2fdw' /* Continue learning */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF7BF2F2),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Recolta Alt',
                          color: Color(0xFF042B2B),
                          letterSpacing: 0.0,
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
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.0,
                    color: Color(0xFF61D0C9),
                    offset: Offset(
                      0.0,
                      3.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
