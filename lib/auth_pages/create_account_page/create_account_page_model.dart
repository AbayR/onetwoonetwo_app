import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/back_component/back_component_widget.dart';
import '/components/btn_main/btn_main_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CreateAccountPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for BackComponent component.
  late BackComponentModel backComponentModel;
  // State field(s) for Name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  String? _nameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3tfwhtmk' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Surname widget.
  TextEditingController? surnameController;
  String? Function(BuildContext, String?)? surnameControllerValidator;
  String? _surnameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'oxhcizgg' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Country widget.
  String? countryValue;
  FormFieldController<String>? countryValueController;
  // State field(s) for PartnerClub widget.
  String? partnerClubValue;
  FormFieldController<String>? partnerClubValueController;
  // State field(s) for dateOfBirth widget.
  TextEditingController? dateOfBirthController;
  final dateOfBirthMask = MaskTextInputFormatter(mask: '##.##.####');
  String? Function(BuildContext, String?)? dateOfBirthControllerValidator;
  String? _dateOfBirthControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'iyubpdvp' /* Field is required */,
      );
    }

    return null;
  }

  // Model for BtnMain component.
  late BtnMainModel btnMainModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backComponentModel = createModel(context, () => BackComponentModel());
    nameControllerValidator = _nameControllerValidator;
    surnameControllerValidator = _surnameControllerValidator;
    dateOfBirthControllerValidator = _dateOfBirthControllerValidator;
    btnMainModel = createModel(context, () => BtnMainModel());
  }

  void dispose() {
    unfocusNode.dispose();
    backComponentModel.dispose();
    nameController?.dispose();
    surnameController?.dispose();
    dateOfBirthController?.dispose();
    btnMainModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
