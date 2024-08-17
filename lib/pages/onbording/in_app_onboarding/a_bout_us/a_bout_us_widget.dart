import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_bout_us_model.dart';
export 'a_bout_us_model.dart';

class ABoutUsWidget extends StatefulWidget {
  const ABoutUsWidget({
    super.key,
    bool? isEdit,
    this.image,
  }) : this.isEdit = isEdit ?? false;

  final bool isEdit;
  final String? image;

  @override
  State<ABoutUsWidget> createState() => _ABoutUsWidgetState();
}

class _ABoutUsWidgetState extends State<ABoutUsWidget> {
  late ABoutUsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ABoutUsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ABout_us'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('A_BOUT_US_PAGE_ABout_us_ON_INIT_STATE');
      logFirebaseEvent('ABout_us_update_page_state');
      _model.addToMethods('Social Media Ad');
      logFirebaseEvent('ABout_us_update_page_state');
      _model.addToMethods('Friends');
      await Future.wait([
        Future(() async {
          logFirebaseEvent('ABout_us_update_page_state');
          _model.addToMethods('My organizations');
          setState(() {});
        }),
        Future(() async {
          logFirebaseEvent('ABout_us_update_page_state');
          _model.addToMethods('Others');
          setState(() {});
        }),
      ]);
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
                              'g2a2tjzb' /* How did you hear about Us? */,
                            ),
                            textAlign: TextAlign.center,
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
                          Builder(
                            builder: (context) {
                              final options = _model.methods.toList();

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(options.length,
                                    (optionsIndex) {
                                  final optionsItem = options[optionsIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'A_BOUT_US_PAGE_options_ON_TAP');
                                      logFirebaseEvent(
                                          'options_update_app_state');
                                      FFAppState().hearus = optionsItem;
                                      setState(() {});
                                      logFirebaseEvent('options_wait__delay');
                                      await Future.delayed(
                                          const Duration(milliseconds: 1600));
                                      logFirebaseEvent('options_navigate_to');

                                      context.pushNamed('Name');
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 0.0,
                                            color: FlutterFlowTheme.of(context)
                                                .border,
                                            offset: Offset(
                                              2.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        border: Border.all(
                                          color: valueOrDefault<Color>(
                                            optionsItem == FFAppState().hearus
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 16.0, 10.0, 16.0),
                                        child: Text(
                                          optionsItem,
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
                                  );
                                }).divide(SizedBox(height: 16.0)),
                              );
                            },
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
                        color: FlutterFlowTheme.of(context).buttonDropShadow,
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
