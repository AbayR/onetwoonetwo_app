import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TacticsRecord extends FirestoreRecord {
  TacticsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "module" field.
  DocumentReference? _module;
  DocumentReference? get module => _module;
  bool hasModule() => _module != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "tittle" field.
  String? _tittle;
  String get tittle => _tittle ?? '';
  bool hasTittle() => _tittle != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "users_completed" field.
  List<DocumentReference>? _usersCompleted;
  List<DocumentReference> get usersCompleted => _usersCompleted ?? const [];
  bool hasUsersCompleted() => _usersCompleted != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  bool hasPoints() => _points != null;

  // "indexInList" field.
  int? _indexInList;
  int get indexInList => _indexInList ?? 0;
  bool hasIndexInList() => _indexInList != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _module = snapshotData['module'] as DocumentReference?;
    _img = snapshotData['img'] as String?;
    _tittle = snapshotData['tittle'] as String?;
    _description = snapshotData['description'] as String?;
    _usersCompleted = getDataList(snapshotData['users_completed']);
    _points = castToType<int>(snapshotData['points']);
    _indexInList = castToType<int>(snapshotData['indexInList']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tactics')
          : FirebaseFirestore.instance.collectionGroup('tactics');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('tactics').doc();

  static Stream<TacticsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TacticsRecord.fromSnapshot(s));

  static Future<TacticsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TacticsRecord.fromSnapshot(s));

  static TacticsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TacticsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TacticsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TacticsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TacticsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TacticsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTacticsRecordData({
  DocumentReference? module,
  String? img,
  String? tittle,
  String? description,
  int? points,
  int? indexInList,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'module': module,
      'img': img,
      'tittle': tittle,
      'description': description,
      'points': points,
      'indexInList': indexInList,
    }.withoutNulls,
  );

  return firestoreData;
}

class TacticsRecordDocumentEquality implements Equality<TacticsRecord> {
  const TacticsRecordDocumentEquality();

  @override
  bool equals(TacticsRecord? e1, TacticsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.module == e2?.module &&
        e1?.img == e2?.img &&
        e1?.tittle == e2?.tittle &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.usersCompleted, e2?.usersCompleted) &&
        e1?.points == e2?.points &&
        e1?.indexInList == e2?.indexInList;
  }

  @override
  int hash(TacticsRecord? e) => const ListEquality().hash([
        e?.module,
        e?.img,
        e?.tittle,
        e?.description,
        e?.usersCompleted,
        e?.points,
        e?.indexInList
      ]);

  @override
  bool isValidKey(Object? o) => o is TacticsRecord;
}
