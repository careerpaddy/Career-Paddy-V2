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

import 'package:timer_count_down/timer_count_down.dart';

class TextManualCountDown extends StatefulWidget {
  const TextManualCountDown({
    super.key,
    this.width,
    this.height,
    required this.seconds,
  });

  final double? width;
  final double? height;
  final int seconds;

  @override
  State<TextManualCountDown> createState() => _TextManualCountDownState();
}

class _TextManualCountDownState extends State<TextManualCountDown> {
  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: widget.seconds,
      build: (BuildContext context, double time) => Text(
        time.toInt().toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 86,
          fontWeight: FontWeight.w600,
        ),
      ),
      interval: Duration(milliseconds: 100),
      onFinished: () {
        print('Timer is done!');
      },
    );
  }
}
