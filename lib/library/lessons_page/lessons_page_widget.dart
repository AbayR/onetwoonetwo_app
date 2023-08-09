import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library/components_library/module_detail_page/module_detail_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lessons_page_model.dart';
export 'lessons_page_model.dart';

class LessonsPageWidget extends StatefulWidget {
  const LessonsPageWidget({
    Key? key,
    this.course,
    this.module,
  }) : super(key: key);

  final CoursesRecord? course;
  final ModulesRecord? module;

  @override
  _LessonsPageWidgetState createState() => _LessonsPageWidgetState();
}

class _LessonsPageWidgetState extends State<LessonsPageWidget> {
  late LessonsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonsPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LessonsPage'});
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                FFIcons.karrowBackOutline,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                logFirebaseEvent('LESSONS_arrowBackOutline_ICN_ON_TAP');
                logFirebaseEvent('IconButton_navigate_back');
                context.safePop();
              },
            ),
            title: Text(
              widget.course!.name,
              maxLines: 1,
              style: FlutterFlowTheme.of(context).headlineSmall,
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('LESSONS_PAGE_PAGE_Icon_p4kl7fzp_ON_TAP');
                    logFirebaseEvent('Icon_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => FocusScope.of(context)
                              .requestFocus(_model.unfocusNode),
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: Container(
                              height: 411.0,
                              child: ModuleDetailPageWidget(
                                module: widget.module,
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Icon(
                    FFIcons.kmoreVerticalOutline,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 18.0,
                  ),
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                Align(
                  alignment: Alignment(0.0, 0),
                  child: TabBar(
                    labelColor: FlutterFlowTheme.of(context).primary,
                    unselectedLabelColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    labelStyle: FlutterFlowTheme.of(context).titleMedium,
                    indicatorColor: FlutterFlowTheme.of(context).primary,
                    tabs: [
                      Tab(
                        text: FFLocalizations.of(context).getText(
                          '17bxn7ch' /* Play */,
                        ),
                      ),
                      Tab(
                        text: FFLocalizations.of(context).getText(
                          'o0ty89f7' /* Tactics */,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: StreamBuilder<List<BotsRecord>>(
                              stream: queryBotsRecord(
                                queryBuilder: (botsRecord) => botsRecord.where(
                                    'module',
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<BotsRecord> listViewBotsRecordList =
                                    snapshot.data!;
                                return ListView.separated(
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewBotsRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 12.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewBotsRecord =
                                        listViewBotsRecordList[listViewIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'LESSONS_Container_eqkdid80_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_wait__delay');
                                        await Future.delayed(
                                            const Duration(milliseconds: 2000));
                                        logFirebaseEvent(
                                            'Container_firestore_query');
                                        _model.dec23 =
                                            await queryDec23ChatsRecordCount(
                                          queryBuilder: (dec23ChatsRecord) =>
                                              dec23ChatsRecord
                                                  .where('user1',
                                                      isEqualTo:
                                                          currentUserReference)
                                                  .where('user2',
                                                      isEqualTo:
                                                          listViewBotsRecord
                                                              .displayName),
                                        );
                                        if (_model.dec23 == 0) {
                                          logFirebaseEvent(
                                              'Container_backend_call');

                                          var dec23ChatsRecordReference =
                                              Dec23ChatsRecord.collection.doc();
                                          await dec23ChatsRecordReference
                                              .set(createDec23ChatsRecordData(
                                            user1: currentUserReference,
                                            user2:
                                                listViewBotsRecord.displayName,
                                            ts: getCurrentTimestamp,
                                            uid1: currentUserReference?.id,
                                            uid2:
                                                listViewBotsRecord.reference.id,
                                            inProgress: true,
                                            bot: listViewBotsRecord.reference,
                                          ));
                                          _model.chats = Dec23ChatsRecord
                                              .getDocumentFromData(
                                                  createDec23ChatsRecordData(
                                                    user1: currentUserReference,
                                                    user2: listViewBotsRecord
                                                        .displayName,
                                                    ts: getCurrentTimestamp,
                                                    uid1: currentUserReference
                                                        ?.id,
                                                    uid2: listViewBotsRecord
                                                        .reference.id,
                                                    inProgress: true,
                                                    bot: listViewBotsRecord
                                                        .reference,
                                                  ),
                                                  dec23ChatsRecordReference);
                                          logFirebaseEvent(
                                              'Container_firestore_query');
                                          _model.flows =
                                              await queryFlowsRecordOnce(
                                            queryBuilder: (flowsRecord) =>
                                                flowsRecord.where('botId',
                                                    isEqualTo:
                                                        listViewBotsRecord
                                                            .reference),
                                          );
                                          logFirebaseEvent(
                                              'Container_backend_call');

                                          await AnswersRecord.collection
                                              .doc()
                                              .set(createAnswersRecordData(
                                                sendBy: listViewBotsRecord
                                                    .displayName,
                                                text: _model.flows
                                                    ?.where((e) =>
                                                        e.previous == '0')
                                                    .toList()
                                                    ?.first
                                                    ?.question,
                                                ts: getCurrentTimestamp,
                                                chat: _model.chats?.reference,
                                                image: _model.flows
                                                    ?.where((e) =>
                                                        e.previous == '0')
                                                    .toList()
                                                    ?.first
                                                    ?.image,
                                              ));
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                            'ChatPage',
                                            queryParameters: {
                                              'chatRef': serializeParam(
                                                _model.chats?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'flows': serializeParam(
                                                _model.flows,
                                                ParamType.Document,
                                                true,
                                              ),
                                              'botId': serializeParam(
                                                listViewBotsRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'flows': _model.flows,
                                            },
                                          );
                                        } else {
                                          logFirebaseEvent(
                                              'Container_firestore_query');
                                          _model.dec =
                                              await queryDec23ChatsRecordOnce(
                                            queryBuilder: (dec23ChatsRecord) =>
                                                dec23ChatsRecord
                                                    .where('user1',
                                                        isEqualTo:
                                                            currentUserReference)
                                                    .where('user2',
                                                        isEqualTo:
                                                            listViewBotsRecord
                                                                .displayName),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          logFirebaseEvent(
                                              'Container_firestore_query');
                                          _model.flows1 =
                                              await queryFlowsRecordOnce(
                                            queryBuilder: (flowsRecord) =>
                                                flowsRecord.where('botId',
                                                    isEqualTo:
                                                        listViewBotsRecord
                                                            .reference),
                                          );
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                            'ChatPage',
                                            queryParameters: {
                                              'chatRef': serializeParam(
                                                _model.dec?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'flows': serializeParam(
                                                _model.flows1,
                                                ParamType.Document,
                                                true,
                                              ),
                                              'botId': serializeParam(
                                                listViewBotsRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'flows': _model.flows1,
                                            },
                                          );
                                        }

                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 56.0,
                                                height: 56.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  listViewBotsRecord.img,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            listViewBotsRecord
                                                                .displayName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'QuickSand',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: [
                                                                    Text(
                                                                      listViewBotsRecord
                                                                          .role,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'QuickSand',
                                                                            color:
                                                                                Color(0xFF6C6F71),
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                    StreamBuilder<
                                                                        List<
                                                                            Dec23ChatsRecord>>(
                                                                      stream:
                                                                          queryDec23ChatsRecord(
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                        List<Dec23ChatsRecord>
                                                                            textDec23ChatsRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final textDec23ChatsRecord = textDec23ChatsRecordList.isNotEmpty
                                                                            ? textDec23ChatsRecordList.first
                                                                            : null;
                                                                        return Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            textDec23ChatsRecord!.inProgress
                                                                                ? 'Active Chat'
                                                                                : 'Completed Chat',
                                                                            'Have not started yet',
                                                                          ),
                                                                          maxLines:
                                                                              1,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: StreamBuilder<List<TacticsRecord>>(
                              stream: queryTacticsRecord(
                                parent: widget.course?.reference,
                                queryBuilder: (tacticsRecord) =>
                                    tacticsRecord.where('module',
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<TacticsRecord> gridViewTacticsRecordList =
                                    snapshot.data!;
                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    childAspectRatio: 1.0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: gridViewTacticsRecordList.length,
                                  itemBuilder: (context, gridViewIndex) {
                                    final gridViewTacticsRecord =
                                        gridViewTacticsRecordList[
                                            gridViewIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'LESSONS_PAGE_PAGE_Image_vdpn5udj_ON_TAP');
                                        if (gridViewTacticsRecord.usersCompleted
                                            .contains(currentUserReference)) {
                                          logFirebaseEvent('Image_navigate_to');

                                          context.pushNamed(
                                            'TacticsPage',
                                            queryParameters: {
                                              'tactic': serializeParam(
                                                gridViewTacticsRecord,
                                                ParamType.Document,
                                              ),
                                              'module': serializeParam(
                                                widget.module,
                                                ParamType.Document,
                                              ),
                                              'index': serializeParam(
                                                gridViewIndex,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'tactic': gridViewTacticsRecord,
                                              'module': widget.module,
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.scale,
                                                alignment:
                                                    Alignment.bottomCenter,
                                              ),
                                            },
                                          );
                                        } else {
                                          logFirebaseEvent(
                                              'Image_backend_call');

                                          await gridViewTacticsRecord.module!
                                              .update({
                                            'inProgressBy':
                                                FieldValue.arrayUnion(
                                                    [currentUserReference]),
                                          });
                                          logFirebaseEvent(
                                              'Image_backend_call');

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            points:
                                                gridViewTacticsRecord.points,
                                          ));
                                          logFirebaseEvent('Image_navigate_to');

                                          context.pushNamed(
                                            'TacticsPage',
                                            queryParameters: {
                                              'tactic': serializeParam(
                                                gridViewTacticsRecord,
                                                ParamType.Document,
                                              ),
                                              'module': serializeParam(
                                                widget.module,
                                                ParamType.Document,
                                              ),
                                              'index': serializeParam(
                                                gridViewIndex,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'tactic': gridViewTacticsRecord,
                                              'module': widget.module,
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.scale,
                                                alignment:
                                                    Alignment.bottomCenter,
                                              ),
                                            },
                                          );
                                        }
                                      },
                                      child: Hero(
                                        tag: gridViewTacticsRecord.img,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.network(
                                            gridViewTacticsRecord.img,
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
