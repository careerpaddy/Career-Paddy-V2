// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:super_tooltip/super_tooltip.dart';
import './module_tooltip.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import '../../pages/quiz/download_badge/download_badge_widget.dart';

class BadgeTile extends StatefulWidget {
  const BadgeTile({
    super.key,
    this.width,
    this.height,
    required this.lesson,
    required this.userId,
  });

  final double? width;
  final double? height;
  final LessonsRow lesson;
  final String userId;

  @override
  State<BadgeTile> createState() => _BadgeTileState();
}

class _BadgeTileState extends State<BadgeTile> {
  bool isCompleted = false;
  var supabase = Supabase.instance;
  final _controller = SuperTooltipController();

  @override
  void initState() {
    getCompletedCount();
    super.initState();
  }

  getCompletedCount() async {
    var id = widget.lesson.v2BatchesId.last;
    var res = await supabase.client
        .from('completed')
        .select()
        .eq('user_id', widget.userId)
        .eq('lesson_id', widget.lesson.id)
        .eq('question_batch', id);

    if (res.length > 0) {
      setState(() {
        isCompleted = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        if (_controller.isVisible) {
          await _controller.hideTooltip();
          return;
        }
        return;
      },
      child: GestureDetector(
        onTap: () async {
          if (isCompleted) {
            await _controller.showTooltip();
          } else {
            showToast(
              "Finish the course to unlock your badge!",
              context: context,
            );
          }
        },
        child: SuperTooltip(
          controller: _controller,
          popupDirection: TooltipDirection.down,
          left: 30,
          right: 30,
          shadowColor: Colors.transparent,
          barrierColor: Colors.transparent,
          closeButtonColor: Colors.transparent,
          arrowTipDistance: 15.0,
          arrowBaseWidth: 20.0,
          hideTooltipOnTap: true,
          arrowLength: 20.0,
          backgroundColor: isCompleted
              ? HexColor(widget.lesson.v2Color!)
              : Colors.transparent,
          constraints: const BoxConstraints(
            minHeight: 0.0,
            maxHeight: 140,
            minWidth: 0.0,
            maxWidth: 100,
          ),
          showCloseButton: false,
          touchThroughAreaShape: ClipAreaShape.rectangle,
          touchThroughAreaCornerRadius: 30,
          hasShadow: false,
          content: isCompleted
              ? DownloadBadgeWidget(lesson: widget.lesson)
              : const SizedBox.shrink(),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: isCompleted
                      ? FlutterFlowTheme.of(context).gray50
                      : FlutterFlowTheme.of(context).courseRingShadow,
                  offset: Offset(0, 4),
                )
              ],
              shape: BoxShape.circle,
              border: Border.all(
                color: isCompleted
                    ? HexColor(widget.lesson.v2Color!)
                    : FlutterFlowTheme.of(context).gray200,
                width: 4,
              ),
            ),
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: isCompleted
                    ? HexColor(widget.lesson.v2Color!)
                    : FlutterFlowTheme.of(context).gray100,
                shape: BoxShape.circle,
              ),
              alignment: AlignmentDirectional(0, 0),
              child: FaIcon(
                FontAwesomeIcons.trophy,
                color: isCompleted
                    ? FlutterFlowTheme.of(context).white
                    : FlutterFlowTheme.of(context).gray300,
                size: 48,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
