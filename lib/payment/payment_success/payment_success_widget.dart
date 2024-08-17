import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_success_model.dart';
export 'payment_success_model.dart';

class PaymentSuccessWidget extends StatefulWidget {
  const PaymentSuccessWidget({
    super.key,
    required this.subscription,
  });

  final SubscriptionsRow? subscription;

  @override
  State<PaymentSuccessWidget> createState() => _PaymentSuccessWidgetState();
}

class _PaymentSuccessWidgetState extends State<PaymentSuccessWidget> {
  late PaymentSuccessModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentSuccessModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 30.0,
                  borderWidth: 0.0,
                  buttonSize: 48.0,
                  fillColor: FlutterFlowTheme.of(context).gray200,
                  icon: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 25.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'PAYMENT_SUCCESS_close_rounded_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_close_dialog_drawer_etc');
                    Navigator.pop(context);
                    logFirebaseEvent('IconButton_navigate_to');

                    context.pushNamed('Home_page');
                  },
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Icon(
                    FFIcons.kcheckmarkCircle03,
                    color: FlutterFlowTheme.of(context).accent2,
                    size: 96.0,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'a36gwkwx' /* Payment Confirmed! */,
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Recolta Alt',
                            color: FlutterFlowTheme.of(context).gray900,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'd9kb2526' /* Your payment has been confirme... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Recolta Alt',
                            color: FlutterFlowTheme.of(context).gray600,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                            lineHeight: 1.4,
                          ),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
              ].divide(SizedBox(height: 32.0)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'PAYMENT_SUCCESS_BACK_TO_HOME_BTN_ON_TAP');
                      logFirebaseEvent('Button_close_dialog_drawer_etc');
                      Navigator.pop(context);
                      logFirebaseEvent('Button_navigate_to');
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed('Home_page');
                    },
                    text: FFLocalizations.of(context).getText(
                      '6hcrksy8' /* Back to home */,
                    ),
                    options: FFButtonOptions(
                      height: 44.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: 'Recolta Alt',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ],
              ),
            ),
          ].divide(SizedBox(height: 24.0)),
        ),
      ),
    );
  }
}
