import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStrorageRepo {
  final Supabase _supabase;
  SupabaseStrorageRepo(this._supabase);

  // create a new bucket and give it a room_id
  Future<void> createBucketForParticularRoomId(
    String roomId,
  ) async {
    try {
      final response = await _supabase.client.storage.createBucket(roomId);
      if (response.isEmpty) {
        throw ('error creating bucket for room $roomId');
      }
    } catch (e) {
      debugPrint('error');
      throw (e.toString());
    }
  }

  // delete a  bucket and based on it room id
  Future<void> deleteBucketForParticularRoomId(
    String roomId,
  ) async {
    try {
      final response = await _supabase.client.storage.deleteBucket(roomId);
      if (response.isEmpty) {
        throw ('error creating bucket for room $roomId');
      }
    } catch (e) {
      debugPrint('error');
      throw (e.toString());
    }
  }

// upload an image to bucket for particular id
  Future<String> uploadImageToRoomBucket(String roomId, String filePath) async {
    try {
      // get file extension
      var fileExtension = extension(filePath);
      // check if file extesion is vaid image extension
      if (FileExtension.isvalidExtension(fileExtension)) {
        throw ('this is not a valid extension type');
      }
      final filename =
          '$roomId/${DateTime.now().microsecondsSinceEpoch}$fileExtension';
      final file = File(filePath);
      final response = await _supabase.client.storage.from(roomId).upload(
            filename,
            file,
          );
      if (response.isEmpty) {
        throw Exception('could not upload $filename');
      }

      final url = _supabase.client.storage.from(roomId).getPublicUrl(filename);

      if (url.isEmpty) {
        throw Exception('could not get public url');
      }

      return url;
    } catch (e) {
      throw e.toString();
    }
  }
// delete an image from bucket for particular id

  Future<void> deleteImagefromRoomBucket(String roomId, String filePath) async {
    try {
      // get file extension
      var fileExtension = extension(filePath);

      final filename =
          '$roomId/${DateTime.now().microsecondsSinceEpoch}$fileExtension';
      final response =
          await _supabase.client.storage.from(roomId).remove([filename]);
      if (response.isEmpty) {
        throw Exception('could not upload $filename');
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

enum FileExtension {
  png(extension: '.png'),
  jpg(extension: '.jpg'),
  jpeg(extension: '.jpeg'),
  raw(extension: '.raw'),
  svg(extension: '.svg');

  const FileExtension({required this.extension});
  final String extension;

  static isvalidExtension(String ext) =>
      FileExtension.values.any((e) => e.extension == ext);
}
