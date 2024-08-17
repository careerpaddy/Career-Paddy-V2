import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'primary_button_component_model.dart';
export 'primary_button_component_model.dart';

class PrimaryButtonComponentWidget extends StatefulWidget {
  const PrimaryButtonComponentWidget({super.key});

  @override
  State<PrimaryButtonComponentWidget> createState() =>
      _PrimaryButtonComponentWidgetState();
}

class _PrimaryButtonComponentWidgetState
    extends State<PrimaryButtonComponentWidget> with TickerProviderStateMixin {
  late PrimaryButtonComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrimaryButtonComponentModel());

    animationsMap.addAll({
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
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
        onPressed: () {
          print('Button pressed ...');
        },
        text: FFLocalizations.of(context).getText(
          '4sjwd3ud' /* Login */,
        ),
        options: FFButtonOptions(
          height: 48.0,
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: FlutterFlowTheme.of(context).primary,
          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Recolta Alt',
                color: Colors.white,
                letterSpacing: 0.0,
                useGoogleFonts: false,
              ),
          elevation: 0.0,
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 5.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
          hoverColor: Colors.white,
          hoverTextColor: Color(0xFF003399),
          hoverElevation: 0.0,
        ),
      ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation']!),
    );
  }
}
