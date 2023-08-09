import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library/components_library/course_information/course_information_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modules_page_model.dart';
export 'modules_page_model.dart';

class ModulesPageWidget extends StatefulWidget {
  const ModulesPageWidget({
    Key? key,
    this.course,
  }) : super(key: key);

  final DocumentReference? course;

  @override
  _ModulesPageWidgetState createState() => _ModulesPageWidgetState();
}

class _ModulesPageWidgetState extends State<ModulesPageWidget> {
  late ModulesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModulesPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ModulesPage'});
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

    return StreamBuilder<CoursesRecord>(
      stream: CoursesRecord.getDocument(widget.course!),
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
        final modulesPageCoursesRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                    color: FlutterFlowTheme.of(context).primaryText),
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
                    logFirebaseEvent('MODULES_arrowBackOutline_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.safePop();
                  },
                ),
                title: StreamBuilder<CoursesRecord>(
                  stream: CoursesRecord.getDocument(widget.course!),
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
                    final textCoursesRecord = snapshot.data!;
                    return Text(
                      textCoursesRecord.name,
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    );
                  },
                ),
                actions: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'MODULES_PAGE_PAGE_Icon_8rfcoinn_ON_TAP');
                        logFirebaseEvent('Icon_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => FocusScope.of(context)
                                  .requestFocus(_model.unfocusNode),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.85,
                                  child: CourseInformationWidget(
                                    course: modulesPageCoursesRecord,
                                    isBottomSheet: true,
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
                        size: 16.0,
                      ),
                    ),
                  ),
                ],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: StreamBuilder<List<ModulesRecord>>(
                      stream: queryModulesRecord(
                        parent: modulesPageCoursesRecord.reference,
                        queryBuilder: (modulesRecord) =>
                            modulesRecord.orderBy('indexInList'),
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
                        List<ModulesRecord> columnModulesRecordList =
                            snapshot.data!;
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children:
                                List.generate(columnModulesRecordList.length,
                                        (columnIndex) {
                              final columnModulesRecord =
                                  columnModulesRecordList[columnIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 100.0,
                                    height: 90.0,
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        valueOrDefault(
                                                    currentUserDocument?.points,
                                                    0) >=
                                                columnModulesRecord.accessPoints
                                            ? Color(0xFFEFEEF3)
                                            : Color(0xFFF6F6F6),
                                        Color(0xFFEFEEF3),
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 12.0, 12.0, 12.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'MODULES_PAGE_PAGE_Column_1kkjhr5t_ON_TAP');
                                          if (valueOrDefault(
                                                  currentUserDocument?.points,
                                                  0) >=
                                              columnModulesRecord
                                                  .accessPoints) {
                                            if (columnModulesRecord.inProgressBy
                                                    .contains(
                                                        currentUserReference) ||
                                                columnModulesRecord.finishedBy
                                                    .contains(
                                                        currentUserReference)) {
                                              logFirebaseEvent(
                                                  'Column_navigate_to');

                                              context.pushNamed(
                                                'LessonsPage',
                                                queryParameters: {
                                                  'course': serializeParam(
                                                    modulesPageCoursesRecord,
                                                    ParamType.Document,
                                                  ),
                                                  'module': serializeParam(
                                                    columnModulesRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'course':
                                                      modulesPageCoursesRecord,
                                                  'module': columnModulesRecord,
                                                },
                                              );
                                            } else {
                                              logFirebaseEvent(
                                                  'Column_backend_call');

                                              await columnModulesRecord
                                                  .reference
                                                  .update({
                                                'inProgressBy':
                                                    FieldValue.arrayUnion(
                                                        [currentUserReference]),
                                              });
                                              logFirebaseEvent(
                                                  'Column_backend_call');

                                              await ModuleBeganRecord.createDoc(
                                                      currentUserReference!)
                                                  .set(
                                                      createModuleBeganRecordData(
                                                module: columnModulesRecord
                                                    .reference,
                                                timeStarted:
                                                    getCurrentTimestamp,
                                              ));
                                              logFirebaseEvent(
                                                  'Column_navigate_to');

                                              context.pushNamed(
                                                'LessonsPage',
                                                queryParameters: {
                                                  'course': serializeParam(
                                                    modulesPageCoursesRecord,
                                                    ParamType.Document,
                                                  ),
                                                  'module': serializeParam(
                                                    columnModulesRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'course':
                                                      modulesPageCoursesRecord,
                                                  'module': columnModulesRecord,
                                                },
                                              );
                                            }
                                          } else {
                                            logFirebaseEvent(
                                                'Column_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Warning!'),
                                                  content: Text(
                                                      'Finish previous modules or courses in order to get enough points to open this course'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 14.0,
                                                      height: 14.0,
                                                      decoration: BoxDecoration(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          columnModulesRecord
                                                                  .inProgressBy
                                                                  .contains(
                                                                      currentUserReference)
                                                              ? Color(
                                                                  0xFF00CE7D)
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  6.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        () {
                                                          if (columnModulesRecord
                                                              .inProgressBy
                                                              .contains(
                                                                  currentUserReference)) {
                                                            return 'Active';
                                                          } else if (columnModulesRecord
                                                              .finishedBy
                                                              .contains(
                                                                  currentUserReference)) {
                                                            return 'Completed';
                                                          } else if (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.points,
                                                                  0) >=
                                                              columnModulesRecord
                                                                  .accessPoints) {
                                                            return 'Start course';
                                                          } else {
                                                            return 'Not active';
                                                          }
                                                        }(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'QuickSand',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    valueOrDefault(currentUserDocument?.points, 0) >=
                                                                            columnModulesRecord
                                                                                .accessPoints
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primaryText
                                                                        : Color(
                                                                            0xFF949494),
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  FFIcons.kchevronRightOutline,
                                                  color: valueOrDefault<Color>(
                                                    valueOrDefault(
                                                                currentUserDocument
                                                                    ?.points,
                                                                0) >=
                                                            columnModulesRecord
                                                                .accessPoints
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText
                                                        : Color(0xFF949494),
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              columnModulesRecord.name,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    fontFamily: 'QuickSand',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.points,
                                                                  0) >=
                                                              columnModulesRecord
                                                                  .accessPoints
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0xFF949494),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                    ),
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                            if (valueOrDefault(
                                                    currentUserDocument?.points,
                                                    0) <
                                                columnModulesRecord
                                                    .accessPoints)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'tgzn3c2w' /* Open when the previous module ... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'QuickSand',
                                                        color: valueOrDefault<
                                                            Color>(
                                                          valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.points,
                                                                      0) >=
                                                                  columnModulesRecord
                                                                      .accessPoints
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : Color(
                                                                  0xFF949494),
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                        ),
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })
                                    .divide(SizedBox(height: 12.0))
                                    .around(SizedBox(height: 12.0)),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
