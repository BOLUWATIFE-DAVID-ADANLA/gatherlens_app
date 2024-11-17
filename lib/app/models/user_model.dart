import 'package:gatherlens/app/models/photo_room.dart';

class UserModel {
  final String email;
  final List<PhotoRoom> photoRooms;
  final String username;
  final String uId;

  UserModel(
      {required this.email,
      required this.photoRooms,
      required this.username,
      required this.uId});

  // JSON serialization for easy database integration
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      photoRooms: (json['photoRooms'] as List<dynamic>)
          .map((room) => PhotoRoom.fromJson(room as Map<String, dynamic>))
          .toList(),
      username: json['username'],
      uId: json['uId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'photoRooms': photoRooms.map((room) => room.toJson()).toList(),
      'username': username,
      "uId": uId,
    };
  }
}
