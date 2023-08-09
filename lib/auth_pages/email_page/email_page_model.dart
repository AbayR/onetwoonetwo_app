import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/back_component/back_component_widget.dart';
import '/components/btn_main/btn_main_widget.dart';
import '/components/privacy_policy/privacy_policy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmailPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BackComponent component.
  late BackComponentModel backComponentModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for BtnMain component.
  late BtnMainModel btnMainModel;
  // Stores action output result for [Backend Call - API (sendEmail)] action in BtnMain widget.
  ApiCallResponse? apiResulto2j;
  // Stores action output result for [Backend Call - API (sendEmail)] action in BtnMain widget.
  ApiCallResponse? apiResult6vw;
  // Stores action output result for [Backend Call - API (sendEmail)] action in BtnMain widget.
  ApiCallResponse? apiResultomz;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backComponentModel = createModel(context, () => BackComponentModel());
    btnMainModel = createModel(context, () => BtnMainModel());
  }

  void dispose() {
    unfocusNode.dispose();
    backComponentModel.dispose();
    textController?.dispose();
    btnMainModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
