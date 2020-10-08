import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class FirestoreService {
  FirestoreService._();

  static final instance = FirestoreService._();

  Stream<List<T>> collectionStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data),
    Query queryBuilder(Query query),
    int sort(T lhs, T rhs),
  }) {
    Query query = Firestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final Stream<QuerySnapshot> snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.documents
          .map((snapshot) => builder(snapshot.data))
          .where((element) => element != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<List<T>> docStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data),
    @required String docUID,
    Query queryBuilder(Query query),
    int sort(T lhs, T rhs),
  }) {
    Query query = Firestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final Stream<QuerySnapshot> snapshots =
        query.where('uid', isEqualTo: docUID).snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.documents
          .map((snapshot) => builder(snapshot.data))
          .where((element) => element != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<List<T>> filteredStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data),
    @required List<String> searchedUIDs,
    //@required String docUID,
    Query queryBuilder(Query query),
    int sort(T lhs, T rhs),
  }) {
    Query query = Firestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    var tempUID = ['1001', '1005', 'looop', 'what'];

    final Stream<QuerySnapshot> snapshots =
        // query.where('uid', whereIn: tempUID).snapshots();
        query.where('zearch', arrayContainsAny: tempUID).snapshots();

    //query.where('uid', isEqualTo: docUID).snapshots();

    return snapshots.map((snapshot) {
      final result = snapshot.documents
          .map((snapshot) => builder(snapshot.data))
          .where((element) => element != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }


  Future<String> lastUID({@required String path}) {
    return Firestore.instance
        .collection(path)
        .getDocuments()
        .then((value) => value.documents.last.documentID);
  }

  Future<void> setOdour({
    @required String path,
    @required Map<String, dynamic> data,
  }) async {
    final reference = Firestore.instance.document(path);
    print('$path: $data');
    await reference.setData(data);
  }

  Future<void> deleteOdour(
      {@required String path, @required String uid}) async {
    final reference = Firestore.instance.document(path).collection(uid);
    print('delete: $uid');
    await reference.document().delete();
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut().then((value) => null);
  }
}