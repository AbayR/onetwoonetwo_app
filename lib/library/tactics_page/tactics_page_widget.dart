import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tactics_page_model.dart';
export 'tactics_page_model.dart';

class TacticsPageWidget extends StatefulWidget {
  const TacticsPageWidget({
    Key? key,
    required this.tactic,
    required this.module,
    this.index,
  }) : super(key: key);

  final TacticsRecord? tactic;
  final ModulesRecord? module;
  final int? index;

  @override
  _TacticsPageWidgetState createState() => _TacticsPageWidgetState();
}

class _TacticsPageWidgetState extends State<TacticsPageWidget> {
  late TacticsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TacticsPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'TacticsPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ModuleBeganRecord>>(
      stream: queryModuleBeganRecord(
        parent: currentUserReference,
        queryBuilder: (moduleBeganRecord) => moduleBeganRecord.where('module',
            isEqualTo: widget.module?.reference),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ModuleBeganRecord> tacticsPageModuleBeganRecordList =
            snapshot.data!;
        final tacticsPageModuleBeganRecord =
            tacticsPageModuleBeganRecordList.isNotEmpty
                ? tacticsPageModuleBeganRecordList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: StreamBuilder<List<TacticsRecord>>(
                stream: queryTacticsRecord(
                  parent: widget.module?.parentReference,
                  queryBuilder: (tacticsRecord) => tacticsRecord.where('module',
                      isEqualTo: widget.module?.reference),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<TacticsRecord> pageViewTacticsRecordList =
                      snapshot.data!;
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: PageView.builder(
                      controller: _model.pageViewController ??= PageController(
                          initialPage: min(
                              valueOrDefault<int>(
                                widget.index,
                                0,
                              ),
                              pageViewTacticsRecordList.length - 1)),
                      onPageChanged: (_) async {
                        logFirebaseEvent(
                            'TACTICS_PageView_22kd8rqz_ON_WIDGET_SWIP');
                        if (widget.tactic!.usersCompleted
                            .contains(currentUserReference)) {
                          if (pageViewTacticsRecordList.last.usersCompleted
                              .contains(currentUserReference)) {
                            logFirebaseEvent('PageView_backend_call');

                            await tacticsPageModuleBeganRecord!.module!.update({
                              'inProgressBy': FieldValue.arrayRemove(
                                  [currentUserReference]),
                              'finishedBy':
                                  FieldValue.arrayUnion([currentUserReference]),
                            });
                          } else {
                            logFirebaseEvent('PageView_backend_call');

                            await widget.tactic!.reference.update({
                              'users_completed':
                                  FieldValue.arrayUnion([currentUserReference]),
                            });
                            logFirebaseEvent('PageView_backend_call');

                            await tacticsPageModuleBeganRecord!.module!.update({
                              'inProgressBy': FieldValue.arrayRemove(
                                  [currentUserReference]),
                              'finishedBy':
                                  FieldValue.arrayUnion([currentUserReference]),
                            });
                            logFirebaseEvent('PageView_backend_call');

                            await currentUserReference!.update({
                              'points':
                                  FieldValue.increment(widget.tactic!.points),
                            });
                          }
                        } else {
                          logFirebaseEvent('PageView_backend_call');

                          await widget.tactic!.reference.update({
                            'users_completed':
                                FieldValue.arrayUnion([currentUserReference]),
                          });
                          logFirebaseEvent('PageView_backend_call');

                          await currentUserReference!.update({
                            'points':
                                FieldValue.increment(widget.tactic!.points),
                          });
                        }
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: pageViewTacticsRecordList.length,
                      itemBuilder: (context, pageViewIndex) {
                        final pageViewTacticsRecord =
                            pageViewTacticsRecordList[pageViewIndex];
                        return Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 100.0,
                          child: Stack(
                            children: [
                              Hero(
                                tag: pageViewTacticsRecord.img,
                                transitionOnUserGestures: true,
                                child: Image.network(
                                  pageViewTacticsRecord.img,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    width: 100.0,
                                    height: 130.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x42000000),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 24.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'TACTICS_PAGE_PAGE_Row_0n65rp4q_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Row_navigate_back');
                                                      context.safePop();
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          FFIcons
                                                              .karrowIosBackOutline,
                                                          color: Colors.white,
                                                          size: 24.0,
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'tzski9rk' /* Back */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'QuickSand',
                                                                color: Colors
                                                                    .white,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FutureBuilder<int>(
                                                    future:
                                                        queryTacticsRecordCount(
                                                      parent:
                                                          pageViewTacticsRecord
                                                              .parentReference,
                                                      queryBuilder: (tacticsRecord) =>
                                                          tacticsRecord.where(
                                                              'module',
                                                              isEqualTo:
                                                                  pageViewTacticsRecord
                                                                      .module),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      int textCount =
                                                          snapshot.data!;
                                                      return Text(
                                                        '${functions.indexinList(pageViewIndex.toString())} out of ${textCount.toString()}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'QuickSand',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    height: 200.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.transparent,
                                          Colors.black
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            pageViewTacticsRecord.tittle,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'QuickSand',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          Text(
                                            pageViewTacticsRecord.description,
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'QuickSand',
                                                  color: Colors.white,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 24.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
