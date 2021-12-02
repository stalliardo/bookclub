import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  String? id;
  String? name;
  int? length;
  Timestamp? completedDate;

  Book({
    required this.id,
    required this.name,
    required this.length,
    this.completedDate,
  });
}
