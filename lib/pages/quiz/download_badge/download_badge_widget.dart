import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/payment/subscription/subscription_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'download_badge_model.dart';
export 'download_badge_model.dart';

class DownloadBadgeWidget extends StatefulWidget {
  const DownloadBadgeWidget({
    super.key,
    required this.lesson,
  });

  final LessonsRow? lesson;

  @override
  State<DownloadBadgeWidget> createState() => _DownloadBadgeWidgetState();
}

class _DownloadBadgeWidgetState extends State<DownloadBadgeWidget> {
  late DownloadBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DownloadBadgeModel());
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
      height: MediaQuery.sizeOf(context).height * 0.2,
      decoration: BoxDecoration(
        color: colorFromCssString(
          widget!.lesson!.v2Color!,
          defaultColor: Colors.black,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget!.lesson?.name,
                        'Active listening',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Recolta Alt',
                            color: FlutterFlowTheme.of(context).white,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'nfui3hmw' /* Your badge is ready!!! */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Recolta Alt',
                            color: FlutterFlowTheme.of(context).white,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
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
                        color: colorFromCssString(
                          widget!.lesson!.v2Color!,
                          defaultColor: Colors.black,
                        ),
                        offset: Offset(
                          0.0,
                          3.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Builder(
                    builder: (context) => FutureBuilder<List<AppUsersRow>>(
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
                        List<AppUsersRow> buttonAppUsersRowList =
                            snapshot.data!;

                        final buttonAppUsersRow =
                            buttonAppUsersRowList.isNotEmpty
                                ? buttonAppUsersRowList.first
                                : null;

                        return FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'DOWNLOAD_BADGE_COMP_DOWNLOAD_BTN_ON_TAP');
                            var _shouldSetState = false;
                            logFirebaseEvent('Button_play_sound');
                            _model.soundPlayer ??= AudioPlayer();
                            if (_model.soundPlayer!.playing) {
                              await _model.soundPlayer!.stop();
                            }
                            _model.soundPlayer!.setVolume(1.0);
                            _model.soundPlayer!
                                .setAsset('assets/audios/button_click_1.mp3')
                                .then((_) => _model.soundPlayer!.play());

                            if (buttonAppUsersRow?.plan == 'Free') {
                              logFirebaseEvent(
                                  'Button_close_dialog_drawer_etc');
                              Navigator.pop(context);
                              logFirebaseEvent('Button_alert_dialog');
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
                                              0.95,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: SubscriptionWidget(),
                                    ),
                                  );
                                },
                              );

                              if (_shouldSetState) setState(() {});
                              return;
                            }
                            logFirebaseEvent('Button_backend_call');
                            _model.apiResultv6s = await DownloadBadgeCall.call(
                              lessonId: widget!.lesson?.id,
                              courseName: widget!.lesson?.name,
                              uid: currentUserUid,
                            );

                            _shouldSetState = true;
                            if ((_model.apiResultv6s?.succeeded ?? true)) {
                              logFirebaseEvent('Button_launch_u_r_l');
                              await launchURL(DownloadBadgeCall.url(
                                (_model.apiResultv6s?.jsonBody ?? ''),
                              )!);
                            } else {
                              logFirebaseEvent('Button_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'An error occurred. Try again later',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                            }

                            if (_shouldSetState) setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'xm2rtfv7' /* Download */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).white,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Recolta Alt',
                                  color: colorFromCssString(
                                    widget!.lesson!.v2Color!,
                                    defaultColor: Colors.black,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ],
        ),
      ),
    );
  }
}
