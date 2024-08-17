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

import 'dart:async';

import 'package:count_down_time/count_down_time.dart';
import '../../pages/quiz/times_up/times_up_widget.dart';

import 'package:just_audio/just_audio.dart';

class CountDown extends StatefulWidget {
  const CountDown({
    super.key,
    this.width,
    this.height,
    required this.seconds,
    required this.batchId,
    this.fontSize,
    this.color,
  });

  final double? width;
  final double? height;
  final int seconds;
  final double? fontSize;
  final Color? color;
  final String batchId;

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> with WidgetsBindingObserver {
  bool isPlaying = false;
  var soundPlayer = AudioPlayer();
  Timer? _dialogTimer;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
    soundPlayer.setUrl(
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/career-paddy-duplicate-gdbxj3/assets/i6k6qzbngg4k/time_up.mp3',
    );

    _dialogTimer = Timer(Duration(seconds: widget.seconds + 2), () {
      var timerEnabled = FFAppState().timerEnabled;
      var matches = widget.batchId == FFAppState().batchId;

      if (mounted && timerEnabled && matches) {
        soundPlayer.stop();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0, 0)
                  .resolve(Directionality.of(context)),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.55,
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: TimesUpWidget(),
              ),
            );
          },
        ).then((value) => setState(() {}));
      }

      _dialogTimer?.cancel();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.hidden || !mounted) {
      soundPlayer.pause();
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    soundPlayer.dispose();
    _dialogTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: CountDownTime(
        textStyle: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w500,
          color: widget.color,
        ),
        timeStartInSeconds: widget.seconds,
        onChangeTime: (time) async {
          print(time);
          if (time == 4 && !isPlaying) {
            isPlaying = true;
            if (soundPlayer.playing) {
              await soundPlayer.stop();
            }
            // await soundPlayer.setAsset('assets/audios/time_up.mp3');
            await soundPlayer.setVolume(1);

            await soundPlayer.setLoopMode(LoopMode.one);

            var timerEnabled = FFAppState().timerEnabled;
            var matches = widget.batchId == FFAppState().batchId;

            if (mounted && timerEnabled && matches) {
              await soundPlayer.play();
            }
          }
        },
        onTimeOut: () {},
      ),
    );
  }
}
