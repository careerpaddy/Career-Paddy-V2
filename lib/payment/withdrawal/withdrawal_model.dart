import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'withdrawal_widget.dart' show WithdrawalWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WithdrawalModel extends FlutterFlowModel<WithdrawalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  // State field(s) for accout_number widget.
  FocusNode? accoutNumberFocusNode;
  TextEditingController? accoutNumberTextController;
  String? Function(BuildContext, String?)? accoutNumberTextControllerValidator;
  // State field(s) for account_name widget.
  FocusNode? accountNameFocusNode;
  TextEditingController? accountNameTextController;
  String? Function(BuildContext, String?)? accountNameTextControllerValidator;
  // State field(s) for Available_times widget.
  String? availableTimesValue;
  FormFieldController<String>? availableTimesValueController;
  // Stores action output result for [Backend Call - API (verifyBankAccount)] action in Available_times widget.
  ApiCallResponse? apiResultdca;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (withdrawPoints)] action in Button widget.
  ApiCallResponse? apiResulttqm;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    amountFocusNode?.dispose();
    amountTextController?.dispose();

    accoutNumberFocusNode?.dispose();
    accoutNumberTextController?.dispose();

    accountNameFocusNode?.dispose();
    accountNameTextController?.dispose();
  }
}
