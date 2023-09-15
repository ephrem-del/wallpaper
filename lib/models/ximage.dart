import 'package:cloud_firestore/cloud_firestore.dart';

class XImage {
  String name;
  String rating;
  String url;
  String category;

  XImage(
      {required this.name,
      required this.rating,
      required this.url,
      required this.category});

  factory XImage.fromSnapshot(QueryDocumentSnapshot snapshot) {
    return XImage(
        name: snapshot['name'],
        rating: snapshot['rating'],
        url: snapshot['url'],
        category: snapshot['category']);
  }

  Map<String, dynamic> toSnapshot() {
    return {'name': name, 'rating': rating, 'url': url, 'category': category};
  }
}
