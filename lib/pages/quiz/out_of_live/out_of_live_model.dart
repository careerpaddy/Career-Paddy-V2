import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/payment/subscription/subscription_widget.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'out_of_live_widget.dart' show OutOfLiveWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class OutOfLiveModel extends FlutterFlowModel<OutOfLiveWidget> {
  ///  State fields for stateful widgets in this component.

  AudioPlayer? soundPlayer;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Text widget.
  bool? interstitialAdSuccess;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
