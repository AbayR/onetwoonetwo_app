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

class CourseInformationModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for BtnMain component.
  late BtnMainModel btnMainModel1;
  // Model for BtnMain component.
  late BtnMainModel btnMainModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    btnMainModel1 = createModel(context, () => BtnMainModel());
    btnMainModel2 = createModel(context, () => BtnMainModel());
  }

  void dispose() {
    btnMainModel1.dispose();
    btnMainModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
