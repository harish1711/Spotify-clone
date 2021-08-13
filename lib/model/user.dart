import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Emp {
  final String uid;
  final String name;
  final String bio;
  Emp({
    this.name,
    this.bio,
    this.uid,
  });
  factory Emp.fromDocument(DocumentSnapshot doc) {
    return Emp(
      uid: doc.id,
      name: doc.data()['name'],
      bio: doc.data()['bio'],
    );
  }
}
