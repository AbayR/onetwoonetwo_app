import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateCoursePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for courseName widget.
  TextEditingController? courseNameController;
  String? Function(BuildContext, String?)? courseNameControllerValidator;
  String? _courseNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'htf6qtpo' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for courseDescription widget.
  TextEditingController? courseDescriptionController;
  String? Function(BuildContext, String?)? courseDescriptionControllerValidator;
  String? _courseDescriptionControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lyq33o2i' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for courseDurationHours widget.
  TextEditingController? courseDurationHoursController;
  String? Function(BuildContext, String?)?
      courseDurationHoursControllerValidator;
  String? _courseDurationHoursControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'j1gde9e9' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for courseDurationMinutes widget.
  TextEditingController? courseDurationMinutesController;
  String? Function(BuildContext, String?)?
      courseDurationMinutesControllerValidator;
  String? _courseDurationMinutesControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'apm4v5xk' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CoursesRecord? newCourse;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CategoriesRecord? categoryAddCourse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    courseNameControllerValidator = _courseNameControllerValidator;
    courseDescriptionControllerValidator =
        _courseDescriptionControllerValidator;
    courseDurationHoursControllerValidator =
        _courseDurationHoursControllerValidator;
    courseDurationMinutesControllerValidator =
        _courseDurationMinutesControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    courseNameController?.dispose();
    courseDescriptionController?.dispose();
    courseDurationHoursController?.dispose();
    courseDurationMinutesController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
