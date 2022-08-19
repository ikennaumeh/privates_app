class Post {
  String? id;
  final String name;
  final String caption;
  String? postLink;
  final int? timestamp;
  final DateTime? time;

  Post({this.id = '', required this.name, required this.caption,  this.time, this.postLink, required this.timestamp});

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "profession": caption, "time": DateTime.now(), "postLink": postLink, "timestamp": timestamp};

  static Post fromJson(Map<String, dynamic> json) => Post(
    id: json['id'],
    name: json['name'],
    caption: json['profession'],
    postLink: json['postLink'],
    timestamp: json["timestamp"],


  );
}