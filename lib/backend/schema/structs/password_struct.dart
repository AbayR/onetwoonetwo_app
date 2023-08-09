// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PasswordStruct extends FFFirebaseStruct {
  PasswordStruct({
    int? password,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _password = password,
        super(firestoreUtilData);

  // "password" field.
  int? _password;
  int get password => _password ?? 0;
  set password(int? val) => _password = val;
  void incrementPassword(int amount) => _password = password + amount;
  bool hasPassword() => _password != null;

  static PasswordStruct fromMap(Map<String, dynamic> data) => PasswordStruct(
        password: castToType<int>(data['password']),
      );

  static PasswordStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PasswordStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'password': _password,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'password': serializeParam(
          _password,
          ParamType.int,
        ),
      }.withoutNulls;

  static PasswordStruct fromSerializableMap(Map<String, dynamic> data) =>
      PasswordStruct(
        password: deserializeParam(
          data['password'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PasswordStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PasswordStruct && password == other.password;
  }

  @override
  int get hashCode => const ListEquality().hash([password]);
}

PasswordStruct createPasswordStruct({
  int? password,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PasswordStruct(
      password: password,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PasswordStruct? updatePasswordStruct(
  PasswordStruct? passwordStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    passwordStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPasswordStructData(
  Map<String, dynamic> firestoreData,
  PasswordStruct? passwordStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (passwordStruct == null) {
    return;
  }
  if (passwordStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && passwordStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final passwordStructData =
      getPasswordFirestoreData(passwordStruct, forFieldValue);
  final nestedData =
      passwordStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = passwordStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPasswordFirestoreData(
  PasswordStruct? passwordStruct, [
  bool forFieldValue = false,
]) {
  if (passwordStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(passwordStruct.toMap());

  // Add any Firestore field values
  passwordStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPasswordListFirestoreData(
  List<PasswordStruct>? passwordStructs,
) =>
    passwordStructs?.map((e) => getPasswordFirestoreData(e, true)).toList() ??
    [];
