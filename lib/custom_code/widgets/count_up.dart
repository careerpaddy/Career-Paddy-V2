// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:mccounting_text/mccounting_text.dart';

class CountUp extends StatefulWidget {
  const CountUp({
    super.key,
    this.width,
    this.height,
    required this.total,
  });

  final double? width;
  final double? height;
  final int total;

  @override
  State<CountUp> createState() => _CountUpState();
}

class _CountUpState extends State<CountUp> {
  @override
  Widget build(BuildContext context) {
    return McCountingText(
      begin: 0,
      end: 30,
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Recolta Alt',
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 64,
            letterSpacing: 0,
            fontWeight: FontWeight.w600,
            useGoogleFonts: false,
          ),
    );
  }
}
