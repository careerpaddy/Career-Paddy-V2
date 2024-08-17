// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../pages/learning_outcome/learning_outcome_widget.dart';

import 'package:hexcolor/hexcolor.dart';

import '../../flutter_flow/flutter_flow_widgets.dart';

class ModuleTooltip extends StatefulWidget {
  const ModuleTooltip({
    super.key,
    this.width,
    this.height,
    required this.lesson,
    this.userId,
    this.batchId,
    required this.index,
    required this.isScenario,
    required this.action,
  });

  final double? width;
  final double? height;
  final LessonsRow lesson;
  final String? userId;
  final int? batchId;
  final int index;
  final bool isScenario;
  final Future Function() action;

  @override
  State<ModuleTooltip> createState() => _ModuleTooltipState();
}

class _ModuleTooltipState extends State<ModuleTooltip> {
  var supabase = Supabase.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(
      //   minHeight: MediaQuery.sizeOf(context).height * 0.3,
      //   maxHeight: MediaQuery.sizeOf(context).height * 0.35,
      // ),
      decoration: BoxDecoration(
        color: HexColor(widget.lesson.v2Color!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      widget.lesson.outcome!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Recolta Alt',
                            color: FlutterFlowTheme.of(context).white,
                            fontSize: 15,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      'Assessment ${widget.index} of 3',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Recolta Alt',
                            color: FlutterFlowTheme.of(context).white,
                            fontSize: 14,
                            letterSpacing: 0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ].divide(SizedBox(height: 8)),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0,
                        color: HexColor(widget.lesson.v2Color!),
                        offset: Offset(
                          0,
                          3,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Builder(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'HOMEOVERLAY_COURSE_1_START_NOW_BTN_ON_TA');
                        logFirebaseEvent('Button_alert_dialog');
                        await widget.action();
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0, 0)
                                  .resolve(Directionality.of(context)),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.6,
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                child: LearningOutcomeWidget(
                                  lesson: widget.lesson,
                                  batchId: widget.batchId,
                                  index: widget.index,
                                  isScenario: widget.isScenario,
                                  openQuiz: true,
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      text: FFLocalizations.of(context).getText(
                        'zwxrh13o' /* Start Now */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).white,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Recolta Alt',
                                  color: HexColor(widget.lesson.v2Color!),
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0,
                        borderSide: BorderSide(
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 12)),
            ),
          ],
        ),
      ),
    );
  }
}
