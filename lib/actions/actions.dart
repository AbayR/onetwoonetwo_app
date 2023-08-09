import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future goToModules(
  BuildContext context, {
  required DocumentReference? course,
}) async {
  logFirebaseEvent('GoToModules_navigate_to');

  context.pushNamed(
    'ModulesPage',
    queryParameters: {
      'course': serializeParam(
        course,
        ParamType.DocumentReference,
      ),
    }.withoutNulls,
  );
}
