import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library/components_library/course_information/course_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CourseDetailsPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for courseInformation component.
  late CourseInformationModel courseInformationModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    courseInformationModel =
        createModel(context, () => CourseInformationModel());
  }

  void dispose() {
    unfocusNode.dispose();
    courseInformationModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
