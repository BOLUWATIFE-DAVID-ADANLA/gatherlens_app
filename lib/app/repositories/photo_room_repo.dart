import 'package:flutter/material.dart';
import 'package:gatherlens/app/models/photo_room.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PhotoRoomRepository {
  final Supabase _supabase;
  PhotoRoomRepository(this._supabase);

// create a new photo room
  Future<void> createPhotoRoom(String roomId, List<String>? images) async {
    try {
      var result = await _supabase.client.from('photo_rooms').upsert({
        "images": images,
        'room_Id': roomId,
      }).select();

      if (result.isEmpty) {
        throw Exception('falied to create photo room');
      }
      debugPrint('Photo room created successfully!');
    } catch (e) {
      throw ('$e');
    }
  }

// add  image to the photo room
  Future<void> addImagesToPhotoRoom(List<String> images, String roomId) async {
    try {
      var response = await _supabase.client
          .from('photo_rooms')
          .update({
            'images': images,
          })
          .eq('room_id', roomId)
          .select();

      if (response.isEmpty) {
        throw ('error');
      }
    } catch (e) {
      debugPrint('$e');
      throw ('there was an erro');
    }
  }

  // delete a photoroom this option is only available to the person who created the room
  Future<void> deletePhotoRoom(String roomId) async {
    try {
      var reponse = await _supabase.client
          .from('photo_rooms')
          .delete()
          .eq('photo_rooms', roomId);
      if (reponse.error != null) {
        throw Exception('failed to delete photoroom');
      }
    } catch (e) {
      debugPrint('$e');
      throw Exception('there was an issue during this operation');
    }
  }

//allows user to join photot room
  Future<void> joinPhotoRoom(
      String roomId, String userId, String roomname) async {
    try {
      final response = await _supabase.client.from('participants').upsert({
        'user_id': userId,
        'room_id': roomId,
        'joined_at': DateTime.now()
            .toIso8601String(), // Store the timestamp when user joined
        'role': 'user', // Default role is user
        'room_name': roomname,
      }).select();

      if (response.isEmpty) {
        throw Exception('Failed to join photo room');
      }

      debugPrint('User joined photo room successfully!');
    } catch (e) {
      debugPrint('Error joining photo room: $e');
    }
  }

//  this gets all the photorooms a user is a part of
  Future<List<PhotoRoom>> getPhotoRoomsForUser(String userId) async {
    try {
      final response = await _supabase.client
          .from('participants')
          .select('room_id')
          .eq('user_id', userId);

      if (response.isEmpty) {
        throw Exception('Failed to fetch photo rooms');
      }

      List<String> roomid =
          List<String>.from(response.map((room) => room['room_id']));

      final roomResponse = await _supabase.client
          .from('photo_rooms')
          .select()
          .inFilter('room_id', roomid);

      if (roomResponse.isEmpty) {
        throw Exception('Failed to fetch photo room details');
      }

      List<PhotoRoom> rooms = roomResponse
          .map<PhotoRoom>((roomData) => PhotoRoom.fromJson(roomData))
          .toList();

      return rooms;
    } catch (e) {
      debugPrint('Error fetching photo rooms for user: $e');
      return [];
    }
  }

  //get all images in a particular photo room
  Future<List<String>?> getAllPhotosInARoom(String roomId) async {
    try {
      final response = await _supabase.client
          .from('photo_rooms')
          .select('room_id')
          .eq('room_id', roomId)
          .single();
      if (response.isEmpty) {
        throw Exception('no images found in this room');
      }

      List<String> images = List<String>.from(response['photos']);
      return images;
    } catch (e) {
      debugPrint('error here');
      return [];
    }
  }
}
