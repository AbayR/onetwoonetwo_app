import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModuleBeganRecord extends FirestoreRecord {
  ModuleBeganRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "module" field.
  DocumentReference? _module;
  DocumentReference? get module => _module;
  bool hasModule() => _module != null;

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
    _module = snapshotData['module'] as DocumentReference?;
    _timeStarted = snapshotData['time_started'] as DateTime?;
    _timeFinished = snapshotData['time_finished'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('module_began')
          : FirebaseFirestore.instance.collectionGroup('module_began');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('module_began').doc();

  static Stream<ModuleBeganRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ModuleBeganRecord.fromSnapshot(s));

  static Future<ModuleBeganRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ModuleBeganRecord.fromSnapshot(s));

  static ModuleBeganRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ModuleBeganRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModuleBeganRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModuleBeganRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ModuleBeganRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModuleBeganRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModuleBeganRecordData({
  DocumentReference? module,
  DateTime? timeStarted,
  DateTime? timeFinished,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'module': module,
      'time_started': timeStarted,
      'time_finished': timeFinished,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModuleBeganRecordDocumentEquality implements Equality<ModuleBeganRecord> {
  const ModuleBeganRecordDocumentEquality();

  @override
  bool equals(ModuleBeganRecord? e1, ModuleBeganRecord? e2) {
    return e1?.module == e2?.module &&
        e1?.timeStarted == e2?.timeStarted &&
        e1?.timeFinished == e2?.timeFinished;
  }

  @override
  int hash(ModuleBeganRecord? e) =>
      const ListEquality().hash([e?.module, e?.timeStarted, e?.timeFinished]);

  @override
  bool isValidKey(Object? o) => o is ModuleBeganRecord;
}
