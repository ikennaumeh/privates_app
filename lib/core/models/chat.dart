class Chat{
  final String? name, image, status;
  final bool active;
  final DateTime? lastSeen;

  const Chat({this.name, this.image, this.status, this.active = false,this.lastSeen ,});
}