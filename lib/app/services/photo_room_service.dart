import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PhotoRoomService {
  final Supabase _supabase;
  PhotoRoomService(this._supabase);

// create a new photo room
  Future<void> createPhotoRoom(String roomId, List<String>? images) async {
    try {
      var result = await _supabase.client.from('photo_rooms').upsert({
        "images": images,
        'room_Id': roomId,
      });

      if (result.error != null) {
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
      var response = await _supabase.client.from('photo_rooms').update({
        'images': images,
      }).eq('room_id', roomId);

      if (response.error != null) {
        throw ('error');
      }
    } catch (e) {
      debugPrint('$e');
      throw ('there was an erro');
    }
  }

  // delete a photoroom
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
}
