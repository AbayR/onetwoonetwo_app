import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class SetPinPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<int> pincode = [];
  void addToPincode(int item) => pincode.add(item);
  void removeFromPincode(int item) => pincode.remove(item);
  void removeAtIndexFromPincode(int index) => pincode.removeAt(index);
  void updatePincodeAtIndex(int index, Function(int) updateFn) =>
      pincode[index] = updateFn(pincode[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  bool biometric = false;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  void dispose() {
    unfocusNode.dispose();
    pinCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
