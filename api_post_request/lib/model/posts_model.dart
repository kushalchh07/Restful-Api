import 'dart:convert';

class Postsmodel {
  final int userId;
  final int id;
  final String title;
  final String body;

  Postsmodel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // Factory constructor for creating a new `Postsmodel` instance from a map
  factory Postsmodel.fromJson(Map<String, dynamic> json) {
    return Postsmodel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  // Method for converting `Postsmodel` instance to a map
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}

// void main() {
//   // Example JSON string
//   const jsonString = '''
//   {
//     "userId": 1,
//     "id": 1,
//     "title": "Sample Title",
//     "body": "This is a sample body text."
//   }
//   ''';

//   // Deserialization: JSON string to Postsmodel instance
//   final Map<String, dynamic> jsonMap = json.decode(jsonString);
//   final post = Postsmodel.fromJson(jsonMap);

//   print('Deserialized:');
//   print('UserId: ${post.userId}');
//   print('Id: ${post.id}');
//   print('Title: ${post.title}');
//   print('Body: ${post.body}');

//   // Serialization: Postsmodel instance to JSON string
//   final jsonStringOutput = json.encode(post.toJson());

//   print('Serialized:');
//   print(jsonStringOutput);
// }
