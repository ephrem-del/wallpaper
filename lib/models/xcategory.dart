import 'package:cloud_firestore/cloud_firestore.dart';

class XCategory {
  String title;
  String url;

  XCategory(
      {required this.title,
      required this.url,});

  factory XCategory.fromSnapshot(QueryDocumentSnapshot snapshot) {
    return XCategory(
        title: snapshot['title'],
        url: snapshot['url']);
  }

  Map<String, dynamic> toSnapshot() {
    return {'title': title, 'url': url,};
  }
}
