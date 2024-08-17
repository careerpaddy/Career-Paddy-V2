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

class ModuleTile extends StatefulWidget {
  const ModuleTile({
    super.key,
    this.width,
    this.height,
    required this.index,
    required this.lesson,
    this.userId,
    this.isUnlocked = false,
  });

  final double? width;
  final double? height;
  final int index;
  final LessonsRow lesson;
  final String? userId;
  final bool isUnlocked;

  @override
  State<ModuleTile> createState() => _ModuleTileState();
}

class _ModuleTileState extends State<ModuleTile> {
  bool isCompleted = false;
  var supabase = Supabase.instance;
  int currentIndex = 1;
  bool isUnlocked = false;
  bool isScenario = false;

  final _controller = SuperTooltipController();

  @override
  void initState() {
    isUnlocked = widget.isUnlocked;

    getCompletedCount();
    getCurrentIndex();
    super.initState();
  }

  getIcon() {
    if (isUnlocked) {
      return FFIcons.klockOpen;
    }

    if (widget.index == 0) {
      return FFIcons.klockOpen;
    }

    if (isScenario) {
      return FFIcons.kchatBubbleLeftRight;
    }

    if (isCompleted) {
      return Icons.check_rounded;
    }

    return FFIcons.klockClosed;
  }

  getCurrentIndex() async {
    var id = widget.lesson.v2BatchesId[widget.index];

    var qbatch = await supabase.client
        .from('question batch')
        .select()
        .eq('id', id)
        .eq('lesson_id', widget.lesson.id);

    if (qbatch != null) {
      var data = qbatch.first;

      var first = data['isScenario'];

      isScenario = first;
      setState(() {});
    }

    try {
      var res = await supabase.client
          .from('module batch progress')
          .select()
          .eq('user_id', widget.userId)
          .eq('batch_id', id)
          .eq('lesson_id', widget.lesson.id);

      if (res.length == 0) {
        currentIndex = 1;
        isUnlocked = false;
        setState(() {});
      } else {
        var d = res.first;
        print(d);
        currentIndex = d['currentIndex'];
        isUnlocked = currentIndex >= 1;

        print(isUnlocked);

        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  getCompletedCount() async {
    var id = widget.lesson.v2BatchesId[widget.index];
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
          if (isCompleted || isUnlocked || (currentIndex - 1) >= widget.index) {
            await _controller.showTooltip();
          } else {
            showToast(
              "Finish the prevous tile to unlock this!",
              context: context,
            );
          }
        },
        child: SuperTooltip(
          controller: _controller,
          // borderColor: Colors.transparent,
          popupDirection: TooltipDirection.down,
          left: 30,
          right: 30,
          shadowColor: Colors.transparent,
          barrierColor: Colors.transparent,
          closeButtonColor: Colors.white,
          arrowTipDistance: 15.0,
          arrowBaseWidth: 20.0,
          hideTooltipOnTap: true,
          arrowLength: 20.0,
          backgroundColor:
              isCompleted || isUnlocked || (currentIndex - 1) >= widget.index
                  ? HexColor(widget.lesson.v2Color!)
                  : Colors.transparent,
          constraints: BoxConstraints(
            minHeight: MediaQuery.sizeOf(context).height * 0.28,
            maxHeight: MediaQuery.sizeOf(context).height * 0.33,
            minWidth: 0.0,
            maxWidth: 100,
          ),
          showCloseButton: false,
          touchThroughAreaShape: ClipAreaShape.rectangle,
          touchThroughAreaCornerRadius: 30,
          hasShadow: false,
          content: isCompleted ||
                  isUnlocked ||
                  (currentIndex - 1) >= widget.index
              ? Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.sizeOf(context).height * 0.28,
                    maxHeight: MediaQuery.sizeOf(context).height * 0.33,
                  ),
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          onPressed: () => _controller.hideTooltip(),
                        )
                      ]),
                      ModuleTooltip(
                        lesson: widget.lesson,
                        userId: widget.userId,
                        height: widget.height,
                        width: widget.width,
                        index: currentIndex,
                        batchId: widget.lesson.v2BatchesId[widget.index],
                        isScenario: isScenario,
                        action: () => _controller.hideTooltip(),
                      ),
                    ],
                  ))
              : const SizedBox.shrink(),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: isUnlocked || isCompleted
                      ? FlutterFlowTheme.of(context).gray50
                      : FlutterFlowTheme.of(context).courseRingShadow,
                  offset: Offset(
                    0,
                    4,
                  ),
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
                color: isCompleted ||
                        isUnlocked ||
                        widget.index == 0 ||
                        (currentIndex - 1) >= widget.index
                    ? HexColor(widget.lesson.v2Color!)
                    : FlutterFlowTheme.of(context).gray100,
                shape: BoxShape.circle,
              ),
              alignment: AlignmentDirectional(0, 0),
              child: isCompleted
                  ? Icon(
                      Icons.check_rounded,
                      color: (currentIndex - 1) >= widget.index || isCompleted
                          ? FlutterFlowTheme.of(context).white
                          : FlutterFlowTheme.of(context).gray300,
                      size: 48,
                    )
                  // ? FaIcon(
                  //     FontAwesomeIcons.trophy,
                  //     color: (currentIndex - 1) >= widget.index || isCompleted
                  //         ? FlutterFlowTheme.of(context).white
                  //         : FlutterFlowTheme.of(context).gray300,
                  //     size: 48,
                  //   )
                  : Icon(
                      getIcon(),
                      color: isUnlocked ||
                              (currentIndex - 1) >= widget.index ||
                              isCompleted
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
