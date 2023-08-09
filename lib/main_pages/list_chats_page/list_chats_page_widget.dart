import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_chats_page_model.dart';
export 'list_chats_page_model.dart';

class ListChatsPageWidget extends StatefulWidget {
  const ListChatsPageWidget({
    Key? key,
    this.index,
  }) : super(key: key);

  final int? index;

  @override
  _ListChatsPageWidgetState createState() => _ListChatsPageWidgetState();
}

class _ListChatsPageWidgetState extends State<ListChatsPageWidget> {
  late ListChatsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListChatsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ListChatsPage'});
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
            automaticallyImplyLeading: false,
            title: Text(
              FFLocalizations.of(context).getText(
                'bpeh04as' /* Chats */,
              ),
              style: FlutterFlowTheme.of(context).headlineSmall,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: StreamBuilder<List<BotsRecord>>(
            stream: queryBotsRecord(),
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
              List<BotsRecord> tabBarBotsRecordList = snapshot.data!;
              return DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primary,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).primaryText,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'QuickSand',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                        indicatorColor: FlutterFlowTheme.of(context).primary,
                        tabs: [
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'xv3uqmag' /* Active Chats */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'g4fj39jg' /* Completed Chats */,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          FutureBuilder<int>(
                            future: queryDec23ChatsRecordCount(
                              queryBuilder: (dec23ChatsRecord) =>
                                  dec23ChatsRecord
                                      .where('uid1', isEqualTo: currentUserUid)
                                      .where('in_progress', isEqualTo: true),
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
                              int conditionalBuilderCount = snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  if (conditionalBuilderCount > 0) {
                                    return StreamBuilder<
                                        List<Dec23ChatsRecord>>(
                                      stream: queryDec23ChatsRecord(
                                        queryBuilder: (dec23ChatsRecord) =>
                                            dec23ChatsRecord
                                                .where('in_progress',
                                                    isEqualTo: true)
                                                .where('user1',
                                                    isEqualTo:
                                                        currentUserReference),
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<Dec23ChatsRecord>
                                            listViewDec23ChatsRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewDec23ChatsRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewDec23ChatsRecord =
                                                listViewDec23ChatsRecordList[
                                                    listViewIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'LIST_CHATS_Container_wdpnjab8_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_wait__delay');
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 2000));
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
                                                                  listViewDec23ChatsRecord
                                                                      .user2),
                                                  singleRecord: true,
                                                ).then((s) => s.firstOrNull);
                                                logFirebaseEvent(
                                                    'Container_firestore_query');
                                                _model.bot =
                                                    await queryBotsRecordOnce(
                                                  queryBuilder: (botsRecord) =>
                                                      botsRecord.where(
                                                          'display_name',
                                                          isEqualTo:
                                                              listViewDec23ChatsRecord
                                                                  .user2),
                                                  singleRecord: true,
                                                ).then((s) => s.firstOrNull);
                                                logFirebaseEvent(
                                                    'Container_firestore_query');
                                                _model.flows1 =
                                                    await queryFlowsRecordOnce(
                                                  queryBuilder: (flowsRecord) =>
                                                      flowsRecord.where('botId',
                                                          isEqualTo: _model
                                                              .bot?.reference),
                                                );
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  'ChatPage',
                                                  queryParameters: {
                                                    'chatRef': serializeParam(
                                                      listViewDec23ChatsRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'flows': serializeParam(
                                                      _model.flows1,
                                                      ParamType.Document,
                                                      true,
                                                    ),
                                                    'botId': serializeParam(
                                                      _model.bot?.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'flows': _model.flows1,
                                                  },
                                                );

                                                setState(() {});
                                              },
                                              child: Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEFEBFF),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      StreamBuilder<BotsRecord>(
                                                        stream: BotsRecord
                                                            .getDocument(
                                                                listViewDec23ChatsRecord
                                                                    .bot!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          final circleImageBotsRecord =
                                                              snapshot.data!;
                                                          return Container(
                                                            width: 56.0,
                                                            height: 56.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              circleImageBotsRecord
                                                                  .img,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    listViewDec23ChatsRecord
                                                                        .user2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'QuickSand',
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    dateTimeFormat(
                                                                      'd.M.y',
                                                                      listViewDec23ChatsRecord
                                                                          .ts!,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
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
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            listViewDec23ChatsRecord.lastMessage != ''
                                                                                ? listViewDec23ChatsRecord.lastMessage
                                                                                : 'Greetings',
                                                                            'Greetings',
                                                                          ),
                                                                          maxLines:
                                                                              1,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
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
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 250.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF3F1F8),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 12.0, 12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'bh0qox22' /* Here will be dialogs generated... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'QuickSand',
                                                        fontSize: 14.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 12.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/books.png',
                                                        width: 150.0,
                                                        height: 150.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          ),
                          FutureBuilder<int>(
                            future: queryDec23ChatsRecordCount(
                              queryBuilder: (dec23ChatsRecord) =>
                                  dec23ChatsRecord
                                      .where('uid1', isEqualTo: currentUserUid)
                                      .where('in_progress', isEqualTo: false),
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
                              int conditionalBuilderCount = snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  if (conditionalBuilderCount > 0) {
                                    return StreamBuilder<
                                        List<Dec23ChatsRecord>>(
                                      stream: queryDec23ChatsRecord(
                                        queryBuilder: (dec23ChatsRecord) =>
                                            dec23ChatsRecord
                                                .where('in_progress',
                                                    isEqualTo: false)
                                                .where('user1',
                                                    isEqualTo:
                                                        currentUserReference),
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<Dec23ChatsRecord>
                                            listViewDec23ChatsRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewDec23ChatsRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewDec23ChatsRecord =
                                                listViewDec23ChatsRecordList[
                                                    listViewIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'LIST_CHATS_Container_t3zwe411_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_firestore_query');
                                                _model.dec1 =
                                                    await queryDec23ChatsRecordOnce(
                                                  queryBuilder: (dec23ChatsRecord) =>
                                                      dec23ChatsRecord
                                                          .where('user1',
                                                              isEqualTo:
                                                                  currentUserReference)
                                                          .where('user2',
                                                              isEqualTo:
                                                                  listViewDec23ChatsRecord
                                                                      .user2),
                                                  singleRecord: true,
                                                ).then((s) => s.firstOrNull);
                                                logFirebaseEvent(
                                                    'Container_firestore_query');
                                                _model.bot1 =
                                                    await queryBotsRecordOnce(
                                                  queryBuilder: (botsRecord) =>
                                                      botsRecord.where(
                                                          'display_name',
                                                          isEqualTo:
                                                              listViewDec23ChatsRecord
                                                                  .user2),
                                                  singleRecord: true,
                                                ).then((s) => s.firstOrNull);
                                                logFirebaseEvent(
                                                    'Container_firestore_query');
                                                _model.flows11 =
                                                    await queryFlowsRecordOnce(
                                                  queryBuilder: (flowsRecord) =>
                                                      flowsRecord.where('botId',
                                                          isEqualTo: _model
                                                              .bot1?.reference),
                                                );
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  'ChatPage',
                                                  queryParameters: {
                                                    'chatRef': serializeParam(
                                                      listViewDec23ChatsRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'flows': serializeParam(
                                                      _model.flows11,
                                                      ParamType.Document,
                                                      true,
                                                    ),
                                                    'firstQuestion':
                                                        serializeParam(
                                                      _model.flows11?.first
                                                          ?.question,
                                                      ParamType.String,
                                                    ),
                                                    'botId': serializeParam(
                                                      _model.bot1?.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'flows': _model.flows11,
                                                  },
                                                );

                                                setState(() {});
                                              },
                                              child: Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEFEBFF),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      StreamBuilder<BotsRecord>(
                                                        stream: BotsRecord
                                                            .getDocument(
                                                                listViewDec23ChatsRecord
                                                                    .bot!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          final circleImageBotsRecord =
                                                              snapshot.data!;
                                                          return Container(
                                                            width: 56.0,
                                                            height: 56.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              circleImageBotsRecord
                                                                  .img,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    listViewDec23ChatsRecord
                                                                        .user2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'QuickSand',
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    dateTimeFormat(
                                                                      'd.M.y',
                                                                      listViewDec23ChatsRecord
                                                                          .ts!,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
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
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            listViewDec23ChatsRecord.lastMessage,
                                                                            'null',
                                                                          ),
                                                                          maxLines:
                                                                              1,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
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
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 250.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF3F1F8),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 12.0, 12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'kw1sqm0a' /* Here will be dialogs generated... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'QuickSand',
                                                        fontSize: 14.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 12.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/books.png',
                                                        width: 150.0,
                                                        height: 150.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
