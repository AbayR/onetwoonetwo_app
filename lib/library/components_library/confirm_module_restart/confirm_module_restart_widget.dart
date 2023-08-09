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
import 'confirm_module_restart_model.dart';
export 'confirm_module_restart_model.dart';

class ConfirmModuleRestartWidget extends StatefulWidget {
  const ConfirmModuleRestartWidget({
    Key? key,
    required this.module,
  }) : super(key: key);

  final ModulesRecord? module;

  @override
  _ConfirmModuleRestartWidgetState createState() =>
      _ConfirmModuleRestartWidgetState();
}

class _ConfirmModuleRestartWidgetState
    extends State<ConfirmModuleRestartWidget> {
  late ConfirmModuleRestartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmModuleRestartModel());

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
              'Module ${widget.module?.indexInList?.toString()} - ${widget.module?.name}',
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
                'eknzvh8c' /* Are you sure you want to start... */,
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
                  logFirebaseEvent('CONFIRM_MODULE_RESTART_Container_6akkxgm');
                  logFirebaseEvent('BtnMain_backend_call');

                  await widget.module!.reference.update({
                    'finishedBy':
                        FieldValue.arrayRemove([currentUserReference]),
                    'inProgressBy':
                        FieldValue.arrayUnion([currentUserReference]),
                  });
                  logFirebaseEvent('BtnMain_firestore_query');
                  _model.myModule = await queryModuleBeganRecordOnce(
                    parent: currentUserReference,
                    queryBuilder: (moduleBeganRecord) => moduleBeganRecord
                        .where('module', isEqualTo: widget.module?.reference),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);
                  logFirebaseEvent('BtnMain_backend_call');
                  await _model.myModule!.reference.delete();
                  logFirebaseEvent('BtnMain_bottom_sheet');
                  Navigator.pop(context);

                  setState(() {});
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
                logFirebaseEvent('CONFIRM_MODULE_RESTART_Container_x24dio1');
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
                      '5mr5gq0h' /* Close */,
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
