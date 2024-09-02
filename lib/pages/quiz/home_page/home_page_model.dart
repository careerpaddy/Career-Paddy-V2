import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/learning_outcome/learning_outcome_widget.dart';
import '/payment/skill_gapanalysis/skill_gapanalysis_widget.dart';
import '/payment/subscription/subscription_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/admob_util.dart' as admob;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getUser)] action in Home_page widget.
  ApiCallResponse? user;
  // Stores action output result for [Backend Call - API (getHighestScorer)] action in Home_page widget.
  ApiCallResponse? scorer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
