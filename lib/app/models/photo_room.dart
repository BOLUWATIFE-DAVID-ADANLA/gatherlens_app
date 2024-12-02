class PhotoRoom {
  final List<String>? images;
  final DateTime createdAt;
  final int maxPhotos; // Maximum photo count limit
  final String roomId;
  final String roomname;
  PhotoRoom(
      {required this.images,
      required this.roomname,
      required this.createdAt,
      this.maxPhotos = 200,
      required this.roomId});

  // JSON serialization
  factory PhotoRoom.fromJson(Map<String, dynamic> json) {
    return PhotoRoom(
      roomname: json['roomname'],
      images: List<String>.from(json['images']),
      createdAt: DateTime.parse(json['createdAt']),
      maxPhotos: json['maxPhotos'],
      roomId: json['roomId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'images': images,
      'createdAt': createdAt.toIso8601String(),
      'maxPhotos': maxPhotos,
      'roomId': roomId,
      'roomname': roomname,
    };
  }
}
