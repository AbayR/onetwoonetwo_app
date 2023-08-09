import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'main_page_model.dart';
export 'main_page_model.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  _MainPageWidgetState createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MainPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MAIN_PAGE_PAGE_MainPage_ON_INIT_STATE');
      if (valueOrDefault<bool>(currentUserDocument?.biometrics, false) ==
          true) {
        if (FFAppState().userloggedIn != true) {
          logFirebaseEvent('MainPage_biometric_verification');
          final _localAuth = LocalAuthentication();
          bool _isBiometricSupported = await _localAuth.isDeviceSupported();

          if (_isBiometricSupported) {
            _model.biom = await _localAuth.authenticate(
                localizedReason: FFLocalizations.of(context).getText(
              'y3sy0zmk' /* Please authenticate youself */,
            ));
            setState(() {});
          }
        }
      }
    });

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
                '96fmgeyq' /* Learn */,
              ),
              style: FlutterFlowTheme.of(context).headlineSmall,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'jhifppbx' /* My studies */,
                          ),
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'MAIN_PAGE_PAGE_Text_8ttgwcnv_ON_TAP');
                            logFirebaseEvent('Text_navigate_to');

                            context.pushNamed('MyLibraryPage');
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'kcivujjz' /* see all */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'QuickSand',
                                      color: Color(0xFF6C6F71),
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: StreamBuilder<List<CoursesRecord>>(
                      stream: FFAppState().myCourses(
                        requestFn: () => queryCoursesRecord(
                          queryBuilder: (coursesRecord) => coursesRecord.where(
                              'students',
                              arrayContains: currentUserReference),
                        ),
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
                        List<CoursesRecord> rowCoursesRecordList =
                            snapshot.data!;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(rowCoursesRecordList.length,
                                    (rowIndex) {
                              final rowCoursesRecord =
                                  rowCoursesRecordList[rowIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'MAIN_PAGE_PAGE_Container_08dph4or_ON_TAP');
                                  logFirebaseEvent('Container_action_block');
                                  await action_blocks.goToModules(
                                    context,
                                    course: rowCoursesRecord.reference,
                                  );
                                },
                                child: Container(
                                  width: 291.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFEBFF),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          rowCoursesRecord.category,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'QuickSand',
                                                color: Color(0xFF6C6F71),
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Text(
                                          rowCoursesRecord.name,
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (rowCoursesRecord.students
                                                    .contains(
                                                        currentUserReference) ||
                                                rowCoursesRecord
                                                    .completedStudents
                                                    .contains(
                                                        currentUserReference))
                                              Container(
                                                width: 12.0,
                                                height: 12.0,
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    () {
                                                      if (rowCoursesRecord
                                                          .students
                                                          .contains(
                                                              currentUserReference)) {
                                                        return Color(
                                                            0xFF88DE00);
                                                      } else if (rowCoursesRecord
                                                          .completedStudents
                                                          .contains(
                                                              currentUserReference)) {
                                                        return Color(
                                                            0xFFBEBBC1);
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primary;
                                                      }
                                                    }(),
                                                    Color(0xFF88DE00),
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                () {
                                                  if (rowCoursesRecord.students
                                                      .contains(
                                                          currentUserReference)) {
                                                    return 'Active';
                                                  } else if (rowCoursesRecord
                                                      .completedStudents
                                                      .contains(
                                                          currentUserReference)) {
                                                    return 'Completed';
                                                  } else {
                                                    return 'Not active';
                                                  }
                                                }(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                                .divide(SizedBox(width: 12.0))
                                .around(SizedBox(width: 12.0)),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 6.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'vgy9oz0c' /* Course library */,
                          ),
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'MAIN_PAGE_PAGE_Icon_xdhch7qy_ON_TAP');
                            logFirebaseEvent('Icon_navigate_to');

                            context.pushNamed('SearchPage');
                          },
                          child: Icon(
                            FFIcons.ksearchOutline,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'MAIN_PAGE_PAGE_Container_knsdt9s8_ON_TAP');
                              logFirebaseEvent('Container_update_widget_state');
                              setState(() {
                                _model.categoryChoice = null;
                                _model.newItem = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  _model.categoryChoice == null ||
                                          _model.categoryChoice == ''
                                      ? FlutterFlowTheme.of(context).primary
                                      : Color(0xFFE9E9E9),
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 6.0, 12.0, 6.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ihnbadwu' /* All */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'QuickSand',
                                          color: valueOrDefault<Color>(
                                            _model.categoryChoice == null ||
                                                    _model.categoryChoice == ''
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            Colors.white,
                                          ),
                                          fontSize: 14.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'MAIN_PAGE_PAGE_Container_qiwgvn4d_ON_TAP');
                              logFirebaseEvent('Container_update_widget_state');
                              setState(() {
                                _model.newItem = true;
                                _model.categoryChoice = 'New';
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  _model.newItem == true
                                      ? FlutterFlowTheme.of(context).primary
                                      : Color(0xFFE9E9E9),
                                  Color(0xFFE9E9E9),
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 6.0, 12.0, 6.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '7jciauc6' /* New */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'QuickSand',
                                          color: valueOrDefault<Color>(
                                            _model.newItem == true
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                          fontSize: 14.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        FutureBuilder<List<CategoriesRecord>>(
                          future: queryCategoriesRecordOnce(),
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
                            List<CategoriesRecord> rowCategoriesRecordList =
                                snapshot.data!;
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  rowCategoriesRecordList.length, (rowIndex) {
                                final rowCategoriesRecord =
                                    rowCategoriesRecordList[rowIndex];
                                return Visibility(
                                  visible:
                                      rowCategoriesRecord.courses.length > 0,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'MAIN_PAGE_PAGE_Container_rer6g1wh_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_update_widget_state');
                                      setState(() {
                                        _model.categoryChoice =
                                            rowCategoriesRecord.name;
                                        _model.newItem = false;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          _model.categoryChoice ==
                                                  rowCategoriesRecord.name
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : Color(0xFFE9E9E9),
                                          Color(0xFFE9E9E9),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 6.0, 12.0, 6.0),
                                          child: Text(
                                            rowCategoriesRecord.name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'QuickSand',
                                                  color: valueOrDefault<Color>(
                                                    _model.categoryChoice ==
                                                            'Brand & PR'
                                                        ? Colors.white
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  fontSize: 14.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).divide(SizedBox(width: 12.0)),
                            );
                          },
                        ),
                      ]
                          .divide(SizedBox(width: 10.0))
                          .around(SizedBox(width: 10.0)),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.newItem == true) {
                        return StreamBuilder<List<CoursesRecord>>(
                          stream: queryCoursesRecord(
                            queryBuilder: (coursesRecord) => coursesRecord
                                .orderBy('created_at', descending: true),
                            limit: 5,
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
                            List<CoursesRecord> listViewCoursesRecordList =
                                snapshot.data!;
                            return ListView.separated(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewCoursesRecordList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 12.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewCoursesRecord =
                                    listViewCoursesRecordList[listViewIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MAIN_PAGE_PAGE_Container_7bh3anyg_ON_TAP');
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(
                                      'CourseDetailsPage',
                                      queryParameters: {
                                        'course': serializeParam(
                                          listViewCoursesRecord,
                                          ParamType.Document,
                                        ),
                                        'bottomSheet': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'course': listViewCoursesRecord,
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              listViewCoursesRecord.img,
                                              width: 120.0,
                                              height: 120.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 4.0, 0.0, 4.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      listViewCoursesRecord
                                                          .category,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      listViewCoursesRecord
                                                          .name,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 2.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      6.0,
                                                                      0.0),
                                                          child: FutureBuilder<
                                                              int>(
                                                            future:
                                                                queryModulesRecordCount(
                                                              parent:
                                                                  listViewCoursesRecord
                                                                      .reference,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
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
                                                              int textCount =
                                                                  snapshot
                                                                      .data!;
                                                              return Text(
                                                                '${valueOrDefault<String>(
                                                                  textCount
                                                                      .toString(),
                                                                  '0',
                                                                )} modules',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Text(
                                                          '${listViewCoursesRecord.durationHours.toString()}h ${listViewCoursesRecord.minutes.toString()}min',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 12.0,
                                                          height: 12.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              () {
                                                                if (listViewCoursesRecord
                                                                    .students
                                                                    .contains(
                                                                        currentUserReference)) {
                                                                  return Color(
                                                                      0xFF88DE00);
                                                                } else if (listViewCoursesRecord
                                                                    .completedStudents
                                                                    .contains(
                                                                        currentUserReference)) {
                                                                  return Color(
                                                                      0xFFBEBBC1);
                                                                } else {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary;
                                                                }
                                                              }(),
                                                              Color(0xFF88DE00),
                                                            ),
                                                            shape:
                                                                BoxShape.circle,
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
                                                            valueOrDefault<
                                                                String>(
                                                              () {
                                                                if (listViewCoursesRecord
                                                                    .students
                                                                    .contains(
                                                                        currentUserReference)) {
                                                                  return 'Active';
                                                                } else if (listViewCoursesRecord
                                                                    .completedStudents
                                                                    .contains(
                                                                        currentUserReference)) {
                                                                  return 'Completed';
                                                                } else {
                                                                  return 'New';
                                                                }
                                                              }(),
                                                              'Active',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
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
                        );
                      } else {
                        return PagedListView<DocumentSnapshot<Object?>?,
                            CoursesRecord>.separated(
                          pagingController: _model.setListViewController2(
                            CoursesRecord.collection.where('category',
                                isEqualTo: _model.categoryChoice != ''
                                    ? _model.categoryChoice
                                    : null),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 24.0),
                          primary: false,
                          shrinkWrap: true,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          separatorBuilder: (_, __) => SizedBox(height: 24.0),
                          builderDelegate:
                              PagedChildBuilderDelegate<CoursesRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
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
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => Center(
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

                            itemBuilder: (context, _, listViewIndex) {
                              final listViewCoursesRecord = _model
                                  .listViewPagingController2!
                                  .itemList![listViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'MAIN_PAGE_PAGE_Container_bi0mx57v_ON_TAP');
                                  logFirebaseEvent('Container_navigate_to');

                                  context.pushNamed(
                                    'CourseDetailsPage',
                                    queryParameters: {
                                      'course': serializeParam(
                                        listViewCoursesRecord,
                                        ParamType.Document,
                                      ),
                                      'bottomSheet': serializeParam(
                                        false,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'course': listViewCoursesRecord,
                                    },
                                  );
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            listViewCoursesRecord.img,
                                            width: 120.0,
                                            height: 120.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 0.0, 12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Text(
                                                  listViewCoursesRecord
                                                      .category,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 0.0),
                                                  child: Text(
                                                    listViewCoursesRecord.name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall,
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 2.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    6.0,
                                                                    0.0),
                                                        child:
                                                            FutureBuilder<int>(
                                                          future:
                                                              queryModulesRecordCount(
                                                            parent:
                                                                listViewCoursesRecord
                                                                    .reference,
                                                          ),
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
                                                            int textCount =
                                                                snapshot.data!;
                                                            return Text(
                                                              '${valueOrDefault<String>(
                                                                textCount
                                                                    .toString(),
                                                                '0',
                                                              )} modules',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '25qm5l2w' /* 45 mins */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 12.0,
                                                      height: 12.0,
                                                      decoration: BoxDecoration(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          () {
                                                            if (listViewCoursesRecord
                                                                .students
                                                                .contains(
                                                                    currentUserReference)) {
                                                              return Color(
                                                                  0xFF88DE00);
                                                            } else if (listViewCoursesRecord
                                                                .completedStudents
                                                                .contains(
                                                                    currentUserReference)) {
                                                              return Color(
                                                                  0xFFBEBBC1);
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary;
                                                            }
                                                          }(),
                                                          Color(0xFF88DE00),
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
                                                        valueOrDefault<String>(
                                                          () {
                                                            if (listViewCoursesRecord
                                                                .students
                                                                .contains(
                                                                    currentUserReference)) {
                                                              return 'Active';
                                                            } else if (listViewCoursesRecord
                                                                .completedStudents
                                                                .contains(
                                                                    currentUserReference)) {
                                                              return 'Completed';
                                                            } else {
                                                              return 'New';
                                                            }
                                                          }(),
                                                          'Active',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
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
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
