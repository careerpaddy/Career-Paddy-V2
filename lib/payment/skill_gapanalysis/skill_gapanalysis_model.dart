import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/payment/subscription/subscription_widget.dart';
import 'skill_gapanalysis_widget.dart' show SkillGapanalysisWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class SkillGapanalysisModel extends FlutterFlowModel<SkillGapanalysisWidget> {
  ///  State fields for stateful widgets in this component.

  AudioPlayer? soundPlayer;
  // Stores action output result for [Backend Call - API (downloadSkillGapReport)] action in Button widget.
  ApiCallResponse? apiResult4m9;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
