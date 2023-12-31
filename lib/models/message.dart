import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String message;
  String email;
  Timestamp date;
  Message({required this.message, required this.email, required this.date});
  factory Message.fromJson(jsonData) => Message(
        message: jsonData[kMessage],
        email: jsonData[kId],
        date: jsonData[createdAt],
      );
}
