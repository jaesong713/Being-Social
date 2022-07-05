import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String content;
  int type;
  final Timestamp createdAt;
  final String creator;

  Post(
      {required this.id,
      required this.content,
      required this.type,
      required this.createdAt,
      required this.creator});

  factory Post.fromJson(String id, Map<String, dynamic> data) {
    return Post(
        id: id,
        content: data["content"],
        type: data["type"] ?? 0,
        createdAt: data["createdAt"],
        creator: data["creator"]);
  }

  Map <String, dynamic> toJSON() {
    return {
      "content": content,
      "type": type,
      "createdAt": createdAt,
      "creator": creator
    };
  }
}
