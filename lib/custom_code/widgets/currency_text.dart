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

// import '/backend/backend.dart';
// import '/backend/schema/structs/index.dart';

// import 'package:career_paddy_v2/payment/payment_successful/payment_successful_widget.dart';

import '../../auth/supabase_auth/auth_util.dart';
import '../../backend/api_requests/api_calls.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
// import '/custom_code/actions/index.dart' as actions;

class CurrencyText extends StatefulWidget {
  const CurrencyText({
    super.key,
    this.width,
    this.height,
    this.plan,
    required this.amount,
  });

  final double? width;
  final double? height;
  final double amount;
  final String? plan;

  @override
  State<CurrencyText> createState() => _CurrencyTextState();
}

class _CurrencyTextState extends State<CurrencyText> {
  String? text;

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        // logFirebaseEvent('SUBSCRIPTION_N25,000_YEAR_BTN_ON_TAP');
        // logFirebaseEvent('Button_close_dialog,_drawer,_etc');
        // // Navigator.pop(context);

        // var res = await PaystackCall.call(
        //   uid: currentUserUid,
        //   email: currentUserEmail,
        //   amount: widget.amount.toInt(),
        // );
        // if ((res?.succeeded ?? true)) {
        //   logFirebaseEvent('Button_custom_action');
        //   var success = await actions.paystackModal(
        //     context,
        //     currentUserEmail,
        //     PaystackCall.accessCode(
        //       (res.jsonBody ?? ''),
        //     )!,
        //     widget.amount.toInt(),
        //     widget.plan,
        //   );

        //   if (success) {
        //     Navigator.of(context).push(MaterialPageRoute(
        //         builder: (_) => const PaymentSuccessfulWidget()));
        //   }
        // }
      },
      text: text ?? 'N25,000/year',
      options: FFButtonOptions(
        height: 44,
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        color: FlutterFlowTheme.of(context).white,
        textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
              fontFamily: 'Recolta Alt',
              color: FlutterFlowTheme.of(context).primary,
              letterSpacing: 0,
              fontWeight: FontWeight.w500,
              useGoogleFonts: false,
            ),
        elevation: 0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
