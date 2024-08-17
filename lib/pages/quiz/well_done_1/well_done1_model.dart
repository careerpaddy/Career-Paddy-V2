import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/quiz/welldone/welldone_widget.dart';
import 'well_done1_widget.dart' show WellDone1Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class WellDone1Model extends FlutterFlowModel<WellDone1Widget> {
  ///  State fields for stateful widgets in this component.

  AudioPlayer? soundPlayer;
  // Stores action output result for [Backend Call - API (completeModuleQuestion)] action in Button widget.
  ApiCallResponse? complete;
  // Stores action output result for [Backend Call - API (getModuleQuestions)] action in Button widget.
  ApiCallResponse? apiResultdot;
  // Stores action output result for [Backend Call - API (getModuleInfo)] action in Button widget.
  ApiCallResponse? moduleinfo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
