import 'package:flutter/material.dart';
import 'package:gatherlens/app/models/photo_room.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PhotoRoomRepository {
  final Supabase _supabase;
  PhotoRoomRepository(this._supabase);

// create a new photo room and mark it with the id of the user that created it
  Future<void> createPhotoRoom(String roomId, String userId) async {
    try {
      var result = await _supabase.client.from('photo_rooms').upsert({
        'room_id': roomId,
        'created_by': userId,
      }).select();

      if (result.isEmpty) {
        throw Exception('falied to create photo room');
      }
      debugPrint('Photo room created successfully!');
    } catch (e) {
      throw ('$e');
    }
  }

// add  image to the photo room and marks it with the id of the user that uploaded it
  Future<void> addImagesToPhotoRoom(
      String imageUrl, String roomId, String userId) async {
    try {
      var response = await _supabase.client.from('images').insert({
        'room_id': roomId, // Associate the image with the room
        'url': imageUrl, // Image URL
        'uploaded_by': userId, // User who uploaded the image
      }).select();

      if (response.isEmpty) {
        throw ('error');
      }
    } catch (e) {
      debugPrint('$e');
      throw ('there was an erro');
    }
  }

  // delete a photoroom this option is only available to the person who created the room
  Future<void> deletePhotoRoom(String roomId, String currentUserId) async {
    try {
      var response = await _supabase.client
          .from('photo_rooms')
          .select('created_by') // Only fetch the created_by column
          .eq('room_id', roomId)
          .single(); // Ensure only one room is fetched

      if (response.isEmpty) {
        throw Exception('Failed to fetch room data');
      }

      //Check if the current user is the creator
      String createdBy = response['created_by'];
      if (createdBy != currentUserId) {
        throw Exception('You are not authorized to delete this room');
      }

      var deleteResponse = await _supabase.client
          .from('photo_rooms')
          .delete()
          .eq('room_id', roomId)
          .select();

      if (deleteResponse.isEmpty) {
        throw Exception('Failed to delete photo room');
      }

      debugPrint('Photo room deleted successfully');
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
      // Fetch images for the given room from the 'images' table
      final response = await _supabase.client
          .from('images')
          .select('url') // We only need the URL of the images
          .eq('room_id',
              roomId); // Ensure we only get images related to the given roomId

      if (response.isEmpty) {
        throw Exception('No images found in this room');
      }

      // Step 2: Map the response to a List of image URLs
      List<String> images =
          List<String>.from(response.map((image) => image['url']));

      return images;
    } catch (e) {
      debugPrint('error here');
      return [];
    }
  }
}
