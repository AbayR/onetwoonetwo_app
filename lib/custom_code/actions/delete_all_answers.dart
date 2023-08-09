// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> deleteAllAnswers(DocumentReference chatReference) async {
  // Reference to the "answers" collection
  CollectionReference answersCollection =
      FirebaseFirestore.instance.collection('answers');

  // Get all documents from the "answers" collection
  QuerySnapshot querySnapshot = await answersCollection.get();

  // Loop through each document and delete it based on chat reference
  querySnapshot.docs.forEach((document) async {
    DocumentReference documentChatReference = document.get('chat');

    if (documentChatReference == chatReference) {
      document.reference.delete();
    }
  });
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
