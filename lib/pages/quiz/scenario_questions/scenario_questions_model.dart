import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/quiz/answer_correct/answer_correct_widget.dart';
import '/pages/quiz/out_of_live/out_of_live_widget.dart';
import '/pages/quiz/scenario_options/scenario_options_widget.dart';
import '/pages/quiz/scenarios/scenarios_widget.dart';
import '/pages/quiz/well_done_1/well_done1_widget.dart';
import '/pages/search/incorrect_answer/incorrect_answer_widget.dart';
import '/payment/subscription/subscription_widget.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'scenario_questions_widget.dart' show ScenarioQuestionsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ScenarioQuestionsModel extends FlutterFlowModel<ScenarioQuestionsWidget> {
  ///  Local state fields for this page.

  int index = 0;

  int nextIndex = 1;

  OptionsRow? option;

  bool isClicked = false;

  int correctQuestions = 0;

  int? continueIndex;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  AudioPlayer? soundPlayer1;
  // State field(s) for Switch widget.
  bool? switchValue;
  AudioPlayer? soundPlayer2;
  // Stores action output result for [Backend Call - API (streak)] action in Button widget.
  ApiCallResponse? streakdatas;
  // Stores action output result for [Backend Call - API (answerQuestion)] action in Button widget.
  ApiCallResponse? apiResultrzl;
  AudioPlayer? soundPlayer3;
  // Stores action output result for [Backend Call - API (answerQuestion)] action in Button widget.
  ApiCallResponse? apiResult95r;
  // Stores action output result for [Backend Call - API (completeModuleQuestion)] action in Button widget.
  ApiCallResponse? completedBatch;
  // Stores action output result for [Backend Call - API (streak)] action in Button widget.
  ApiCallResponse? streak;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
