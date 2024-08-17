import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/quiz/answer_correct/answer_correct_widget.dart';
import '/pages/quiz/out_of_live/out_of_live_widget.dart';
import '/pages/search/incorrect_answer/incorrect_answer_widget.dart';
import 'dart:async';
import 'dart:math';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'quiz1_widget.dart' show Quiz1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class Quiz1Model extends FlutterFlowModel<Quiz1Widget> {
  ///  Local state fields for this page.

  int index = 0;

  int nextIndex = 1;

  OptionsRow? option;

  int correctQuestions = 0;

  int continueIndex = 0;

  bool isClicked = false;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  AudioPlayer? soundPlayer1;
  // Stores action output result for [Backend Call - API (answerQuestion)] action in Next widget.
  ApiCallResponse? apiResultrzl;
  AudioPlayer? soundPlayer2;
  // Stores action output result for [Backend Call - API (answerQuestion)] action in Next widget.
  ApiCallResponse? apiResult95r;
  // Stores action output result for [Backend Call - API (completeModuleQuestion)] action in Next widget.
  ApiCallResponse? completedBatch;
  // Stores action output result for [Backend Call - API (streak)] action in Next widget.
  ApiCallResponse? streak;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
