import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListChatsPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  Dec23ChatsRecord? dec;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  BotsRecord? bot;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<FlowsRecord>? flows1;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  Dec23ChatsRecord? dec1;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  BotsRecord? bot1;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<FlowsRecord>? flows11;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
