import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/back_component/back_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class SearchPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String search = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BackComponent component.
  late BackComponentModel backComponentModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<CoursesRecord> simpleSearchResults1 = [];
  List<CoursesRecord> simpleSearchResults2 = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backComponentModel = createModel(context, () => BackComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    backComponentModel.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
