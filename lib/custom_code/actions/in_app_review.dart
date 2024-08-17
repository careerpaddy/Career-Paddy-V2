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

import 'package:rate_my_app/rate_my_app.dart';

Future inAppReview(BuildContext context) async {
  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 0,
    minLaunches: 2,
    remindDays: 5,
    remindLaunches: 4,
    googlePlayIdentifier: 'com.careerpaddy.CareerPaddy',
    appStoreIdentifier: '6447822253',
  );

  await rateMyApp.init();

  if (rateMyApp.shouldOpenDialog) {
    rateMyApp.showRateDialog(context);
  }

  return;
}
