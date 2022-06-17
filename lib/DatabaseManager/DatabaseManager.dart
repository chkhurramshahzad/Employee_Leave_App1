import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference leaves =
      FirebaseFirestore.instance.collection('leaves');
      

  Future<void> createUserData(
      String userName, String startDate, String endDate,String reason,String uid) async {
    return await leaves.doc(uid).set({'userName': userName, 'startDate': startDate, 'endDate': endDate,'reason':reason});
  }

  Future updateUserList(String userName, String startDate, String endDate,String reason,String uid) async {
    return await leaves.doc(uid).update({
     'userName': userName, 'startDate': startDate, 'endDate': endDate,'reason':reason
    });
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await leaves.get().then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          itemsList.add(element.data);
        }
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
