import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlowsRecord extends FirestoreRecord {
  FlowsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "previous" field.
  String? _previous;
  String get previous => _previous ?? '';
  bool hasPrevious() => _previous != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "options_list" field.
  List<String>? _optionsList;
  List<String> get optionsList => _optionsList ?? const [];
  bool hasOptionsList() => _optionsList != null;

  // "botId" field.
  DocumentReference? _botId;
  DocumentReference? get botId => _botId;
  bool hasBotId() => _botId != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "bestAnswer" field.
  String? _bestAnswer;
  String get bestAnswer => _bestAnswer ?? '';
  bool hasBestAnswer() => _bestAnswer != null;

  // "end" field.
  bool? _end;
  bool get end => _end ?? false;
  bool hasEnd() => _end != null;

  void _initializeFields() {
    _previous = snapshotData['previous'] as String?;
    _question = snapshotData['question'] as String?;
    _optionsList = getDataList(snapshotData['options_list']);
    _botId = snapshotData['botId'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
    _bestAnswer = snapshotData['bestAnswer'] as String?;
    _end = snapshotData['end'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('flows');

  static Stream<FlowsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FlowsRecord.fromSnapshot(s));

  static Future<FlowsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FlowsRecord.fromSnapshot(s));

  static FlowsRecord fromSnapshot(DocumentSnapshot snapshot) => FlowsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FlowsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FlowsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FlowsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FlowsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFlowsRecordData({
  String? previous,
  String? question,
  DocumentReference? botId,
  String? image,
  String? bestAnswer,
  bool? end,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'previous': previous,
      'question': question,
      'botId': botId,
      'image': image,
      'bestAnswer': bestAnswer,
      'end': end,
    }.withoutNulls,
  );

  return firestoreData;
}

class FlowsRecordDocumentEquality implements Equality<FlowsRecord> {
  const FlowsRecordDocumentEquality();

  @override
  bool equals(FlowsRecord? e1, FlowsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.previous == e2?.previous &&
        e1?.question == e2?.question &&
        listEquality.equals(e1?.optionsList, e2?.optionsList) &&
        e1?.botId == e2?.botId &&
        e1?.image == e2?.image &&
        e1?.bestAnswer == e2?.bestAnswer &&
        e1?.end == e2?.end;
  }

  @override
  int hash(FlowsRecord? e) => const ListEquality().hash([
        e?.previous,
        e?.question,
        e?.optionsList,
        e?.botId,
        e?.image,
        e?.bestAnswer,
        e?.end
      ]);

  @override
  bool isValidKey(Object? o) => o is FlowsRecord;
}
