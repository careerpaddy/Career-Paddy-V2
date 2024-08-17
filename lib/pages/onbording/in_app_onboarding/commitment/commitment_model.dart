import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'commitment_widget.dart' show CommitmentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class CommitmentModel extends FlutterFlowModel<CommitmentWidget> {
  ///  Local state fields for this page.

  String image =
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw4fHxmYWNlfGVufDB8fHx8MTY5NzYzMTY0OHww&ixlib=rb-4.0.3&q=80&w=1080';

  List<CommitmentStruct> commitments = [];
  void addToCommitments(CommitmentStruct item) => commitments.add(item);
  void removeFromCommitments(CommitmentStruct item) => commitments.remove(item);
  void removeAtIndexFromCommitments(int index) => commitments.removeAt(index);
  void insertAtIndexInCommitments(int index, CommitmentStruct item) =>
      commitments.insert(index, item);
  void updateCommitmentsAtIndex(
          int index, Function(CommitmentStruct) updateFn) =>
      commitments[index] = updateFn(commitments[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
