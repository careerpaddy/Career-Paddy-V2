import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/payment/payment_success/payment_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_successful_model.dart';
export 'payment_successful_model.dart';

class PaymentSuccessfulWidget extends StatefulWidget {
  const PaymentSuccessfulWidget({super.key});

  @override
  State<PaymentSuccessfulWidget> createState() =>
      _PaymentSuccessfulWidgetState();
}

class _PaymentSuccessfulWidgetState extends State<PaymentSuccessfulWidget> {
  late PaymentSuccessfulModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentSuccessfulModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PaymentSuccessful'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        top: true,
        child: wrapWithModel(
          model: _model.paymentSuccessModel,
          updateCallback: () => setState(() {}),
          child: PaymentSuccessWidget(
            subscription: _model.subscription!,
          ),
        ),
      ),
    );
  }
}
