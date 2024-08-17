import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'leaderboard_widget.dart' show LeaderboardWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LeaderboardModel extends FlutterFlowModel<LeaderboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getHighestScorer)] action in Leaderboard widget.
  ApiCallResponse? apiResultzqf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
