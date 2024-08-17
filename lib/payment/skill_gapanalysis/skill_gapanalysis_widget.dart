import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/payment/subscription/subscription_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'skill_gapanalysis_model.dart';
export 'skill_gapanalysis_model.dart';

class SkillGapanalysisWidget extends StatefulWidget {
  const SkillGapanalysisWidget({super.key});

  @override
  State<SkillGapanalysisWidget> createState() => _SkillGapanalysisWidgetState();
}

class _SkillGapanalysisWidgetState extends State<SkillGapanalysisWidget> {
  late SkillGapanalysisModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkillGapanalysisModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF0D1640),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Container(
          width: 390.0,
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('SKILL_GAPANALYSIS_Icon_09u580ou_ON_TAP');
                    logFirebaseEvent('Icon_play_sound');
                    _model.soundPlayer ??= AudioPlayer();
                    if (_model.soundPlayer!.playing) {
                      await _model.soundPlayer!.stop();
                    }
                    _model.soundPlayer!.setVolume(1.0);
                    _model.soundPlayer!
                        .setAsset('assets/audios/button_click_2.mp3')
                        .then((_) => _model.soundPlayer!.play());

                    logFirebaseEvent('Icon_close_dialog_drawer_etc');
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).white,
                    size: 32.0,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 132.0,
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Eye.png',
                      width: 300.0,
                      height: 200.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF131E53),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 16.0, 12.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'pa40so2y' /* Your current skill strength */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Recolta Alt',
                                      color: FlutterFlowTheme.of(context).white,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ym9ykjre' /* You can download a detailed sk... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Recolta Alt',
                                      color: FlutterFlowTheme.of(context).white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.sizeOf(context).height * 0.2,
                            ),
                            decoration: BoxDecoration(),
                            child: FutureBuilder<List<LessonsRow>>(
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<LessonsRow> columnLessonsRowList =
                                    snapshot.data!;

                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        columnLessonsRowList.length,
                                        (columnIndex) {
                                      final columnLessonsRow =
                                          columnLessonsRowList[columnIndex];
                                      return FutureBuilder<
                                          List<AnsweredQuestionsRow>>(
                                        future:
                                            AnsweredQuestionsTable().queryRows(
                                          queryFn: (q) => q
                                              .eq(
                                                'user_id',
                                                currentUserUid,
                                              )
                                              .eq(
                                                'lesson_id',
                                                columnLessonsRow.id,
                                              ),
                                        ),
                                        builder: (context, snapshot) {
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<AnsweredQuestionsRow>
                                              containerAnsweredQuestionsRowList =
                                              snapshot.data!;

                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  columnLessonsRow.name
                                                      .maybeHandleOverflow(
                                                    maxChars: 10,
                                                    replacement: '…',
                                                  ),
                                                  maxLines: 1,
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
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Expanded(
                                                  child: LinearPercentIndicator(
                                                    percent:
                                                        containerAnsweredQuestionsRowList
                                                                .length /
                                                            columnLessonsRow
                                                                .questionsCount,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.4,
                                                    lineHeight: 12.0,
                                                    animation: true,
                                                    animateFromLastPercent:
                                                        true,
                                                    progressColor:
                                                        Color(0xFF2643D3),
                                                    backgroundColor:
                                                        Color(0xFF142266),
                                                    barRadius:
                                                        Radius.circular(12.0),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    if ((int done, int total) {
                                                      return (done / total) >=
                                                          0.9;
                                                    }(
                                                        containerAnsweredQuestionsRowList
                                                            .length,
                                                        columnLessonsRow
                                                            .questionsCount)) {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/Frame_1000007971-2.png',
                                                          width: 28.0,
                                                          height: 28.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    } else if ((containerAnsweredQuestionsRowList
                                                                .length /
                                                            columnLessonsRow
                                                                .questionsCount) >
                                                        0.69) {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/Frame_1000007971.png',
                                                          width: 32.0,
                                                          height: 32.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    } else {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/Frame_1000007971-1.png',
                                                          width: 32.0,
                                                          height: 32.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ].divide(SizedBox(width: 12.0)),
                                            ),
                                          );
                                        },
                                      );
                                    }).divide(SizedBox(height: 5.0)),
                                  ),
                                );
                              },
                            ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).buttonDropShadow,
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
                  child: Builder(
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
                        List<AppUsersRow> buttonAppUsersRowList =
                            snapshot.data!;

                        final buttonAppUsersRow =
                            buttonAppUsersRowList.isNotEmpty
                                ? buttonAppUsersRowList.first
                                : null;

                        return FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'SKILL_GAPANALYSIS_REQUEST_ANALYSIS_REPOR');
                            var _shouldSetState = false;
                            if (buttonAppUsersRow?.plan == 'Free') {
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
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.7,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: SubscriptionWidget(),
                                    ),
                                  );
                                },
                              );

                              if (_shouldSetState) setState(() {});
                              return;
                            }
                            logFirebaseEvent('Button_backend_call');
                            _model.apiResult4m9 =
                                await DownloadSkillGapReportCall.call(
                              uid: currentUserUid,
                            );

                            _shouldSetState = true;
                            if ((_model.apiResult4m9?.succeeded ?? true)) {
                              logFirebaseEvent('Button_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Your request has been sent and is being processed',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            } else {
                              logFirebaseEvent('Button_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    DownloadSkillGapReportCall.message(
                                      (_model.apiResult4m9?.jsonBody ?? ''),
                                    )!,
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                            }

                            if (_shouldSetState) setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '6zj1ohgj' /* Request Analysis Report */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
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
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'SKILL_GAPANALYSIS_Text_6go3iwtr_ON_TAP');
                        logFirebaseEvent('Text_close_dialog_drawer_etc');
                        Navigator.pop(context);
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'l2ctubee' /* Close */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Recolta Alt',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
