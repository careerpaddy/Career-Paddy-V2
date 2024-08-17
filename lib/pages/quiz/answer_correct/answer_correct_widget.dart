import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/quiz/well_done_1/well_done1_widget.dart';
import '/pages/quiz/welldone/welldone_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'answer_correct_model.dart';
export 'answer_correct_model.dart';

class AnswerCorrectWidget extends StatefulWidget {
  const AnswerCorrectWidget({
    super.key,
    this.option,
    required this.index,
    required this.questionCount,
    required this.points,
    required this.lessonName,
    required this.batchId,
    required this.user,
    required this.lesson,
    this.manualOption,
    required this.batchindex,
  });

  final OptionsRow? option;
  final int? index;
  final int? questionCount;
  final int? points;
  final String? lessonName;
  final int? batchId;
  final AppUsersRow? user;
  final LessonsRow? lesson;
  final OptionStruct? manualOption;
  final int? batchindex;

  @override
  State<AnswerCorrectWidget> createState() => _AnswerCorrectWidgetState();
}

class _AnswerCorrectWidgetState extends State<AnswerCorrectWidget> {
  late AnswerCorrectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnswerCorrectModel());
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  FFIcons.kcheckCircle,
                  color: FlutterFlowTheme.of(context).successText,
                  size: 24.0,
                ),
                Text(
                  'Good job! ',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Recolta Alt',
                        color: FlutterFlowTheme.of(context).successText,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: false,
                      ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '2qfixwup' /* Explanation */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Recolta Alt',
                            color: FlutterFlowTheme.of(context).successText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: false,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget!.manualOption?.hasId() != null
                            ? widget!.manualOption?.explanation
                            : widget!.option?.explanation,
                        'Explanation',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Recolta Alt',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.0,
                    color: Color(0xFF32A26E),
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
                        'ANSWER_CORRECT_COMP_OK_GOT_IT_BTN_ON_TAP');
                    var _shouldSetState = false;
                    if (widget!.index! >= widget!.questionCount!) {
                      if (widget!.batchindex! >= 3) {
                        if (widget!.lesson?.v2BatchesId?.last ==
                            widget!.batchId) {
                          logFirebaseEvent('Button_navigate_to');
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'Lesson_Complete',
                            queryParameters: {
                              'questionCount': serializeParam(
                                widget!.questionCount,
                                ParamType.int,
                              ),
                              'batchId': serializeParam(
                                widget!.batchId,
                                ParamType.int,
                              ),
                              'user': serializeParam(
                                widget!.user,
                                ParamType.SupabaseRow,
                              ),
                              'lesson': serializeParam(
                                widget!.lesson,
                                ParamType.SupabaseRow,
                              ),
                            }.withoutNulls,
                          );
                        } else {
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
                        }
                      } else {
                        logFirebaseEvent('Button_play_sound');
                        _model.soundPlayer ??= AudioPlayer();
                        if (_model.soundPlayer!.playing) {
                          await _model.soundPlayer!.stop();
                        }
                        _model.soundPlayer!.setVolume(1.0);
                        _model.soundPlayer!
                            .setAsset('assets/audios/coins-135571.mp3')
                            .then((_) => _model.soundPlayer!.play());

                        logFirebaseEvent('Button_backend_call');
                        _model.apiResult3mv =
                            await CompleteModuleQuestionCall.call(
                          userId: currentUserUid,
                          lessonId: widget!.lesson?.id,
                          batchId: widget!.batchId,
                          points: widget!.points,
                        );

                        _shouldSetState = true;
                        if (FFAppState().failedQuestions.length >= 3) {
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed(
                            'Failed_questions_prompter',
                            queryParameters: {
                              'batch': serializeParam(
                                widget!.batchId,
                                ParamType.int,
                              ),
                              'lesson': serializeParam(
                                widget!.lesson,
                                ParamType.SupabaseRow,
                              ),
                              'user': serializeParam(
                                widget!.user,
                                ParamType.SupabaseRow,
                              ),
                              'batchId': serializeParam(
                                widget!.batchindex,
                                ParamType.int,
                              ),
                              'index': serializeParam(
                                widget!.index,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );

                          if (_shouldSetState) setState(() {});
                          return;
                        }
                        if ((_model.apiResult3mv?.succeeded ?? true)) {
                          if (widget!.batchindex! >= 3) {
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
                                  child: WelldoneWidget(
                                    points: FFAppState().points,
                                    lesson: widget!.lesson!,
                                    batchId: widget!.batchId!,
                                  ),
                                );
                              },
                            );
                          } else {
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
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.9,
                                    child: WellDone1Widget(
                                      user: widget!.user!,
                                      completedIndex: widget!.index! < 3
                                          ? ((widget!.index!) + 1)
                                          : widget!.index!,
                                      batchId: widget!.batchId!,
                                      lesson: widget!.lesson!,
                                    ),
                                  ),
                                );
                              },
                            );
                          }

                          logFirebaseEvent('Button_backend_call');
                          _model.streak = await StreakCall.call(
                            userId: currentUserUid,
                          );

                          _shouldSetState = true;
                          if (StreakCall.isNew(
                            (_model.streak?.jsonBody ?? ''),
                          )!) {
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              'Streak_Page',
                              queryParameters: {
                                'streaks': serializeParam(
                                  StreakCall.streaks(
                                    (_model.streak?.jsonBody ?? ''),
                                  ),
                                  ParamType.int,
                                ),
                                'days': serializeParam(
                                  StreakCall.days(
                                    (_model.streak?.jsonBody ?? ''),
                                  ),
                                  ParamType.String,
                                  isList: true,
                                ),
                              }.withoutNulls,
                            );
                          }
                        }
                      }
                    } else {
                      logFirebaseEvent('Button_close_dialog_drawer_etc');
                      Navigator.pop(context);
                    }

                    if (_shouldSetState) setState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    'qx1ikt7j' /* Ok, got it! */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF12B76A),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Recolta Alt',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
