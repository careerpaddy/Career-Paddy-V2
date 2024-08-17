import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'leaderboard_model.dart';
export 'leaderboard_model.dart';

class LeaderboardWidget extends StatefulWidget {
  const LeaderboardWidget({super.key});

  @override
  State<LeaderboardWidget> createState() => _LeaderboardWidgetState();
}

class _LeaderboardWidgetState extends State<LeaderboardWidget> {
  late LeaderboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeaderboardModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Leaderboard'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LEADERBOARD_Leaderboard_ON_INIT_STATE');
      logFirebaseEvent('Leaderboard_backend_call');
      _model.apiResultzqf = await GetHighestScorerCall.call(
        uid: currentUserUid,
      );

      if (GetHighestScorerCall.isHighest(
        (_model.apiResultzqf?.jsonBody ?? ''),
      )!) {
        logFirebaseEvent('Leaderboard_navigate_to');

        context.pushNamed('Congrats_challenge');
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.08),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Text(
              FFLocalizations.of(context).getText(
                '5ozesusx' /* Leaderboard */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Recolta Alt',
                    color: FlutterFlowTheme.of(context).white,
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: false,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 1.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'y2tgu804' /* Here are the top learners for ... */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Recolta Alt',
                              fontSize: 19.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: GetLeadersCall.call(),
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
                            final rowGetLeadersResponse = snapshot.data!;

                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      alignment: AlignmentDirectional(1.2, 1.2),
                                      children: [
                                        Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFFE3E3E3),
                                              width: 3.0,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              if ((GetLeadersCall.image(
                                                    rowGetLeadersResponse
                                                        .jsonBody,
                                                  )?[1]) ==
                                                  null) {
                                                return Icon(
                                                  Icons.person_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 36.0,
                                                );
                                              } else {
                                                return Container(
                                                  width: 120.0,
                                                  height: 120.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        (GetLeadersCall.image(
                                                      rowGetLeadersResponse
                                                          .jsonBody,
                                                    )![1])
                                                            .toString(),
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/Silver_Medal.png',
                                            width: 23.0,
                                            height: 32.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            GetLeadersCall.fullName(
                                              rowGetLeadersResponse.jsonBody,
                                            )?[1],
                                            '1',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Recolta Alt',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray500,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Text(
                                          '${(GetLeadersCall.coins(
                                            rowGetLeadersResponse.jsonBody,
                                          )?[1])?.toString()}P',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Recolta Alt',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray500,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 2.0)),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      alignment: AlignmentDirectional(1.2, 1.2),
                                      children: [
                                        Container(
                                          width: 80.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFFFACC55),
                                              width: 3.0,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              if (GetLeadersCall.image(
                                                    rowGetLeadersResponse
                                                        .jsonBody,
                                                  )?.first ==
                                                  null) {
                                                return Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.person_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 48.0,
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  width: 120.0,
                                                  height: 120.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    GetLeadersCall.image(
                                                      rowGetLeadersResponse
                                                          .jsonBody,
                                                    )!
                                                        .first
                                                        .toString(),
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/Gold_Medal.png',
                                            width: 29.0,
                                            height: 40.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            GetLeadersCall.fullName(
                                              rowGetLeadersResponse.jsonBody,
                                            )?.first,
                                            '1',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Recolta Alt',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray500,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Text(
                                          '${GetLeadersCall.coins(
                                            rowGetLeadersResponse.jsonBody,
                                          )?.first?.toString()}P',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Recolta Alt',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray500,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 2.0)),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      alignment: AlignmentDirectional(1.2, 1.2),
                                      children: [
                                        Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFFA36D1D),
                                              width: 3.0,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              if (GetLeadersCall.image(
                                                    rowGetLeadersResponse
                                                        .jsonBody,
                                                  )?.last ==
                                                  null) {
                                                return Icon(
                                                  Icons.person,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 36.0,
                                                );
                                              } else {
                                                return Container(
                                                  width: 60.0,
                                                  height: 60.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    GetLeadersCall.image(
                                                      rowGetLeadersResponse
                                                          .jsonBody,
                                                    )!
                                                        .last
                                                        .toString(),
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/Bronze_Medal.png',
                                            width: 23.0,
                                            height: 32.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            GetLeadersCall.fullName(
                                              rowGetLeadersResponse.jsonBody,
                                            )?.last,
                                            '1',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Recolta Alt',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray500,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Text(
                                          '${GetLeadersCall.coins(
                                            rowGetLeadersResponse.jsonBody,
                                          )?.last?.toString()}P',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Recolta Alt',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray500,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 2.0)),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ].divide(SizedBox(width: 24.0)),
                            );
                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFB634F7),
                                  Color(0xFF7534F7),
                                  Color(0xFF548AF5)
                                ],
                                stops: [0.0, 0.5, 1.0],
                                begin: AlignmentDirectional(1.0, -1.0),
                                end: AlignmentDirectional(-1.0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'jmr1bt58' /* Rank */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Recolta Alt',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'd298v9k2' /* Name */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Recolta Alt',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 24.0)),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'udmim9mc' /* Points */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Recolta Alt',
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FutureBuilder<List<AppUsersRow>>(
                            future: AppUsersTable().queryRows(
                              queryFn: (q) => q.order('coins'),
                              limit: 20,
                            ),
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
                              List<AppUsersRow> rank46AppUsersRowList =
                                  snapshot.data!;

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(rank46AppUsersRowList.length,
                                        (rank46Index) {
                                  final rank46AppUsersRow =
                                      rank46AppUsersRowList[rank46Index];
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 12.0, 12.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                (rank46Index + 1).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Recolta Alt',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      if (rank46AppUsersRow
                                                                  .image ==
                                                              null ||
                                                          rank46AppUsersRow
                                                                  .image ==
                                                              '') {
                                                        return Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .person_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        );
                                                      } else {
                                                        return Container(
                                                          width: 36.0,
                                                          height: 36.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            rank46AppUsersRow
                                                                .image!,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      rank46AppUsersRow
                                                          .fullName,
                                                      'Isaac Udom',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Recolta Alt',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 8.0)),
                                              ),
                                            ].divide(SizedBox(width: 48.0)),
                                          ),
                                          Text(
                                            rank46AppUsersRow.coins.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Recolta Alt',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).divide(SizedBox(height: 4.0)),
                              );
                            },
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
