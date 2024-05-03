import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sbsr_admin_panel/Data/Model/Bus.dart';
import 'package:sbsr_admin_panel/Data/Model/Station.dart';

StationDatabse injectFirebaseBusDatabase() {
  return StationDatabse.getInstance();
}

class StationDatabse {
  StationDatabse._();

  static StationDatabse? _instance;

  static getInstance() {
    _instance ??= StationDatabse._();
    return _instance;
  }

  CollectionReference<Station> getCollectionReference() {
    return FirebaseFirestore.instance.collection("Station").withConverter(
      fromFirestore: (snapshot, options) =>
          Station.fromFireStore(snapshot.data()!),
      toFirestore: (value, options) => value.toFireStore(),
    );
  }

  Future<void> addStation(Station station, String uid) async {
    await getCollectionReference().add(station);
  }
  Future<void> deleteStation(String fieldValue) async {
    final snapshot = await getCollectionReference().get();
    final docs = snapshot.docs;

    for (var doc in docs) {
      if (doc.data().uid == fieldValue) {
        await doc.reference.delete();
      }
    }
  }
}
