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

import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinLoader extends StatefulWidget {
  const SpinLoader({
    Key? key,
    this.width,
    this.height,
    required this.size,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double size;

  @override
  _SpinLoaderState createState() => _SpinLoaderState();
}

class _SpinLoaderState extends State<SpinLoader> {
  @override
  Widget build(BuildContext context) {
    return SpinKitDoubleBounce(
      color: Colors.white,
      size: widget.size ?? 50.0,
    );
  }
}
