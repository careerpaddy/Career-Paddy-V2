import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'unlimited_hearts_model.dart';
export 'unlimited_hearts_model.dart';

class UnlimitedHeartsWidget extends StatefulWidget {
  const UnlimitedHeartsWidget({super.key});

  @override
  State<UnlimitedHeartsWidget> createState() => _UnlimitedHeartsWidgetState();
}

class _UnlimitedHeartsWidgetState extends State<UnlimitedHeartsWidget> {
  late UnlimitedHeartsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnlimitedHeartsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Stack(
        alignment: AlignmentDirectional(0.0, 0.0),
        children: [
          Icon(
            Icons.favorite_rounded,
            color: FlutterFlowTheme.of(context).error,
            size: 20.0,
          ),
          FaIcon(
            FontAwesomeIcons.infinity,
            color: FlutterFlowTheme.of(context).white,
            size: 6.0,
          ),
        ],
      ),
    );
  }
}
