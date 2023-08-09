import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/btn_main/btn_main_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'restart_course_component_model.dart';
export 'restart_course_component_model.dart';

class RestartCourseComponentWidget extends StatefulWidget {
  const RestartCourseComponentWidget({
    Key? key,
    required this.courseToRestart,
  }) : super(key: key);

  final CoursesRecord? courseToRestart;

  @override
  _RestartCourseComponentWidgetState createState() =>
      _RestartCourseComponentWidgetState();
}

class _RestartCourseComponentWidgetState
    extends State<RestartCourseComponentWidget> {
  late RestartCourseComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestartCourseComponentModel());

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
      height: 375.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Container(
              width: 80.0,
              height: 4.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '7xp27sou' /* This course will be restarted */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'QuickSand',
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'y98p67xa' /* You can practice communicating... */,
              ),
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'QuickSand',
                    fontSize: 15.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'RESTART_COURSE_COMPONENT_Container_j54k9');
                    logFirebaseEvent('BtnMain_backend_call');

                    await widget.courseToRestart!.reference.update({
                      'completed_students':
                          FieldValue.arrayRemove([currentUserReference]),
                      'students': FieldValue.arrayUnion([currentUserReference]),
                    });
                    logFirebaseEvent('BtnMain_firestore_query');
                    _model.course = await queryCourseBeganRecordOnce(
                      parent: currentUserReference,
                      queryBuilder: (courseBeganRecord) =>
                          courseBeganRecord.where('course',
                              isEqualTo: widget.courseToRestart?.reference),
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);
                    logFirebaseEvent('BtnMain_backend_call');
                    await _model.course!.reference.delete();
                    logFirebaseEvent('BtnMain_bottom_sheet');
                    Navigator.pop(context);
                    logFirebaseEvent('BtnMain_navigate_to');

                    context.goNamed('MainPage');

                    setState(() {});
                  },
                  child: wrapWithModel(
                    model: _model.btnMainModel,
                    updateCallback: () => setState(() {}),
                    child: BtnMainWidget(
                      btnText: 'Eah! Let\'s go',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 24.0),
            child: Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 1.0,
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'muljvx99' /* Cancel restart */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'QuickSand',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
