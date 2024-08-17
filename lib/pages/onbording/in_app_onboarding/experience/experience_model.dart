import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'experience_widget.dart' show ExperienceWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class ExperienceModel extends FlutterFlowModel<ExperienceWidget> {
  ///  Local state fields for this page.

  String image =
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw4fHxmYWNlfGVufDB8fHx8MTY5NzYzMTY0OHww&ixlib=rb-4.0.3&q=80&w=1080';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
