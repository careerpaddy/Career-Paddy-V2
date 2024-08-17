import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/admob_util.dart' as admob;
import 'home_page_copy_widget.dart' show HomePageCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageCopyModel extends FlutterFlowModel<HomePageCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getUser)] action in Home_pageCopy widget.
  ApiCallResponse? user;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
