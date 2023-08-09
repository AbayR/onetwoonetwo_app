import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/components_profile/about_points/about_points_widget.dart';
import '/profile/components_profile/no_awards/no_awards_widget.dart';
import '/profile/components_profile/profile_settings_container/profile_settings_container_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NoAwards component.
  late NoAwardsModel noAwardsModel;
  // Model for ProfileSettingsContainer component.
  late ProfileSettingsContainerModel profileSettingsContainerModel1;
  // Model for ProfileSettingsContainer component.
  late ProfileSettingsContainerModel profileSettingsContainerModel2;
  // Model for ProfileSettingsContainer component.
  late ProfileSettingsContainerModel profileSettingsContainerModel3;
  // Model for ProfileSettingsContainer component.
  late ProfileSettingsContainerModel profileSettingsContainerModel4;
  // Model for ProfileSettingsContainer component.
  late ProfileSettingsContainerModel profileSettingsContainerModel5;
  // Model for ProfileSettingsContainer component.
  late ProfileSettingsContainerModel profileSettingsContainerModel6;
  // Model for ProfileSettingsContainer component.
  late ProfileSettingsContainerModel profileSettingsContainerModel7;
  // Model for ProfileSettingsContainer component.
  late ProfileSettingsContainerModel profileSettingsContainerModel8;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    noAwardsModel = createModel(context, () => NoAwardsModel());
    profileSettingsContainerModel1 =
        createModel(context, () => ProfileSettingsContainerModel());
    profileSettingsContainerModel2 =
        createModel(context, () => ProfileSettingsContainerModel());
    profileSettingsContainerModel3 =
        createModel(context, () => ProfileSettingsContainerModel());
    profileSettingsContainerModel4 =
        createModel(context, () => ProfileSettingsContainerModel());
    profileSettingsContainerModel5 =
        createModel(context, () => ProfileSettingsContainerModel());
    profileSettingsContainerModel6 =
        createModel(context, () => ProfileSettingsContainerModel());
    profileSettingsContainerModel7 =
        createModel(context, () => ProfileSettingsContainerModel());
    profileSettingsContainerModel8 =
        createModel(context, () => ProfileSettingsContainerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    noAwardsModel.dispose();
    profileSettingsContainerModel1.dispose();
    profileSettingsContainerModel2.dispose();
    profileSettingsContainerModel3.dispose();
    profileSettingsContainerModel4.dispose();
    profileSettingsContainerModel5.dispose();
    profileSettingsContainerModel6.dispose();
    profileSettingsContainerModel7.dispose();
    profileSettingsContainerModel8.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
