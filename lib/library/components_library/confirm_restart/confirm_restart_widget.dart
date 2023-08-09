import '/backend/backend.dart';
import '/components/btn_main/btn_main_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library/components_library/restart_course_component/restart_course_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirm_restart_model.dart';
export 'confirm_restart_model.dart';

class ConfirmRestartWidget extends StatefulWidget {
  const ConfirmRestartWidget({
    Key? key,
    required this.myStudies,
  }) : super(key: key);

  final CoursesRecord? myStudies;

  @override
  _ConfirmRestartWidgetState createState() => _ConfirmRestartWidgetState();
}

class _ConfirmRestartWidgetState extends State<ConfirmRestartWidget> {
  late ConfirmRestartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmRestartModel());

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
      height: 326.0,
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
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
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
            child: Text(
              'Course - ${widget.myStudies?.name}',
              style: FlutterFlowTheme.of(context).titleSmall.override(
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
                'ddyvyld1' /* Are you sure you want to start... */,
              ),
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
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('CONFIRM_RESTART_Container_x1bxd99b_ON_TA');
                  logFirebaseEvent('BtnMain_bottom_sheet');
                  Navigator.pop(context);
                  logFirebaseEvent('BtnMain_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: Container(
                          height: 375.0,
                          child: RestartCourseComponentWidget(
                            courseToRestart: widget.myStudies!,
                          ),
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                child: wrapWithModel(
                  model: _model.btnMainModel,
                  updateCallback: () => setState(() {}),
                  child: BtnMainWidget(
                    btnText: 'Confirm restart',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 30.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('CONFIRM_RESTART_Container_hvvwr4yd_ON_TA');
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
                      'qy42pk5y' /* Close */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
    );
  }
}
