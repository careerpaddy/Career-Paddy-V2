import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/payment/subscription/subscription_widget.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'out_of_live_model.dart';
export 'out_of_live_model.dart';

class OutOfLiveWidget extends StatefulWidget {
  const OutOfLiveWidget({
    super.key,
    this.option,
    required this.user,
  });

  final OptionsRow? option;
  final AppUsersRow? user;

  @override
  State<OutOfLiveWidget> createState() => _OutOfLiveWidgetState();
}

class _OutOfLiveWidgetState extends State<OutOfLiveWidget> {
  late OutOfLiveModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OutOfLiveModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 470.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
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
                          'siuoz2qa' /* You have run out of lives. */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Recolta Alt',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '3aepennq' /* Upgrade now to unlock access a... */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Recolta Alt',
                              color: FlutterFlowTheme.of(context).alternate,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
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
                  child: Builder(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'OUT_OF_LIVE_UPGRADE_ACCOUNT_BTN_ON_TAP');
                        logFirebaseEvent('Button_close_dialog_drawer_etc');
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
                                height: MediaQuery.sizeOf(context).height * 0.7,
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                child: SubscriptionWidget(),
                              ),
                            );
                          },
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        '3oo712p2' /* Upgrade Account */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                ),
                Builder(
                  builder: (context) => Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'OUT_OF_LIVE_COMP_Text_h5odu6tc_ON_TAP');
                        var _shouldSetState = false;
                        if ((widget!.user?.hasWatchAds == true) &&
                            (widget!.user?.isSemiPremium == false)) {
                          logFirebaseEvent('Text_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'You have already watched an ad',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).white,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              action: SnackBarAction(
                                label: 'Upgrade',
                                textColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.75,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          child: SubscriptionWidget(),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                          if (_shouldSetState) setState(() {});
                          return;
                        }
                        logFirebaseEvent('Text_play_sound');
                        _model.soundPlayer ??= AudioPlayer();
                        if (_model.soundPlayer!.playing) {
                          await _model.soundPlayer!.stop();
                        }
                        _model.soundPlayer!.setVolume(1.0);
                        _model.soundPlayer!
                            .setAsset('assets/audios/button_click_1.mp3')
                            .then((_) => _model.soundPlayer!.play());

                        logFirebaseEvent('Text_ad_mob');

                        admob.loadInterstitialAd(
                          "ca-app-pub-9984361883356487/1208986331",
                          "ca-app-pub-9984361883356487/2498017278",
                          false,
                        );

                        logFirebaseEvent('Text_ad_mob');

                        _model.interstitialAdSuccess =
                            await admob.showInterstitialAd();

                        _shouldSetState = true;
                        if (widget!.user!.isSemiPremium) {
                          logFirebaseEvent('Text_backend_call');
                          await AppUsersTable().update(
                            data: {
                              'lives': FFAppState().lives + 5,
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              currentUserUid,
                            ),
                          );
                        } else {
                          logFirebaseEvent('Text_backend_call');
                          await AppUsersTable().update(
                            data: {
                              'hasWatchAds': true,
                              'lives': FFAppState().lives + 2,
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              currentUserUid,
                            ),
                          );
                        }

                        logFirebaseEvent('Text_update_app_state');
                        FFAppState().lives = FFAppState().lives + 2;
                        setState(() {});
                        logFirebaseEvent('Text_close_dialog_drawer_etc');
                        Navigator.pop(context);
                        logFirebaseEvent('Text_navigate_to');

                        context.goNamed('Home_page');

                        if (_shouldSetState) setState(() {});
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'ff9t804r' /* Watch an Ad for extra hearts */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
              ].divide(SizedBox(height: 12.0)),
            ),
          ],
        ),
      ),
    );
  }
}
