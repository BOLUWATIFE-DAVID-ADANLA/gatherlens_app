import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gatherlens/app/repositories/photo_room_repo.dart';
import 'package:gatherlens/app/repositories/supabase_strorage_repo.dart';

class PhotoRoomController {
  final SupabaseStrorageRepo _strorageRepo;
  final PhotoRoomRepository _photoRoomRepository;
  final Ref ref;

  PhotoRoomController(this._photoRoomRepository, this._strorageRepo, this.ref);
  // create a photo room and stroage bucket
  Future<void> createPhotoRoomBAndBucket(String roomId, String userId) async {
    try {
      await _photoRoomRepository.createPhotoRoom(roomId, userId);
      await _strorageRepo.createBucketForParticularRoomId(roomId);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('an error occured ');
    }
  }

  // delete photoroom and bucket
  Future<void> deletePhotoRoom(String roomId, String currentUserId) async {
    try {
      await _photoRoomRepository.deletePhotoRoom(roomId, currentUserId);
      await _strorageRepo.deleteBucketForParticularRoomId(roomId);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('an error occured ');
    }
  }

  // upload imgae to bucket and add image url to images table
  Future<void> addImagestoRoom(
      String roomId, String filePath, String userId) async {
    try {
      final url = await _strorageRepo.uploadImageToRoomBucket(roomId, filePath);
      await _photoRoomRepository.addImagesToPhotoRoom(url, roomId, userId);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('an error occured ');
    }
  }

  // join photo room  by participant
  Future<void> joinRoom(String roomId, String userId, String roomName) async {
    try {
      await _photoRoomRepository.joinPhotoRoom(roomId, userId, roomName);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('an error occured ');
    }
  }

  Future<void> fetchPhotoforaroom(String roomId) async {
    try {
      await _photoRoomRepository.getAllPhotosInARoom(roomId);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('an error occured ');
    }
  }
}
