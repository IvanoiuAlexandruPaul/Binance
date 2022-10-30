import 'package:cloud_firestore/cloud_firestore.dart';

Future<Object> getDataFronDB(String ID) async {
  // Get data from docs and convert map to List
  CollectionReference _cat =
      FirebaseFirestore.instance.collection('SebiBianceSell');

  QuerySnapshot querySnapshot = await _cat.get();
  final _docData = querySnapshot.docs.map((doc) => doc.data()).toList();
  // do any further processing as you want

  return _docData;
}
