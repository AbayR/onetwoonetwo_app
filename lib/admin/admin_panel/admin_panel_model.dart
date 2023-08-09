import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/components_profile/profile_settings_container/profile_settings_container_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class AdminPanelModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? pageindex = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ProfileSettingsContainer component.
  late ProfileSettingsContainerModel profileSettingsContainerModel1;
  // Model for ProfileSettingsContainer component.
  late ProfileSettingsContainerModel profileSettingsContainerModel2;
  // Model for ProfileSettingsContainer component.
  late ProfileSettingsContainerModel profileSettingsContainerModel3;
  // Model for ProfileSettingsContainer component.
  late ProfileSettingsContainerModel profileSettingsContainerModel4;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, CoursesRecord>? listViewPagingController3;
  Query? listViewPagingQuery3;
  List<StreamSubscription?> listViewStreamSubscriptions3 = [];

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
    profileSettingsContainerModel1.dispose();
    profileSettingsContainerModel2.dispose();
    profileSettingsContainerModel3.dispose();
    profileSettingsContainerModel4.dispose();
    listViewStreamSubscriptions3.forEach((s) => s?.cancel());
    listViewPagingController3?.dispose();

    profileSettingsContainerModel5.dispose();
    profileSettingsContainerModel6.dispose();
    profileSettingsContainerModel7.dispose();
    profileSettingsContainerModel8.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, CoursesRecord> setListViewController3(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController3 ??= _createListViewController3(query, parent);
    if (listViewPagingQuery3 != query) {
      listViewPagingQuery3 = query;
      listViewPagingController3?.refresh();
    }
    return listViewPagingController3!;
  }

  PagingController<DocumentSnapshot?, CoursesRecord> _createListViewController3(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, CoursesRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCoursesRecordPage(
          queryBuilder: (_) => listViewPagingQuery3 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions3,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
