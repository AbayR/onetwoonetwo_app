import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BotsRecord extends FirestoreRecord {
  BotsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "greetings" field.
  String? _greetings;
  String get greetings => _greetings ?? '';
  bool hasGreetings() => _greetings != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "module" field.
  DocumentReference? _module;
  DocumentReference? get module => _module;
  bool hasModule() => _module != null;

  // "course" field.
  DocumentReference? _course;
  DocumentReference? get course => _course;
  bool hasCourse() => _course != null;

  // "users_inProgress" field.
  List<DocumentReference>? _usersInProgress;
  List<DocumentReference> get usersInProgress => _usersInProgress ?? const [];
  bool hasUsersInProgress() => _usersInProgress != null;

  // "users_completed" field.
  List<DocumentReference>? _usersCompleted;
  List<DocumentReference> get usersCompleted => _usersCompleted ?? const [];
  bool hasUsersCompleted() => _usersCompleted != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  bool hasPoints() => _points != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _role = snapshotData['role'] as String?;
    _greetings = snapshotData['greetings'] as String?;
    _img = snapshotData['img'] as String?;
    _module = snapshotData['module'] as DocumentReference?;
    _course = snapshotData['course'] as DocumentReference?;
    _usersInProgress = getDataList(snapshotData['users_inProgress']);
    _usersCompleted = getDataList(snapshotData['users_completed']);
    _points = castToType<int>(snapshotData['points']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bots');

  static Stream<BotsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BotsRecord.fromSnapshot(s));

  static Future<BotsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BotsRecord.fromSnapshot(s));

  static BotsRecord fromSnapshot(DocumentSnapshot snapshot) => BotsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BotsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BotsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BotsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BotsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBotsRecordData({
  String? displayName,
  String? role,
  String? greetings,
  String? img,
  DocumentReference? module,
  DocumentReference? course,
  int? points,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'role': role,
      'greetings': greetings,
      'img': img,
      'module': module,
      'course': course,
      'points': points,
    }.withoutNulls,
  );

  return firestoreData;
}

class BotsRecordDocumentEquality implements Equality<BotsRecord> {
  const BotsRecordDocumentEquality();

  @override
  bool equals(BotsRecord? e1, BotsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.displayName == e2?.displayName &&
        e1?.role == e2?.role &&
        e1?.greetings == e2?.greetings &&
        e1?.img == e2?.img &&
        e1?.module == e2?.module &&
        e1?.course == e2?.course &&
        listEquality.equals(e1?.usersInProgress, e2?.usersInProgress) &&
        listEquality.equals(e1?.usersCompleted, e2?.usersCompleted) &&
        e1?.points == e2?.points;
  }

  @override
  int hash(BotsRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.role,
        e?.greetings,
        e?.img,
        e?.module,
        e?.course,
        e?.usersInProgress,
        e?.usersCompleted,
        e?.points
      ]);

  @override
  bool isValidKey(Object? o) => o is BotsRecord;
}
