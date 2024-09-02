import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/profile/logout/logout_widget.dart';
import '/payment/subscription/subscription_widget.dart';
import 'dart:async';
import 'dart:math';
import 'buddy_account_widget.dart' show BuddyAccountWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class BuddyAccountModel extends FlutterFlowModel<BuddyAccountWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (deactivateAccount)] action in Container widget.
  ApiCallResponse? deleteAccount;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
