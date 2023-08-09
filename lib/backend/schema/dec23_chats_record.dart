import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Dec23ChatsRecord extends FirestoreRecord {
  Dec23ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user2" field.
  String? _user2;
  String get user2 => _user2 ?? '';
  bool hasUser2() => _user2 != null;

  // "ts" field.
  DateTime? _ts;
  DateTime? get ts => _ts;
  bool hasTs() => _ts != null;

  // "uid1" field.
  String? _uid1;
  String get uid1 => _uid1 ?? '';
  bool hasUid1() => _uid1 != null;

  // "uid2" field.
  String? _uid2;
  String get uid2 => _uid2 ?? '';
  bool hasUid2() => _uid2 != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "in_progress" field.
  bool? _inProgress;
  bool get inProgress => _inProgress ?? false;
  bool hasInProgress() => _inProgress != null;

  // "bot" field.
  DocumentReference? _bot;
  DocumentReference? get bot => _bot;
  bool hasBot() => _bot != null;

  // "user1" field.
  DocumentReference? _user1;
  DocumentReference? get user1 => _user1;
  bool hasUser1() => _user1 != null;

  // "points" field.
  DocumentReference? _points;
  DocumentReference? get points => _points;
  bool hasPoints() => _points != null;

  void _initializeFields() {
    _user2 = snapshotData['user2'] as String?;
    _ts = snapshotData['ts'] as DateTime?;
    _uid1 = snapshotData['uid1'] as String?;
    _uid2 = snapshotData['uid2'] as String?;
    _lastMessage = snapshotData['last_message'] as String?;
    _inProgress = snapshotData['in_progress'] as bool?;
    _bot = snapshotData['bot'] as DocumentReference?;
    _user1 = snapshotData['user1'] as DocumentReference?;
    _points = snapshotData['points'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dec23_chats');

  static Stream<Dec23ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Dec23ChatsRecord.fromSnapshot(s));

  static Future<Dec23ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Dec23ChatsRecord.fromSnapshot(s));

  static Dec23ChatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      Dec23ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Dec23ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Dec23ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Dec23ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Dec23ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDec23ChatsRecordData({
  String? user2,
  DateTime? ts,
  String? uid1,
  String? uid2,
  String? lastMessage,
  bool? inProgress,
  DocumentReference? bot,
  DocumentReference? user1,
  DocumentReference? points,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user2': user2,
      'ts': ts,
      'uid1': uid1,
      'uid2': uid2,
      'last_message': lastMessage,
      'in_progress': inProgress,
      'bot': bot,
      'user1': user1,
      'points': points,
    }.withoutNulls,
  );

  return firestoreData;
}

class Dec23ChatsRecordDocumentEquality implements Equality<Dec23ChatsRecord> {
  const Dec23ChatsRecordDocumentEquality();

  @override
  bool equals(Dec23ChatsRecord? e1, Dec23ChatsRecord? e2) {
    return e1?.user2 == e2?.user2 &&
        e1?.ts == e2?.ts &&
        e1?.uid1 == e2?.uid1 &&
        e1?.uid2 == e2?.uid2 &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.inProgress == e2?.inProgress &&
        e1?.bot == e2?.bot &&
        e1?.user1 == e2?.user1 &&
        e1?.points == e2?.points;
  }

  @override
  int hash(Dec23ChatsRecord? e) => const ListEquality().hash([
        e?.user2,
        e?.ts,
        e?.uid1,
        e?.uid2,
        e?.lastMessage,
        e?.inProgress,
        e?.bot,
        e?.user1,
        e?.points
      ]);

  @override
  bool isValidKey(Object? o) => o is Dec23ChatsRecord;
}
