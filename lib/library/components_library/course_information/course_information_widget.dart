import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/btn_main/btn_main_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library/components_library/confirm_restart/confirm_restart_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'course_information_model.dart';
export 'course_information_model.dart';

class CourseInformationWidget extends StatefulWidget {
  const CourseInformationWidget({
    Key? key,
    required this.course,
    bool? isBottomSheet,
  })  : this.isBottomSheet = isBottomSheet ?? false,
        super(key: key);

  final CoursesRecord? course;
  final bool isBottomSheet;

  @override
  _CourseInformationWidgetState createState() =>
      _CourseInformationWidgetState();
}

class _CourseInformationWidgetState extends State<CourseInformationWidget> {
  late CourseInformationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseInformationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (widget.isBottomSheet == true)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: Container(
                      width: 80.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.course!.img,
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                widget.course!.name,
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'QuickSand',
                      fontSize: 17.0,
                      useGoogleFonts: false,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: Text(
                  widget.course!.category,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'QuickSand',
                        color: Color(0xFF6C6F71),
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<List<ModulesRecord>>(
                    stream: queryModulesRecord(
                      parent: widget.course?.reference,
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
                      List<ModulesRecord> textModulesRecordList =
                          snapshot.data!;
                      return Text(
                        '${textModulesRecordList.length.toString()} modules     ${widget.course?.durationHours?.toString()}h ${widget.course?.minutes?.toString()}min',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'QuickSand',
                              color: Color(0xFF6C6F71),
                              useGoogleFonts: false,
                            ),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 12.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          () {
                            if (widget.course!.students
                                .contains(currentUserReference)) {
                              return Color(0xFF88DE00);
                            } else if (widget.course!.completedStudents
                                .contains(currentUserReference)) {
                              return Color(0xFFBEBBC1);
                            } else {
                              return FlutterFlowTheme.of(context).primary;
                            }
                          }(),
                          Color(0xFF88DE00),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          () {
                            if (widget.course!.students
                                .contains(currentUserReference)) {
                              return 'Active';
                            } else if (widget.course!.completedStudents
                                .contains(currentUserReference)) {
                              return 'Completed';
                            } else {
                              return 'New';
                            }
                          }(),
                          'Active',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.isBottomSheet == true)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: StreamBuilder<List<CourseBeganRecord>>(
                    stream: queryCourseBeganRecord(
                      parent: currentUserReference,
                      queryBuilder: (courseBeganRecord) => courseBeganRecord
                          .where('course', isEqualTo: widget.course?.reference),
                      singleRecord: true,
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
                      List<CourseBeganRecord> textCourseBeganRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final textCourseBeganRecord =
                          textCourseBeganRecordList.isNotEmpty
                              ? textCourseBeganRecordList.first
                              : null;
                      return Text(
                        'Start course - ${dateTimeFormat(
                          'd/M/y',
                          textCourseBeganRecord?.timeStarted,
                          locale: FFLocalizations.of(context).languageCode,
                        )} ${dateTimeFormat(
                          'Hm',
                          textCourseBeganRecord?.timeStarted,
                          locale: FFLocalizations.of(context).languageCode,
                        )}',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      );
                    },
                  ),
                ),
              if (widget.isBottomSheet == true)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 12.0),
                  child: StreamBuilder<List<CourseBeganRecord>>(
                    stream: queryCourseBeganRecord(
                      parent: currentUserReference,
                      queryBuilder: (courseBeganRecord) => courseBeganRecord
                          .where('course', isEqualTo: widget.course?.reference),
                      singleRecord: true,
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
                      List<CourseBeganRecord> textCourseBeganRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final textCourseBeganRecord =
                          textCourseBeganRecordList.isNotEmpty
                              ? textCourseBeganRecordList.first
                              : null;
                      return Text(
                        'Finish course - ${valueOrDefault<String>(
                          dateTimeFormat(
                            'd/M/y',
                            textCourseBeganRecord?.timeFinished,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          '-',
                        )} ${valueOrDefault<String>(
                          dateTimeFormat(
                            'Hm',
                            textCourseBeganRecord?.timeFinished,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          '-',
                        )}',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      );
                    },
                  ),
                ),
              Text(
                widget.course!.description,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'QuickSand',
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: false,
                    ),
              ),
              if (widget.isBottomSheet == false)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'sg0e7up1' /* The course included */,
                    ),
                    style: FlutterFlowTheme.of(context).titleSmall,
                  ),
                ),
              if (widget.isBottomSheet == false)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                  child: StreamBuilder<List<ModulesRecord>>(
                    stream: queryModulesRecord(
                      parent: widget.course?.reference,
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
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(columnModulesRecordList.length,
                                (columnIndex) {
                          final columnModulesRecord =
                              columnModulesRecordList[columnIndex];
                          return RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'Module ${columnModulesRecord.indexInList.toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'QuickSand',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                TextSpan(
                                  text: ' - ${columnModulesRecord.name}',
                                  style: TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'QuickSand',
                                    fontSize: 14.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          );
                        })
                            .divide(SizedBox(height: 4.0))
                            .around(SizedBox(height: 4.0)),
                      );
                    },
                  ),
                ),
              if (widget.isBottomSheet == false)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'gl3d68cx' /* Your mentors in chats */,
                    ),
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'QuickSand',
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              if (widget.isBottomSheet == false)
                StreamBuilder<List<BotsRecord>>(
                  stream: queryBotsRecord(
                    queryBuilder: (botsRecord) => botsRecord.where('course',
                        isEqualTo: widget.course?.reference),
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
                    List<BotsRecord> rowBotsRecordList = snapshot.data!;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children:
                          List.generate(rowBotsRecordList.length, (rowIndex) {
                        final rowBotsRecord = rowBotsRecordList[rowIndex];
                        return Container(
                          width: 56.0,
                          height: 56.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            rowBotsRecord.img,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).divide(SizedBox(width: 12.0)),
                    );
                  },
                ),
              if (widget.isBottomSheet == false)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 24.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'COURSE_INFORMATION_Container_443a5kvo_ON');
                      if (!widget.course!.students
                          .contains(currentUserReference)) {
                        logFirebaseEvent('BtnMain_backend_call');

                        await widget.course!.reference.update({
                          'students':
                              FieldValue.arrayUnion([currentUserReference]),
                        });
                        logFirebaseEvent('BtnMain_backend_call');

                        await CourseBeganRecord.createDoc(currentUserReference!)
                            .set(createCourseBeganRecordData(
                          course: widget.course?.reference,
                          timeStarted: getCurrentTimestamp,
                        ));
                        logFirebaseEvent('BtnMain_navigate_to');

                        context.pushNamed(
                          'ModulesPage',
                          queryParameters: {
                            'course': serializeParam(
                              widget.course?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        logFirebaseEvent('BtnMain_navigate_to');

                        context.pushNamed(
                          'ModulesPage',
                          queryParameters: {
                            'course': serializeParam(
                              widget.course?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      }
                    },
                    child: wrapWithModel(
                      model: _model.btnMainModel1,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: BtnMainWidget(
                        btnText: widget.course?.students
                                    ?.contains(currentUserReference) ==
                                true
                            ? 'Continue learning'
                            : 'Start course',
                      ),
                    ),
                  ),
                ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (widget.course?.completedStudents
                          ?.contains(currentUserReference) ??
                      true)
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'COURSE_INFORMATION_Container_blx73pu0_ON');
                            logFirebaseEvent('BtnMain_bottom_sheet');
                            Navigator.pop(context);
                            logFirebaseEvent('BtnMain_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height: 325.0,
                                    child: ConfirmRestartWidget(
                                      myStudies: widget.course!,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          child: wrapWithModel(
                            model: _model.btnMainModel2,
                            updateCallback: () => setState(() {}),
                            child: BtnMainWidget(
                              btnText: 'Restart course',
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              if (widget.isBottomSheet == true)
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 30.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'COURSE_INFORMATION_Container_rptin53w_ON');
                      logFirebaseEvent('Container_bottom_sheet');
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'hsjd7orb' /* Close */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'QuickSand',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 15.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
