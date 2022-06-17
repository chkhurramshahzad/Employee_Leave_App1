import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String endDate;
  final String reason;
  final String startDate;
  final String userID;
  final String username;

  const User(
      {required this.endDate,
      required this.reason,
      required this.startDate,
      required this.userID,
      required this.username,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      endDate: snapshot["endDate"],
      reason: snapshot["reason"],
      startDate: snapshot["startDate"],
      userID: snapshot["userID"],
      username: snapshot["username"],
    );
  }

  Map<String, dynamic> toJson() => {
        "endDate": endDate,
        "reason": reason,
        "startDate": startDate,
        "userID": userID,
        "username": username,
      };
}
