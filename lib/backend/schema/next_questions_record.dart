import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NextQuestionsRecord extends FirestoreRecord {
  NextQuestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "answer" field.
  int? _answer;
  int get answer => _answer ?? 0;
  bool hasAnswer() => _answer != null;

  // "previous_question" field.
  String? _previousQuestion;
  String get previousQuestion => _previousQuestion ?? '';
  bool hasPreviousQuestion() => _previousQuestion != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "answers" field.
  List<String>? _answers;
  List<String> get answers => _answers ?? const [];
  bool hasAnswers() => _answers != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _answer = castToType<int>(snapshotData['answer']);
    _previousQuestion = snapshotData['previous_question'] as String?;
    _message = snapshotData['message'] as String?;
    _answers = getDataList(snapshotData['answers']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('next_questions')
          : FirebaseFirestore.instance.collectionGroup('next_questions');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('next_questions').doc();

  static Stream<NextQuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NextQuestionsRecord.fromSnapshot(s));

  static Future<NextQuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NextQuestionsRecord.fromSnapshot(s));

  static NextQuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NextQuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NextQuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NextQuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NextQuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NextQuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNextQuestionsRecordData({
  int? answer,
  String? previousQuestion,
  String? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'answer': answer,
      'previous_question': previousQuestion,
      'message': message,
    }.withoutNulls,
  );

  return firestoreData;
}

class NextQuestionsRecordDocumentEquality
    implements Equality<NextQuestionsRecord> {
  const NextQuestionsRecordDocumentEquality();

  @override
  bool equals(NextQuestionsRecord? e1, NextQuestionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.answer == e2?.answer &&
        e1?.previousQuestion == e2?.previousQuestion &&
        e1?.message == e2?.message &&
        listEquality.equals(e1?.answers, e2?.answers);
  }

  @override
  int hash(NextQuestionsRecord? e) => const ListEquality()
      .hash([e?.answer, e?.previousQuestion, e?.message, e?.answers]);

  @override
  bool isValidKey(Object? o) => o is NextQuestionsRecord;
}
