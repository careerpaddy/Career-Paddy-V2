// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;

Future linkOneSignal() async {
  if (Platform.isAndroid) {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    OneSignal.initialize("fd764e96-c0ac-449d-8a30-5ff624791f82");

    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    if (androidInfo.version.sdkInt < 28) {
      await FirebaseMessaging.instance.requestPermission();
    } else {
      OneSignal.Notifications.requestPermission(true);
    }
  }

  if (Platform.isIOS) {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    OneSignal.initialize("fd764e96-c0ac-449d-8a30-5ff624791f82");

    OneSignal.Notifications.requestPermission(true);
  }
}
