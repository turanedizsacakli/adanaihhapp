import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class NewsRecord extends FirestoreRecord {
  NewsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "newsTitle" field.
  String? _newsTitle;
  String get newsTitle => _newsTitle ?? '';
  bool hasNewsTitle() => _newsTitle != null;

  // "newsDetails" field.
  String? _newsDetails;
  String get newsDetails => _newsDetails ?? '';
  bool hasNewsDetails() => _newsDetails != null;

  // "newsCategories" field.
  String? _newsCategories;
  String get newsCategories => _newsCategories ?? '';
  bool hasNewsCategories() => _newsCategories != null;

  // "newsPhotos" field.
  String? _newsPhotos;
  String get newsPhotos => _newsPhotos ?? '';
  bool hasNewsPhotos() => _newsPhotos != null;

  void _initializeFields() {
    _newsTitle = snapshotData['newsTitle'] as String?;
    _newsDetails = snapshotData['newsDetails'] as String?;
    _newsCategories = snapshotData['newsCategories'] as String?;
    _newsPhotos = snapshotData['newsPhotos'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('news');

  static Stream<NewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewsRecord.fromSnapshot(s));

  static Future<NewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewsRecord.fromSnapshot(s));

  static NewsRecord fromSnapshot(DocumentSnapshot snapshot) => NewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewsRecordData({
  String? newsTitle,
  String? newsDetails,
  String? newsCategories,
  String? newsPhotos,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'newsTitle': newsTitle,
      'newsDetails': newsDetails,
      'newsCategories': newsCategories,
      'newsPhotos': newsPhotos,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewsRecordDocumentEquality implements Equality<NewsRecord> {
  const NewsRecordDocumentEquality();

  @override
  bool equals(NewsRecord? e1, NewsRecord? e2) {
    return e1?.newsTitle == e2?.newsTitle &&
        e1?.newsDetails == e2?.newsDetails &&
        e1?.newsCategories == e2?.newsCategories &&
        e1?.newsPhotos == e2?.newsPhotos;
  }

  @override
  int hash(NewsRecord? e) => const ListEquality()
      .hash([e?.newsTitle, e?.newsDetails, e?.newsCategories, e?.newsPhotos]);

  @override
  bool isValidKey(Object? o) => o is NewsRecord;
}
