import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/payment/payment_success/payment_success_widget.dart';
import 'payment_successful_widget.dart' show PaymentSuccessfulWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentSuccessfulModel extends FlutterFlowModel<PaymentSuccessfulWidget> {
  ///  Local state fields for this page.

  SubscriptionsRow? subscription;

  ///  State fields for stateful widgets in this page.

  // Model for PaymentSuccess component.
  late PaymentSuccessModel paymentSuccessModel;

  @override
  void initState(BuildContext context) {
    paymentSuccessModel = createModel(context, () => PaymentSuccessModel());
  }

  @override
  void dispose() {
    paymentSuccessModel.dispose();
  }
}
