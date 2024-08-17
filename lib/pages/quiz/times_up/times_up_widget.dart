import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/payment/subscription/subscription_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'times_up_model.dart';
export 'times_up_model.dart';

class TimesUpWidget extends StatefulWidget {
  const TimesUpWidget({super.key});

  @override
  State<TimesUpWidget> createState() => _TimesUpWidgetState();
}

class _TimesUpWidgetState extends State<TimesUpWidget> {
  late TimesUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimesUpModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AppUsersRow>>(
      future: AppUsersTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 45.0,
              height: 45.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<AppUsersRow> bottomSheetEditAppUsersRowList = snapshot.data!;

        final bottomSheetEditAppUsersRow =
            bottomSheetEditAppUsersRowList.isNotEmpty
                ? bottomSheetEditAppUsersRowList.first
                : null;

        return Container(
          width: double.infinity,
          height: 470.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('TIMES_UP_COMP_Column_jmj8ovfq_ON_TAP');
                logFirebaseEvent('Column_update_app_state');
                FFAppState().batchId = 0;
                setState(() {});
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Frame_(1).png',
                            width: 160.0,
                            height: 180.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '7m9tfqkw' /* Your time is up */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Recolta Alt',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ].divide(SizedBox(height: 4.0)),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: Color(0xFF0B61CB),
                              offset: Offset(
                                0.0,
                                3.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'TIMES_UP_COMP_BACK_TO_HOME_BTN_ON_TAP');
                            logFirebaseEvent('Button_update_app_state');
                            FFAppState().isDialogShown = false;
                            setState(() {});
                            logFirebaseEvent('Button_close_dialog_drawer_etc');
                            Navigator.pop(context);
                            logFirebaseEvent('Button_navigate_to');
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed('Home_page');
                          },
                          text: FFLocalizations.of(context).getText(
                            'tckebs70' /* Back to Home */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Recolta Alt',
                                  color: FlutterFlowTheme.of(context).white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                            borderSide: BorderSide(
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                  if (bottomSheetEditAppUsersRow?.timerEnabled == true)
                    Builder(
                      builder: (context) => Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 30.0, 0.0, 12.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'TIMES_UP_COMP_Text_ty7nwua3_ON_TAP');
                            if ((bottomSheetEditAppUsersRow?.timerEnabled ==
                                    true) &&
                                (bottomSheetEditAppUsersRow?.plan == 'Free')) {
                              logFirebaseEvent('Text_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.7,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: SubscriptionWidget(),
                                    ),
                                  );
                                },
                              );
                            } else {
                              logFirebaseEvent('Text_backend_call');
                              await AppUsersTable().update(
                                data: {
                                  'timerEnabled': true,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  currentUserUid,
                                ),
                              );
                              logFirebaseEvent('Text_close_dialog_drawer_etc');
                              Navigator.pop(context);
                              logFirebaseEvent('Text_navigate_to');

                              context.pushNamed('Home_page');
                            }
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'm5u2bmrn' /* Turn of the timer */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Recolta Alt',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
