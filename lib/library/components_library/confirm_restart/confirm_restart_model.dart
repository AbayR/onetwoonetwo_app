import '/backend/backend.dart';
import '/components/btn_main/btn_main_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library/components_library/restart_course_component/restart_course_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmRestartModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for BtnMain component.
  late BtnMainModel btnMainModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    btnMainModel = createModel(context, () => BtnMainModel());
  }

  void dispose() {
    btnMainModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
