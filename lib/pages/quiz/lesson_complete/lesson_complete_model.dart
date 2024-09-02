import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/payment/subscription/subscription_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'lesson_complete_widget.dart' show LessonCompleteWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LessonCompleteModel extends FlutterFlowModel<LessonCompleteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  AudioPlayer? soundPlayer1;
  // Stores action output result for [Backend Call - API (streak)] action in Button widget.
  ApiCallResponse? streak;
  AudioPlayer? soundPlayer2;
  // Stores action output result for [Backend Call - API (downloadBadge)] action in Button widget.
  ApiCallResponse? apiResult3lc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
