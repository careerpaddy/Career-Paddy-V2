import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'congrats_challenge_model.dart';
export 'congrats_challenge_model.dart';

class CongratsChallengeWidget extends StatefulWidget {
  const CongratsChallengeWidget({super.key});

  @override
  State<CongratsChallengeWidget> createState() =>
      _CongratsChallengeWidgetState();
}

class _CongratsChallengeWidgetState extends State<CongratsChallengeWidget> {
  late CongratsChallengeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CongratsChallengeModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Congrats_challenge'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: Lottie.asset(
                  'assets/lottie_animations/Animation_-_1698402269457.json',
                  width: 150.0,
                  height: 130.0,
                  fit: BoxFit.cover,
                  repeat: false,
                  animate: true,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Gold.png',
                            width: 160.0,
                            height: 160.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'hkxnl34h' /* Congratulations! You finished ... */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Recolta Alt',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
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
                                  'CONGRATS_CHALLENGE_CONVERT_POINTS_TO_REW');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed('BuddyAccount');

                              logFirebaseEvent('Button_play_sound');
                              _model.soundPlayer1 ??= AudioPlayer();
                              if (_model.soundPlayer1!.playing) {
                                await _model.soundPlayer1!.stop();
                              }
                              _model.soundPlayer1!.setVolume(1.0);
                              _model.soundPlayer1!
                                  .setAsset('assets/audios/button_click_1.mp3')
                                  .then((_) => _model.soundPlayer1!.play());
                            },
                            text: FFLocalizations.of(context).getText(
                              'n7zcqhes' /* Convert points to reward */,
                            ),
                            options: FFButtonOptions(
                              width: 1000.0,
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF1771DF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Recolta Alt',
                                    color: FlutterFlowTheme.of(context).white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CONGRATS_CHALLENGE_CONTINUE_LEARNING_BTN');
                            logFirebaseEvent('Button_play_sound');
                            _model.soundPlayer2 ??= AudioPlayer();
                            if (_model.soundPlayer2!.playing) {
                              await _model.soundPlayer2!.stop();
                            }
                            _model.soundPlayer2!.setVolume(1.0);
                            _model.soundPlayer2!
                                .setAsset('assets/audios/button_click_1.mp3')
                                .then((_) => _model.soundPlayer2!.play());

                            logFirebaseEvent('Button_navigate_to');

                            context.goNamed('Home_page');
                          },
                          text: FFLocalizations.of(context).getText(
                            '9jg61y8y' /* Continue learning */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Recolta Alt',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ].divide(SizedBox(height: 48.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
