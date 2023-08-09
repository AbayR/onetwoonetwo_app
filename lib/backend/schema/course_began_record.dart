import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseBeganRecord extends FirestoreRecord {
  CourseBeganRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "course" field.
  DocumentReference? _course;
  DocumentReference? get course => _course;
  bool hasCourse() => _course != null;

  // "time_started" field.
  DateTime? _timeStarted;
  DateTime? get timeStarted => _timeStarted;
  bool hasTimeStarted() => _timeStarted != null;

  // "time_finished" field.
  DateTime? _timeFinished;
  DateTime? get timeFinished => _timeFinished;
  bool hasTimeFinished() => _timeFinished != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _course = snapshotData['course'] as DocumentReference?;
    _timeStarted = snapshotData['time_started'] as DateTime?;
    _timeFinished = snapshotData['time_finished'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('course_began')
          : FirebaseFirestore.instance.collectionGroup('course_began');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('course_began').doc();

  static Stream<CourseBeganRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CourseBeganRecord.fromSnapshot(s));

  static Future<CourseBeganRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CourseBeganRecord.fromSnapshot(s));

  static CourseBeganRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CourseBeganRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CourseBeganRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CourseBeganRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CourseBeganRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CourseBeganRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCourseBeganRecordData({
  DocumentReference? course,
  DateTime? timeStarted,
  DateTime? timeFinished,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'course': course,
      'time_started': timeStarted,
      'time_finished': timeFinished,
    }.withoutNulls,
  );

  return firestoreData;
}

class CourseBeganRecordDocumentEquality implements Equality<CourseBeganRecord> {
  const CourseBeganRecordDocumentEquality();

  @override
  bool equals(CourseBeganRecord? e1, CourseBeganRecord? e2) {
    return e1?.course == e2?.course &&
        e1?.timeStarted == e2?.timeStarted &&
        e1?.timeFinished == e2?.timeFinished;
  }

  @override
  int hash(CourseBeganRecord? e) =>
      const ListEquality().hash([e?.course, e?.timeStarted, e?.timeFinished]);

  @override
  bool isValidKey(Object? o) => o is CourseBeganRecord;
}
