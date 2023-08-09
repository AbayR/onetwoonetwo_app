import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "duration_hours" field.
  int? _durationHours;
  int get durationHours => _durationHours ?? 0;
  bool hasDurationHours() => _durationHours != null;

  // "minutes" field.
  int? _minutes;
  int get minutes => _minutes ?? 0;
  bool hasMinutes() => _minutes != null;

  // "students" field.
  List<DocumentReference>? _students;
  List<DocumentReference> get students => _students ?? const [];
  bool hasStudents() => _students != null;

  // "completed_students" field.
  List<DocumentReference>? _completedStudents;
  List<DocumentReference> get completedStudents =>
      _completedStudents ?? const [];
  bool hasCompletedStudents() => _completedStudents != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _category = snapshotData['category'] as String?;
    _description = snapshotData['description'] as String?;
    _img = snapshotData['img'] as String?;
    _durationHours = castToType<int>(snapshotData['duration_hours']);
    _minutes = castToType<int>(snapshotData['minutes']);
    _students = getDataList(snapshotData['students']);
    _completedStudents = getDataList(snapshotData['completed_students']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courses');

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesRecordData({
  String? name,
  String? category,
  String? description,
  String? img,
  int? durationHours,
  int? minutes,
  DateTime? createdAt,
  DocumentReference? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'category': category,
      'description': description,
      'img': img,
      'duration_hours': durationHours,
      'minutes': minutes,
      'created_at': createdAt,
      'created_by': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.category == e2?.category &&
        e1?.description == e2?.description &&
        e1?.img == e2?.img &&
        e1?.durationHours == e2?.durationHours &&
        e1?.minutes == e2?.minutes &&
        listEquality.equals(e1?.students, e2?.students) &&
        listEquality.equals(e1?.completedStudents, e2?.completedStudents) &&
        e1?.createdAt == e2?.createdAt &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.category,
        e?.description,
        e?.img,
        e?.durationHours,
        e?.minutes,
        e?.students,
        e?.completedStudents,
        e?.createdAt,
        e?.createdBy
      ]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
