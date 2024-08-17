import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'withdrawal_model.dart';
export 'withdrawal_model.dart';

class WithdrawalWidget extends StatefulWidget {
  const WithdrawalWidget({
    super.key,
    required this.paddy,
  });

  final AppUsersRow? paddy;

  @override
  State<WithdrawalWidget> createState() => _WithdrawalWidgetState();
}

class _WithdrawalWidgetState extends State<WithdrawalWidget> {
  late WithdrawalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WithdrawalModel());

    _model.amountTextController ??=
        TextEditingController(text: widget!.paddy?.paddyPoints?.toString());
    _model.amountFocusNode ??= FocusNode();

    _model.accoutNumberTextController ??= TextEditingController();
    _model.accoutNumberFocusNode ??= FocusNode();

    _model.accountNameTextController ??= TextEditingController();
    _model.accountNameFocusNode ??= FocusNode();

    _model.switchValue = true;
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: GetBanksCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 45.0,
              height: 45.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        final containerGetBanksResponse = snapshot.data!;

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'j7logm29' /* Withdrawal */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Recolta Alt',
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '7qcpshd5' /* Enter account details to withd... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Recolta Alt',
                              color: FlutterFlowTheme.of(context).gray600,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 30.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).comment,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'w5pem9fv' /* Current balance */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Recolta Alt',
                                      color:
                                          FlutterFlowTheme.of(context).gray900,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Text(
                                'N${formatNumber(
                                  widget!.paddy?.paddyPoints,
                                  formatType: FormatType.compact,
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Recolta Alt',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).comment,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '5500gnx2' /* Withdrawals this mo... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Recolta Alt',
                                      color:
                                          FlutterFlowTheme.of(context).gray900,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget!.paddy?.withdrawals?.toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Recolta Alt',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'pmjp67he' /* Amount to withdraw */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Recolta Alt',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        TextFormField(
                          controller: _model.amountTextController,
                          focusNode: _model.amountFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Recolta Alt',
                                  color: FlutterFlowTheme.of(context).gray400,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Recolta Alt',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).border,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).gray50,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Recolta Alt',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          keyboardType: TextInputType.number,
                          validator: _model.amountTextControllerValidator
                              .asValidator(context),
                        ),
                      ].divide(SizedBox(height: 6.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '7u24n7zl' /* Account number */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Recolta Alt',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        TextFormField(
                          controller: _model.accoutNumberTextController,
                          focusNode: _model.accoutNumberFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Recolta Alt',
                                  color: FlutterFlowTheme.of(context).gray400,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'ne4f8ed8' /* Enter account number */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Recolta Alt',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).border,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).gray50,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Recolta Alt',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          validator: _model.accoutNumberTextControllerValidator
                              .asValidator(context),
                        ),
                      ].divide(SizedBox(height: 6.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'y1s4wz4c' /* Account name */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Recolta Alt',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        TextFormField(
                          controller: _model.accountNameTextController,
                          focusNode: _model.accountNameFocusNode,
                          autofocus: true,
                          readOnly: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Recolta Alt',
                                  color: FlutterFlowTheme.of(context).gray400,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'gdzcjwz9' /* Enter account name */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Recolta Alt',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).border,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).gray50,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Recolta Alt',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          validator: _model.accountNameTextControllerValidator
                              .asValidator(context),
                        ),
                      ].divide(SizedBox(height: 6.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '60qk5b84' /* Bank */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Recolta Alt',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        FlutterFlowDropDown<String>(
                          key: ValueKey(GetBanksCall.code(
                            containerGetBanksResponse.jsonBody,
                          )!
                              .length
                              .toString()),
                          controller: _model.availableTimesValueController ??=
                              FormFieldController<String>(
                            _model.availableTimesValue ??= '',
                          ),
                          options: List<String>.from(GetBanksCall.code(
                            containerGetBanksResponse.jsonBody,
                          )!
                              .map((e) => e.toString())
                              .toList()),
                          optionLabels: GetBanksCall.name(
                            containerGetBanksResponse.jsonBody,
                          )!
                              .map((e) => e.toString())
                              .toList(),
                          onChanged: (val) async {
                            setState(() => _model.availableTimesValue = val);
                            logFirebaseEvent(
                                'WITHDRAWAL_Available_times_ON_FORM_WIDGE');
                            logFirebaseEvent('Available_times_backend_call');
                            _model.apiResultdca =
                                await VerifyBankAccountCall.call(
                              acctNum: _model.accoutNumberTextController.text,
                              bankCode: _model.availableTimesValue,
                            );

                            if ((_model.apiResultdca?.succeeded ?? true)) {
                              logFirebaseEvent(
                                  'Available_times_set_form_field');
                              setState(() {
                                _model.accountNameTextController?.text =
                                    VerifyBankAccountCall.accountName(
                                  (_model.apiResultdca?.jsonBody ?? ''),
                                )!;
                                _model.accountNameTextController?.selection =
                                    TextSelection.collapsed(
                                        offset: _model
                                            .accountNameTextController!
                                            .text
                                            .length);
                              });
                            } else {
                              logFirebaseEvent(
                                  'Available_times_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Could not fetch account name',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            }

                            setState(() {});
                          },
                          width: double.infinity,
                          height: 48.0,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Recolta Alt',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          searchTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Recolta Alt',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Recolta Alt',
                                    color: FlutterFlowTheme.of(context).gray400,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            '6v7d7uaj' /* Select your bank */,
                          ),
                          searchHintText: FFLocalizations.of(context).getText(
                            'oigbvzzz' /* Search for a bank... */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).gray400,
                            size: 24.0,
                          ),
                          fillColor: FlutterFlowTheme.of(context).gray50,
                          elevation: 0.0,
                          borderColor: FlutterFlowTheme.of(context).gray200,
                          borderWidth: 1.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 8.0),
                          hidesUnderline: true,
                          isSearchable: true,
                          isMultiSelect: false,
                        ),
                      ].divide(SizedBox(height: 6.0)),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
                if (false)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'l0l11o3j' /* Save card */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Recolta Alt',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'scwke6st' /* Turn on to save this card */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Recolta Alt',
                                    color: FlutterFlowTheme.of(context).gray500,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ].divide(SizedBox(height: 4.0)),
                        ),
                      ),
                      Switch.adaptive(
                        value: _model.switchValue!,
                        onChanged: (newValue) async {
                          setState(() => _model.switchValue = newValue!);
                        },
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).gray200,
                        inactiveTrackColor:
                            FlutterFlowTheme.of(context).alternate,
                        inactiveThumbColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ],
                  ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'WITHDRAWAL_COMP_WITHDRAW_2000_BTN_ON_TAP');
                    var _shouldSetState = false;
                    if (widget!.paddy!.noSession < 3) {
                      logFirebaseEvent('Button_bottom_sheet');
                      Navigator.pop(context);
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'You need to have atleast 3 sessions to withdraw',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                      if (_shouldSetState) setState(() {});
                      return;
                    }
                    if (widget!.paddy!.withdrawals > 0) {
                      logFirebaseEvent('Button_backend_call');
                      await BankAccountsTable().update(
                        data: {
                          'acc_number': _model.accountNameTextController.text,
                          'bank_code': _model.availableTimesValue,
                          'account_name': _model.accountNameTextController.text,
                          'user_id': currentUserUid,
                        },
                        matchingRows: (rows) => rows.eq(
                          'user_id',
                          currentUserUid,
                        ),
                      );
                    } else {
                      logFirebaseEvent('Button_backend_call');
                      await BankAccountsTable().insert({
                        'user_id': currentUserUid,
                        'acc_number': _model.accoutNumberTextController.text,
                        'bank_code': _model.availableTimesValue,
                        'account_name': _model.accountNameTextController.text,
                      });
                    }

                    logFirebaseEvent('Button_backend_call');
                    await SavePaystackRecipientCall.call(
                      userId: currentUserUid,
                      accountNumber: _model.accoutNumberTextController.text,
                      bankCode: _model.availableTimesValue,
                      name: _model.accountNameTextController.text,
                    );

                    logFirebaseEvent('Button_backend_call');
                    _model.apiResulttqm = await WithdrawPointsCall.call(
                      userId: currentUserUid,
                      amount: int.tryParse(_model.amountTextController.text),
                    );

                    _shouldSetState = true;
                    logFirebaseEvent('Button_close_dialog_drawer_etc');
                    Navigator.pop(context);
                    if ((_model.apiResulttqm?.succeeded ?? true)) {
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Withdrawal is being processed',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).primary100,
                        ),
                      );
                    } else {
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            WithdrawPointsCall.message(
                              (_model.apiResulttqm?.jsonBody ?? ''),
                            )!,
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                    }

                    if (_shouldSetState) setState(() {});
                  },
                  text: 'Withdraw ₦${_model.amountTextController.text}',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Recolta Alt',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ].divide(SizedBox(height: 24.0)),
            ),
          ),
        );
      },
    );
  }
}
