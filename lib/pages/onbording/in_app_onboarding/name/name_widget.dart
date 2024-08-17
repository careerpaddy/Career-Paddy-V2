import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'name_model.dart';
export 'name_model.dart';

class NameWidget extends StatefulWidget {
  const NameWidget({
    super.key,
    bool? isEdit,
    this.image,
  }) : this.isEdit = isEdit ?? false;

  final bool isEdit;
  final String? image;

  @override
  State<NameWidget> createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget> {
  late NameModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NameModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Name'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NAME_PAGE_Name_ON_INIT_STATE');
      if (widget!.isEdit) {
        logFirebaseEvent('Name_update_page_state');
        _model.image = widget!.image!;
        setState(() {});
      }
    });

    _model.fullNameTextController ??= TextEditingController();
    _model.fullNameFocusNode ??= FocusNode();
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'bqvezlcc' /* What should we call you? */,
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
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                      child: Builder(
                        builder: (context) {
                          if (FFAppState().image == null ||
                              FFAppState().image == '') {
                            return Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                shape: BoxShape.circle,
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'NAME_PAGE_Icon_c2ihihbc_ON_TAP');
                                  logFirebaseEvent(
                                      'Icon_upload_media_to_supabase');
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    storageFolderPath: 'users',
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    var downloadUrls = <String>[];
                                    try {
                                      showUploadMessage(
                                        context,
                                        'Uploading file...',
                                        showLoading: true,
                                      );
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();

                                      downloadUrls =
                                          await uploadSupabaseStorageFiles(
                                        bucketName: 'profile pics',
                                        selectedFiles: selectedMedia,
                                      );
                                    } finally {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      _model.isDataUploading = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl =
                                            downloadUrls.first;
                                      });
                                      showUploadMessage(context, 'Success!');
                                    } else {
                                      setState(() {});
                                      showUploadMessage(
                                          context, 'Failed to upload data');
                                      return;
                                    }
                                  }

                                  logFirebaseEvent('Icon_update_app_state');
                                  FFAppState().image = _model.uploadedFileUrl;
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.person_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 48.0,
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              width: 120.0,
                              height: 120.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                _model.uploadedFileUrl,
                                fit: BoxFit.cover,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    TextFormField(
                      controller: _model.fullNameTextController,
                      focusNode: _model.fullNameFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.fullNameTextController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Recolta Alt',
                                  color: FlutterFlowTheme.of(context).gray400,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'iuix1ele' /* Full Name (Jane West) */,
                        ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Recolta Alt',
                                  color: FlutterFlowTheme.of(context).gray400,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).border,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).gray50,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Recolta Alt',
                            color: FlutterFlowTheme.of(context).gray400,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                          ),
                      validator: _model.fullNameTextControllerValidator
                          .asValidator(context),
                    ),
                  ].divide(SizedBox(height: 5.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                      child: Checkbox(
                        value: _model.acceptValue ??= true,
                        onChanged: (newValue) async {
                          setState(() => _model.acceptValue = newValue!);
                          if (newValue!) {
                            logFirebaseEvent('NAME_PAGE_accept_ON_TOGGLE_ON');
                            logFirebaseEvent('accept_set_form_field');
                            setState(() {
                              _model.acceptValue = true;
                            });
                          } else {
                            logFirebaseEvent('NAME_PAGE_accept_ON_TOGGLE_OFF');
                            logFirebaseEvent('accept_set_form_field');
                            setState(() {
                              _model.acceptValue = false;
                            });
                          }
                        },
                        side: BorderSide(
                          width: 2,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: FlutterFlowTheme.of(context).info,
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width * 0.83,
                      ),
                      decoration: BoxDecoration(),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'zpeisucy' /* Note: This is the name that wi... */,
                        ),
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Recolta Alt',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ].divide(SizedBox(width: 4.0)),
                ),
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
                    onPressed: (_model.fullNameTextController.text == null ||
                            _model.fullNameTextController.text == '')
                        ? null
                        : () async {
                            logFirebaseEvent('NAME_PAGE_Next_ON_TAP');
                            if (_model.fullNameTextController.text != null &&
                                _model.fullNameTextController.text != '') {
                              if (_model.acceptValue!) {
                                logFirebaseEvent('Next_play_sound');
                                _model.soundPlayer ??= AudioPlayer();
                                if (_model.soundPlayer!.playing) {
                                  await _model.soundPlayer!.stop();
                                }
                                _model.soundPlayer!.setVolume(1.0);
                                _model.soundPlayer!
                                    .setAsset(
                                        'assets/audios/button_click_1.mp3')
                                    .then((_) => _model.soundPlayer!.play());
                              } else {
                                logFirebaseEvent('Next_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'You need to accept the requirement',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                );
                                return;
                              }

                              logFirebaseEvent('Next_update_app_state');
                              FFAppState().fullname =
                                  _model.fullNameTextController.text;
                              setState(() {});
                              logFirebaseEvent('Next_navigate_to');

                              context.pushNamed('Quotes');
                            }
                          },
                    text: FFLocalizations.of(context).getText(
                      '8o187xss' /* Continue */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 48.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Recolta Alt',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
