class Message{
  final String? author;
  final String? authorId;
  final String? photoUrl;
  final int? timestamp;
  final String? value;

  Message({
    this.author,
    this.authorId,
    this.photoUrl,
    this.timestamp,
    this.value,
  });

  static Message fromJson(Map<String, dynamic> json) => Message(
      author: json['author'],
      authorId: json['author_id'],
      photoUrl: json['photo_url'],
      timestamp: json['timestamp'],
      value: json['value']
  );

  Map<String, dynamic> toJson ()=> {
    "author": author,
    "author_id": authorId,
    "photo_url": photoUrl,
    "timestamp": timestamp,
    "value": value,
  };

}