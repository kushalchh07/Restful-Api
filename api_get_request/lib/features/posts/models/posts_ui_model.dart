import 'dart:convert';

class PostsUiDataModel {
  int userId;
  int id;
  String title;
  String body;

  PostsUiDataModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
  factory PostsUiDataModel.fromMap(Map<String, dynamic> json) =>
      PostsUiDataModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  List<PostsUiDataModel> PostsUiDataModelFromJson(String str) =>
      List<PostsUiDataModel>.from(
          json.decode(str).map((x) => PostsUiDataModel.fromMap(x)));

  String PostsUiDataModelToJson(List<PostsUiDataModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toMap())));
}
