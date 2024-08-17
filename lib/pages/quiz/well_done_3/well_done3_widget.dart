import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'well_done3_model.dart';
export 'well_done3_model.dart';

class WellDone3Widget extends StatefulWidget {
  const WellDone3Widget({
    super.key,
    this.option,
  });

  final OptionsRow? option;

  @override
  State<WellDone3Widget> createState() => _WellDone3WidgetState();
}

class _WellDone3WidgetState extends State<WellDone3Widget> {
  late WellDone3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WellDone3Model());
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
      height: 550.0,
      decoration: BoxDecoration(
        color: Color(0xFF3F0D67),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'qo62syrc' /* Keep Rocking (Name)! */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Recolta Alt',
                          color: FlutterFlowTheme.of(context).white,
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: 300.0,
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Music.png',
                      width: 200.0,
                      height: 210.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '913i9e9u' /* Don't stop learning and assess... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Recolta Alt',
                          color: FlutterFlowTheme.of(context).white,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.0,
                    color: Color(0xFFA261D0),
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
                  logFirebaseEvent('WELL_DONE_3_CONTINUE_LEARNING_BTN_ON_TAP');
                  logFirebaseEvent('Button_play_sound');
                  _model.soundPlayer ??= AudioPlayer();
                  if (_model.soundPlayer!.playing) {
                    await _model.soundPlayer!.stop();
                  }
                  _model.soundPlayer!.setVolume(1.0);
                  _model.soundPlayer!
                      .setAsset('assets/audios/time_up.mp3')
                      .then((_) => _model.soundPlayer!.play());
                },
                text: FFLocalizations.of(context).getText(
                  'vskp86o6' /* Continue learning */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 48.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFC07BF2),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Recolta Alt',
                        color: FlutterFlowTheme.of(context).black,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ].divide(SizedBox(height: 48.0)),
        ),
      ),
    );
  }
}
