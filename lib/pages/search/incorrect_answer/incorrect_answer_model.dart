import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/quiz/well_done_1/well_done1_widget.dart';
import '/pages/quiz/welldone/welldone_widget.dart';
import 'incorrect_answer_widget.dart' show IncorrectAnswerWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class IncorrectAnswerModel extends FlutterFlowModel<IncorrectAnswerWidget> {
  ///  State fields for stateful widgets in this component.

  AudioPlayer? soundPlayer;
  // Stores action output result for [Backend Call - API (completeModuleQuestion)] action in Button widget.
  ApiCallResponse? apiResult3mv;
  // Stores action output result for [Backend Call - API (streak)] action in Button widget.
  ApiCallResponse? streak;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
