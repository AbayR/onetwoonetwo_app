import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModulesRecord extends FirestoreRecord {
  ModulesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "finishedBy" field.
  List<DocumentReference>? _finishedBy;
  List<DocumentReference> get finishedBy => _finishedBy ?? const [];
  bool hasFinishedBy() => _finishedBy != null;

  // "indexInList" field.
  int? _indexInList;
  int get indexInList => _indexInList ?? 0;
  bool hasIndexInList() => _indexInList != null;

  // "duration_hours" field.
  int? _durationHours;
  int get durationHours => _durationHours ?? 0;
  bool hasDurationHours() => _durationHours != null;

  // "duration_minutes" field.
  int? _durationMinutes;
  int get durationMinutes => _durationMinutes ?? 0;
  bool hasDurationMinutes() => _durationMinutes != null;

  // "inProgressBy" field.
  List<DocumentReference>? _inProgressBy;
  List<DocumentReference> get inProgressBy => _inProgressBy ?? const [];
  bool hasInProgressBy() => _inProgressBy != null;

  // "access_points" field.
  int? _accessPoints;
  int get accessPoints => _accessPoints ?? 0;
  bool hasAccessPoints() => _accessPoints != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _finishedBy = getDataList(snapshotData['finishedBy']);
    _indexInList = castToType<int>(snapshotData['indexInList']);
    _durationHours = castToType<int>(snapshotData['duration_hours']);
    _durationMinutes = castToType<int>(snapshotData['duration_minutes']);
    _inProgressBy = getDataList(snapshotData['inProgressBy']);
    _accessPoints = castToType<int>(snapshotData['access_points']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('modules')
          : FirebaseFirestore.instance.collectionGroup('modules');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('modules').doc();

  static Stream<ModulesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ModulesRecord.fromSnapshot(s));

  static Future<ModulesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ModulesRecord.fromSnapshot(s));

  static ModulesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ModulesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModulesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModulesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ModulesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModulesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModulesRecordData({
  String? name,
  int? indexInList,
  int? durationHours,
  int? durationMinutes,
  int? accessPoints,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'indexInList': indexInList,
      'duration_hours': durationHours,
      'duration_minutes': durationMinutes,
      'access_points': accessPoints,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModulesRecordDocumentEquality implements Equality<ModulesRecord> {
  const ModulesRecordDocumentEquality();

  @override
  bool equals(ModulesRecord? e1, ModulesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.finishedBy, e2?.finishedBy) &&
        e1?.indexInList == e2?.indexInList &&
        e1?.durationHours == e2?.durationHours &&
        e1?.durationMinutes == e2?.durationMinutes &&
        listEquality.equals(e1?.inProgressBy, e2?.inProgressBy) &&
        e1?.accessPoints == e2?.accessPoints;
  }

  @override
  int hash(ModulesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.finishedBy,
        e?.indexInList,
        e?.durationHours,
        e?.durationMinutes,
        e?.inProgressBy,
        e?.accessPoints
      ]);

  @override
  bool isValidKey(Object? o) => o is ModulesRecord;
}
