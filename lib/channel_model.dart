class Channel {
  final String id;
  final String name;
  final String owner;


  Channel({this.owner, this.id, this.name});

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(

      id: json['_id'],
      name: json['name'],
      owner: json['owner'],
    );
  }
}