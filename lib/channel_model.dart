class Channel {
  final String id;
  final String name;


  Channel({this.id, this.name});

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['id'],
      name: json['name'],
    );
  }
}