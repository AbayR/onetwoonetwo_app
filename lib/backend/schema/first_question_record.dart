import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FirstQuestionRecord extends FirestoreRecord {
  FirstQuestionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "answers" field.
  List<String>? _answers;
  List<String> get answers => _answers ?? const [];
  bool hasAnswers() => _answers != null;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _answers = getDataList(snapshotData['answers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('first_question');

  static Stream<FirstQuestionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FirstQuestionRecord.fromSnapshot(s));

  static Future<FirstQuestionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FirstQuestionRecord.fromSnapshot(s));

  static FirstQuestionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FirstQuestionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FirstQuestionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FirstQuestionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FirstQuestionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FirstQuestionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFirstQuestionRecordData({
  String? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
    }.withoutNulls,
  );

  return firestoreData;
}

class FirstQuestionRecordDocumentEquality
    implements Equality<FirstQuestionRecord> {
  const FirstQuestionRecordDocumentEquality();

  @override
  bool equals(FirstQuestionRecord? e1, FirstQuestionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.message == e2?.message &&
        listEquality.equals(e1?.answers, e2?.answers);
  }

  @override
  int hash(FirstQuestionRecord? e) =>
      const ListEquality().hash([e?.message, e?.answers]);

  @override
  bool isValidKey(Object? o) => o is FirstQuestionRecord;
}
