import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'learning_outcome_model.dart';
export 'learning_outcome_model.dart';

class LearningOutcomeWidget extends StatefulWidget {
  const LearningOutcomeWidget({
    super.key,
    required this.lesson,
    bool? openQuiz,
    this.index,
    this.batchId,
    bool? isScenario,
  })  : this.openQuiz = openQuiz ?? false,
        this.isScenario = isScenario ?? false;

  final LessonsRow? lesson;
  final bool openQuiz;
  final int? index;
  final int? batchId;
  final bool isScenario;

  @override
  State<LearningOutcomeWidget> createState() => _LearningOutcomeWidgetState();
}

class _LearningOutcomeWidgetState extends State<LearningOutcomeWidget> {
  late LearningOutcomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearningOutcomeModel());
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
        color: FlutterFlowTheme.of(context).primaryText,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to ${widget!.lesson?.name}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Recolta Alt',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: false,
                      ),
                ),
                Text(
                  'Topics Covered',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Recolta Alt',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: false,
                      ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.sizeOf(context).height * 0.37,
                  ),
                  decoration: BoxDecoration(),
                  child: Builder(
                    builder: (context) {
                      final topic = widget!.lesson?.keyTopics?.toList() ?? [];

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(topic.length, (topicIndex) {
                            final topicItem = topic[topicIndex];
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.sizeOf(context).width * 0.68,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 11.0, 0.0, 12.0),
                                    child: Text(
                                      topicItem,
                                      maxLines: 5,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Recolta Alt',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('LEARNING_OUTCOME_OK_GOT_IT_BTN_ON_TAP');
                    logFirebaseEvent('Button_close_dialog_drawer_etc');
                    Navigator.pop(context);
                    if (widget!.openQuiz) {
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(
                        'Question_timer_page',
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
                          'isScenario': serializeParam(
                            widget!.isScenario,
                            ParamType.bool,
                          ),
                        }.withoutNulls,
                      );
                    }
                  },
                  text: FFLocalizations.of(context).getText(
                    'em3flszn' /* Ok, got it! */,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Recolta Alt',
                          color: Colors.white,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ].divide(SizedBox(height: 24.0)),
        ),
      ),
    );
  }
}
