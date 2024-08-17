import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scenario_options_model.dart';
export 'scenario_options_model.dart';

class ScenarioOptionsWidget extends StatefulWidget {
  const ScenarioOptionsWidget({
    super.key,
    required this.question,
    required this.lesson,
  });

  final QuestionsRow? question;
  final LessonsRow? lesson;

  @override
  State<ScenarioOptionsWidget> createState() => _ScenarioOptionsWidgetState();
}

class _ScenarioOptionsWidgetState extends State<ScenarioOptionsWidget> {
  late ScenarioOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScenarioOptionsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'h51m4m6j' /* Select the correct option */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Recolta Alt',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
                FutureBuilder<List<OptionsRow>>(
                  future: OptionsTable().queryRows(
                    queryFn: (q) => q
                        .eq(
                          'lesson_id',
                          widget!.lesson?.id,
                        )
                        .eq(
                          'question_id',
                          widget!.question?.id,
                        )
                        .order('created_at', ascending: true),
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
                    List<OptionsRow> columnOptionsRowList = snapshot.data!;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(columnOptionsRowList.length,
                          (columnIndex) {
                        final columnOptionsRow =
                            columnOptionsRowList[columnIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'SCENARIO_OPTIONS_COMP_options_ON_TAP');
                            logFirebaseEvent('options_update_app_state');
                            FFAppState().option = OptionStruct(
                              id: columnOptionsRow.id,
                              name: columnOptionsRow.name,
                              isCorrect: columnOptionsRow.isCorrect,
                              lessonId: columnOptionsRow.lessonId,
                              questionId:
                                  columnOptionsRow.questionId.toString(),
                              explanation: columnOptionsRow.explanation,
                              batchId: columnOptionsRow.batchId,
                            );
                            FFAppState().update(() {});
                            logFirebaseEvent('options_close_dialog_drawer_etc');
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: FlutterFlowTheme.of(context).border,
                                  offset: Offset(
                                    2.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).border,
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 12.0, 8.0, 12.0),
                              child: Text(
                                columnOptionsRow.name,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Recolta Alt',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        );
                      }).divide(SizedBox(height: 16.0)),
                    );
                  },
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('SCENARIO_OPTIONS_COMP_Next_ON_TAP');
                logFirebaseEvent('Next_close_dialog_drawer_etc');
                Navigator.pop(context);
              },
              text: FFLocalizations.of(context).getText(
                'j4a81obb' /* Close */,
              ),
              options: FFButtonOptions(
                height: 48.0,
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryBackground,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Recolta Alt',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 18.0,
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
          ].divide(SizedBox(height: 40.0)),
        ),
      ),
    );
  }
}
