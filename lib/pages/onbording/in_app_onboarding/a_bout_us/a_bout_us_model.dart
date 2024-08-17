import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'a_bout_us_widget.dart' show ABoutUsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ABoutUsModel extends FlutterFlowModel<ABoutUsWidget> {
  ///  Local state fields for this page.

  String image =
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw4fHxmYWNlfGVufDB8fHx8MTY5NzYzMTY0OHww&ixlib=rb-4.0.3&q=80&w=1080';

  List<String> methods = [];
  void addToMethods(String item) => methods.add(item);
  void removeFromMethods(String item) => methods.remove(item);
  void removeAtIndexFromMethods(int index) => methods.removeAt(index);
  void insertAtIndexInMethods(int index, String item) =>
      methods.insert(index, item);
  void updateMethodsAtIndex(int index, Function(String) updateFn) =>
      methods[index] = updateFn(methods[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
