import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AwardsRecord extends FirestoreRecord {
  AwardsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _img = snapshotData['img'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('awards');

  static Stream<AwardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AwardsRecord.fromSnapshot(s));

  static Future<AwardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AwardsRecord.fromSnapshot(s));

  static AwardsRecord fromSnapshot(DocumentSnapshot snapshot) => AwardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AwardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AwardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AwardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AwardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAwardsRecordData({
  String? img,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'img': img,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class AwardsRecordDocumentEquality implements Equality<AwardsRecord> {
  const AwardsRecordDocumentEquality();

  @override
  bool equals(AwardsRecord? e1, AwardsRecord? e2) {
    return e1?.img == e2?.img && e1?.description == e2?.description;
  }

  @override
  int hash(AwardsRecord? e) =>
      const ListEquality().hash([e?.img, e?.description]);

  @override
  bool isValidKey(Object? o) => o is AwardsRecord;
}
