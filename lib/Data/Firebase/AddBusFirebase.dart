import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sbsr_admin_panel/Data/Model/Bus.dart';
BusDatabase injectFirebaseBusDatabase() {
  return BusDatabase.getInstance();
}

class BusDatabase {
  BusDatabase._();

  static BusDatabase? _instance;

  static getInstance() {
    _instance ??= BusDatabase._();
    return _instance;
  }

  CollectionReference<Bus> getCollectionReference() {
    return FirebaseFirestore.instance.collection("Bus").withConverter(
          fromFirestore: (snapshot, options) =>
              Bus.fromFireStore(snapshot.data()!),
          toFirestore: (value, options) => value.toFireStore(),
        );
  }

  Future<void> addBus(Bus bus, String uid) async {
    await getCollectionReference().doc(uid).set(bus);
  }
}
