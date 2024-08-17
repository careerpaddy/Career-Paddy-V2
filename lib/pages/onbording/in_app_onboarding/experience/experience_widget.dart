import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'experience_model.dart';
export 'experience_model.dart';

class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget({
    super.key,
    bool? isEdit,
    this.image,
  }) : this.isEdit = isEdit ?? false;

  final bool isEdit;
  final String? image;

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
  late ExperienceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExperienceModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Experience'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EXPERIENCE_PAGE_Experience_ON_INIT_STATE');
      if (widget!.isEdit) {
        logFirebaseEvent('Experience_update_page_state');
        _model.image = widget!.image!;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'o8dwu1co' /* Years of working experience */,
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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'EXPERIENCE_PAGE_options_ON_TAP');
                                  logFirebaseEvent('options_play_sound');
                                  _model.soundPlayer1 ??= AudioPlayer();
                                  if (_model.soundPlayer1!.playing) {
                                    await _model.soundPlayer1!.stop();
                                  }
                                  _model.soundPlayer1!.setVolume(1.0);
                                  _model.soundPlayer1!
                                      .setAsset(
                                          'assets/audios/button_click_1.mp3')
                                      .then((_) => _model.soundPlayer1!.play());

                                  logFirebaseEvent('options_backend_call');
                                  await AppUsersTable().insert({
                                    'id': currentUserUid,
                                    'full_name': FFAppState().fullname,
                                    'email': FFAppState().email,
                                    'experience': FFAppState().experience,
                                    'bio': FFAppState().bio,
                                    'status': FFAppState().status,
                                    'type': 'buddy',
                                    'streak_days': [],
                                    'image': FFAppState().image,
                                  });
                                  logFirebaseEvent('options_navigate_to');

                                  context.pushNamed('Quotes7');
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.0,
                                        color:
                                            FlutterFlowTheme.of(context).border,
                                        offset: Offset(
                                          2.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).border,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 16.0, 10.0, 16.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'vx5mkl7g' /* 0 - 2 years */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Recolta Alt',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'EXPERIENCE_PAGE_options_ON_TAP');
                                  logFirebaseEvent('options_play_sound');
                                  _model.soundPlayer2 ??= AudioPlayer();
                                  if (_model.soundPlayer2!.playing) {
                                    await _model.soundPlayer2!.stop();
                                  }
                                  _model.soundPlayer2!.setVolume(1.0);
                                  _model.soundPlayer2!
                                      .setAsset(
                                          'assets/audios/button_click_1.mp3')
                                      .then((_) => _model.soundPlayer2!.play());

                                  logFirebaseEvent('options_backend_call');
                                  await AppUsersTable().insert({
                                    'id': currentUserUid,
                                    'full_name': FFAppState().fullname,
                                    'email': FFAppState().email,
                                    'experience': FFAppState().experience,
                                    'bio': FFAppState().bio,
                                    'status': FFAppState().status,
                                    'type': 'buddy',
                                    'streak_days': [],
                                    'image': FFAppState().image,
                                  });
                                  logFirebaseEvent('options_navigate_to');

                                  context.pushNamed('Quotes7');
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.0,
                                        color:
                                            FlutterFlowTheme.of(context).border,
                                        offset: Offset(
                                          2.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).border,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 16.0, 10.0, 16.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'kd6bxxuq' /* 3 - 6 years */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Recolta Alt',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'EXPERIENCE_PAGE_options_ON_TAP');
                                  logFirebaseEvent('options_play_sound');
                                  _model.soundPlayer3 ??= AudioPlayer();
                                  if (_model.soundPlayer3!.playing) {
                                    await _model.soundPlayer3!.stop();
                                  }
                                  _model.soundPlayer3!.setVolume(1.0);
                                  _model.soundPlayer3!
                                      .setAsset(
                                          'assets/audios/button_click_1.mp3')
                                      .then((_) => _model.soundPlayer3!.play());

                                  logFirebaseEvent('options_backend_call');
                                  await AppUsersTable().insert({
                                    'id': currentUserUid,
                                    'full_name': FFAppState().fullname,
                                    'email': FFAppState().email,
                                    'experience': FFAppState().experience,
                                    'bio': FFAppState().bio,
                                    'status': FFAppState().status,
                                    'type': 'buddy',
                                    'streak_days': [],
                                    'image': FFAppState().image,
                                  });
                                  logFirebaseEvent('options_navigate_to');

                                  context.pushNamed('Quotes7');
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.0,
                                        color:
                                            FlutterFlowTheme.of(context).border,
                                        offset: Offset(
                                          2.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).border,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 16.0, 10.0, 16.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '6wxu9a1d' /* 7 - 10 years */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Recolta Alt',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'EXPERIENCE_PAGE_options_ON_TAP');
                                  logFirebaseEvent('options_play_sound');
                                  _model.soundPlayer4 ??= AudioPlayer();
                                  if (_model.soundPlayer4!.playing) {
                                    await _model.soundPlayer4!.stop();
                                  }
                                  _model.soundPlayer4!.setVolume(1.0);
                                  _model.soundPlayer4!
                                      .setAsset(
                                          'assets/audios/button_click_1.mp3')
                                      .then((_) => _model.soundPlayer4!.play());

                                  logFirebaseEvent('options_backend_call');
                                  await AppUsersTable().insert({
                                    'id': currentUserUid,
                                    'full_name': FFAppState().fullname,
                                    'email': FFAppState().email,
                                    'experience': FFAppState().experience,
                                    'bio': FFAppState().bio,
                                    'status': FFAppState().status,
                                    'type': 'buddy',
                                    'streak_days': [],
                                    'image': FFAppState().image,
                                  });
                                  logFirebaseEvent('options_navigate_to');

                                  context.pushNamed('Quotes7');
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.0,
                                        color:
                                            FlutterFlowTheme.of(context).border,
                                        offset: Offset(
                                          2.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).border,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 16.0, 10.0, 16.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'vfzz3bjw' /* 11 years & above  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Recolta Alt',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
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
                ),
              ].divide(SizedBox(height: 32.0)),
            ),
          ),
        ),
      ),
    );
  }
}
