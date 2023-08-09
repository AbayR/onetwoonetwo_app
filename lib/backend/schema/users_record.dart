import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "club" field.
  String? _club;
  String get club => _club ?? '';
  bool hasClub() => _club != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  bool hasPoints() => _points != null;

  // "awards" field.
  List<DocumentReference>? _awards;
  List<DocumentReference> get awards => _awards ?? const [];
  bool hasAwards() => _awards != null;

  // "biometrics" field.
  bool? _biometrics;
  bool get biometrics => _biometrics ?? false;
  bool hasBiometrics() => _biometrics != null;

  // "push_messages" field.
  bool? _pushMessages;
  bool get pushMessages => _pushMessages ?? false;
  bool hasPushMessages() => _pushMessages != null;

  // "email_notif" field.
  bool? _emailNotif;
  bool get emailNotif => _emailNotif ?? false;
  bool hasEmailNotif() => _emailNotif != null;

  // "badges_notif" field.
  bool? _badgesNotif;
  bool get badgesNotif => _badgesNotif ?? false;
  bool hasBadgesNotif() => _badgesNotif != null;

  // "new_courses_notif" field.
  bool? _newCoursesNotif;
  bool get newCoursesNotif => _newCoursesNotif ?? false;
  bool hasNewCoursesNotif() => _newCoursesNotif != null;

  // "new_messages_notif" field.
  bool? _newMessagesNotif;
  bool get newMessagesNotif => _newMessagesNotif ?? false;
  bool hasNewMessagesNotif() => _newMessagesNotif != null;

  // "system_alerts_notif" field.
  bool? _systemAlertsNotif;
  bool get systemAlertsNotif => _systemAlertsNotif ?? false;
  bool hasSystemAlertsNotif() => _systemAlertsNotif != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  bool hasSurname() => _surname != null;

  // "dateOfBirth" field.
  String? _dateOfBirth;
  String get dateOfBirth => _dateOfBirth ?? '';
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "isClub" field.
  bool? _isClub;
  bool get isClub => _isClub ?? false;
  bool hasIsClub() => _isClub != null;

  // "password" field.
  int? _password;
  int get password => _password ?? 0;
  bool hasPassword() => _password != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _club = snapshotData['club'] as String?;
    _country = snapshotData['country'] as String?;
    _role = snapshotData['role'] as String?;
    _points = castToType<int>(snapshotData['points']);
    _awards = getDataList(snapshotData['awards']);
    _biometrics = snapshotData['biometrics'] as bool?;
    _pushMessages = snapshotData['push_messages'] as bool?;
    _emailNotif = snapshotData['email_notif'] as bool?;
    _badgesNotif = snapshotData['badges_notif'] as bool?;
    _newCoursesNotif = snapshotData['new_courses_notif'] as bool?;
    _newMessagesNotif = snapshotData['new_messages_notif'] as bool?;
    _systemAlertsNotif = snapshotData['system_alerts_notif'] as bool?;
    _surname = snapshotData['surname'] as String?;
    _dateOfBirth = snapshotData['dateOfBirth'] as String?;
    _isClub = snapshotData['isClub'] as bool?;
    _password = castToType<int>(snapshotData['password']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? club,
  String? country,
  String? role,
  int? points,
  bool? biometrics,
  bool? pushMessages,
  bool? emailNotif,
  bool? badgesNotif,
  bool? newCoursesNotif,
  bool? newMessagesNotif,
  bool? systemAlertsNotif,
  String? surname,
  String? dateOfBirth,
  bool? isClub,
  int? password,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'club': club,
      'country': country,
      'role': role,
      'points': points,
      'biometrics': biometrics,
      'push_messages': pushMessages,
      'email_notif': emailNotif,
      'badges_notif': badgesNotif,
      'new_courses_notif': newCoursesNotif,
      'new_messages_notif': newMessagesNotif,
      'system_alerts_notif': systemAlertsNotif,
      'surname': surname,
      'dateOfBirth': dateOfBirth,
      'isClub': isClub,
      'password': password,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.club == e2?.club &&
        e1?.country == e2?.country &&
        e1?.role == e2?.role &&
        e1?.points == e2?.points &&
        listEquality.equals(e1?.awards, e2?.awards) &&
        e1?.biometrics == e2?.biometrics &&
        e1?.pushMessages == e2?.pushMessages &&
        e1?.emailNotif == e2?.emailNotif &&
        e1?.badgesNotif == e2?.badgesNotif &&
        e1?.newCoursesNotif == e2?.newCoursesNotif &&
        e1?.newMessagesNotif == e2?.newMessagesNotif &&
        e1?.systemAlertsNotif == e2?.systemAlertsNotif &&
        e1?.surname == e2?.surname &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.isClub == e2?.isClub &&
        e1?.password == e2?.password;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.club,
        e?.country,
        e?.role,
        e?.points,
        e?.awards,
        e?.biometrics,
        e?.pushMessages,
        e?.emailNotif,
        e?.badgesNotif,
        e?.newCoursesNotif,
        e?.newMessagesNotif,
        e?.systemAlertsNotif,
        e?.surname,
        e?.dateOfBirth,
        e?.isClub,
        e?.password
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
