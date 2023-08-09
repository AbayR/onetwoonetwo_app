// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchHistoryStruct extends FFFirebaseStruct {
  SearchHistoryStruct({
    String? name,
    DateTime? datetime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _datetime = datetime,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "datetime" field.
  DateTime? _datetime;
  DateTime? get datetime => _datetime;
  set datetime(DateTime? val) => _datetime = val;
  bool hasDatetime() => _datetime != null;

  static SearchHistoryStruct fromMap(Map<String, dynamic> data) =>
      SearchHistoryStruct(
        name: data['name'] as String?,
        datetime: data['datetime'] as DateTime?,
      );

  static SearchHistoryStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SearchHistoryStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'datetime': _datetime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'datetime': serializeParam(
          _datetime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static SearchHistoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchHistoryStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        datetime: deserializeParam(
          data['datetime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'SearchHistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchHistoryStruct &&
        name == other.name &&
        datetime == other.datetime;
  }

  @override
  int get hashCode => const ListEquality().hash([name, datetime]);
}

SearchHistoryStruct createSearchHistoryStruct({
  String? name,
  DateTime? datetime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SearchHistoryStruct(
      name: name,
      datetime: datetime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SearchHistoryStruct? updateSearchHistoryStruct(
  SearchHistoryStruct? searchHistory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    searchHistory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSearchHistoryStructData(
  Map<String, dynamic> firestoreData,
  SearchHistoryStruct? searchHistory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (searchHistory == null) {
    return;
  }
  if (searchHistory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && searchHistory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final searchHistoryData =
      getSearchHistoryFirestoreData(searchHistory, forFieldValue);
  final nestedData =
      searchHistoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = searchHistory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSearchHistoryFirestoreData(
  SearchHistoryStruct? searchHistory, [
  bool forFieldValue = false,
]) {
  if (searchHistory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(searchHistory.toMap());

  // Add any Firestore field values
  searchHistory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSearchHistoryListFirestoreData(
  List<SearchHistoryStruct>? searchHistorys,
) =>
    searchHistorys
        ?.map((e) => getSearchHistoryFirestoreData(e, true))
        .toList() ??
    [];
