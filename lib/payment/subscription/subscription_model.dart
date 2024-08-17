import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'subscription_widget.dart' show SubscriptionWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class SubscriptionModel extends FlutterFlowModel<SubscriptionWidget> {
  ///  State fields for stateful widgets in this component.

  AudioPlayer? soundPlayer;
  // Stores action output result for [RevenueCat - Purchase] action in pay widget.
  bool? didPurchase;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
