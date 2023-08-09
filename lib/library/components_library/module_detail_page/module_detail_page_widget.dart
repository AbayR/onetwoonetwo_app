import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/btn_main/btn_main_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library/components_library/confirm_module_restart/confirm_module_restart_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'module_detail_page_model.dart';
export 'module_detail_page_model.dart';

class ModuleDetailPageWidget extends StatefulWidget {
  const ModuleDetailPageWidget({
    Key? key,
    this.module,
  }) : super(key: key);

  final ModulesRecord? module;

  @override
  _ModuleDetailPageWidgetState createState() => _ModuleDetailPageWidgetState();
}

class _ModuleDetailPageWidgetState extends State<ModuleDetailPageWidget> {
  late ModuleDetailPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModuleDetailPageModel());

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
      height: 441.0,
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
              'Module${valueOrDefault<String>(
                widget.module?.indexInList?.toString(),
                '0',
              )} - ${widget.module?.name}',
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'QuickSand',
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
            child: StreamBuilder<CoursesRecord>(
              stream: CoursesRecord.getDocument(widget.module!.parentReference),
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
                  style: FlutterFlowTheme.of(context).bodyMedium,
                );
              },
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                child: FutureBuilder<int>(
                  future: queryBotsRecordCount(
                    queryBuilder: (botsRecord) => botsRecord.where('module',
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
                    int textCount = snapshot.data!;
                    return Text(
                      '${valueOrDefault<String>(
                        textCount.toString(),
                        '0',
                      )} chats',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                child: FutureBuilder<int>(
                  future: queryTacticsRecordCount(
                    parent: widget.module?.parentReference,
                    queryBuilder: (tacticsRecord) => tacticsRecord
                        .where('module', isEqualTo: widget.module?.reference),
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
                    int textCount = snapshot.data!;
                    return Text(
                      '${valueOrDefault<String>(
                        textCount.toString(),
                        '0',
                      )} cards',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 0.0, 0.0),
            child: StreamBuilder<List<ModuleBeganRecord>>(
              stream: queryModuleBeganRecord(
                parent: currentUserReference,
                queryBuilder: (moduleBeganRecord) => moduleBeganRecord
                    .where('module', isEqualTo: widget.module?.reference),
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
                List<ModuleBeganRecord> textModuleBeganRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final textModuleBeganRecord =
                    textModuleBeganRecordList.isNotEmpty
                        ? textModuleBeganRecordList.first
                        : null;
                return Text(
                  'Start course ${dateTimeFormat(
                    'MMMMEEEEd',
                    textModuleBeganRecord?.timeStarted,
                    locale: FFLocalizations.of(context).languageCode,
                  )}',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
            child: StreamBuilder<List<ModuleBeganRecord>>(
              stream: queryModuleBeganRecord(
                parent: currentUserReference,
                queryBuilder: (moduleBeganRecord) => moduleBeganRecord
                    .where('module', isEqualTo: widget.module?.reference),
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
                List<ModuleBeganRecord> textModuleBeganRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final textModuleBeganRecord =
                    textModuleBeganRecordList.isNotEmpty
                        ? textModuleBeganRecordList.first
                        : null;
                return Text(
                  'Finish course ${valueOrDefault<String>(
                    dateTimeFormat(
                      'MMMMEEEEd',
                      textModuleBeganRecord?.timeFinished,
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    ' -',
                  )}',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'ymq3ttbr' /* You can practice communicating... */,
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
                  logFirebaseEvent('MODULE_DETAIL_Container_itah4d8v_ON_TAP');
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
                          child: ConfirmModuleRestartWidget(
                            module: widget.module!,
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
                    btnText: 'Restart module 1',
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
                logFirebaseEvent('MODULE_DETAIL_Container_88rsmaf9_ON_TAP');
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
                      'el14f8hn' /* Close */,
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
