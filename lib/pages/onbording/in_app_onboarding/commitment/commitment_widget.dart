import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'commitment_model.dart';
export 'commitment_model.dart';

class CommitmentWidget extends StatefulWidget {
  const CommitmentWidget({
    super.key,
    bool? isEdit,
    this.image,
  }) : this.isEdit = isEdit ?? false;

  final bool isEdit;
  final String? image;

  @override
  State<CommitmentWidget> createState() => _CommitmentWidgetState();
}

class _CommitmentWidgetState extends State<CommitmentWidget> {
  late CommitmentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommitmentModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Commitment'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('COMMITMENT_PAGE_Commitment_ON_INIT_STATE');
      logFirebaseEvent('Commitment_update_page_state');
      _model.addToCommitments(CommitmentStruct(
        days: 7,
        caption: 'Promising',
      ));
      await Future.wait([
        Future(() async {
          logFirebaseEvent('Commitment_update_page_state');
          _model.addToCommitments(CommitmentStruct(
            days: 14,
            caption: 'Determined',
          ));
        }),
        Future(() async {
          logFirebaseEvent('Commitment_update_page_state');
          _model.addToCommitments(CommitmentStruct(
            days: 30,
            caption: 'Impressive',
          ));
        }),
      ]);
      logFirebaseEvent('Commitment_update_page_state');
      _model.addToCommitments(CommitmentStruct(
        days: 50,
        caption: 'Unstoppable',
      ));
      setState(() {});
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

    return Scaffold(
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('COMMITMENT_PAGE_Column_gnxcbd02_ON_TAP');
                logFirebaseEvent('Column_navigate_to');

                context.pushNamed('Comment_1');
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'md7t6tcb' /* Commit to growing with Career ... */,
                              ),
                              textAlign: TextAlign.center,
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
                            Builder(
                              builder: (context) {
                                final goals = _model.commitments.toList();

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      List.generate(goals.length, (goalsIndex) {
                                    final goalsItem = goals[goalsIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'COMMITMENT_PAGE_options_ON_TAP');
                                        logFirebaseEvent(
                                            'options_update_app_state');
                                        FFAppState().goal = goalsItem;
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: goalsItem.caption ==
                                                  FFAppState().goal.caption
                                              ? FlutterFlowTheme.of(context)
                                                  .gray300
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .border,
                                              offset: Offset(
                                                2.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .border,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 16.0, 10.0, 16.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${goalsItem.days.toString()}-day streak',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Recolta Alt',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                goalsItem.caption,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Recolta Alt',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .gray400,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).divide(SizedBox(height: 16.0)),
                                );
                              },
                            ),
                          ].divide(SizedBox(height: 24.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Exercise.png',
                        width: 280.0,
                        height: 132.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF0B61CB),
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
                        logFirebaseEvent('COMMITMENT_PAGE_Next_ON_TAP');
                        logFirebaseEvent('Next_play_sound');
                        _model.soundPlayer ??= AudioPlayer();
                        if (_model.soundPlayer!.playing) {
                          await _model.soundPlayer!.stop();
                        }
                        _model.soundPlayer!.setVolume(1.0);
                        _model.soundPlayer!
                            .setAsset('assets/audios/button_click_1.mp3')
                            .then((_) => _model.soundPlayer!.play());

                        logFirebaseEvent('Next_navigate_to');
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed('Quotes5');
                      },
                      text: FFLocalizations.of(context).getText(
                        'cxmdym4h' /* Next */,
                      ),
                      options: FFButtonOptions(
                        height: 48.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Recolta Alt',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 32.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
