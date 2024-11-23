import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository {
  final Supabase _supabase;
  UserRepository(this._supabase);

  // add user to db table
  Future<void> addUser(String email, String userid, String username,
      ) async {
    try {
      var response = await _supabase.client.from('user').upsert({
        'email': email,
        'username': username,
        'user_id': userid,
        'created_at': DateTime.now().toIso8601String(),
      }).select();

      if (response.isEmpty) {
        throw Exception('user not created ');
      }

      debugPrint('user has been sucessfully added to db');
    } catch (e) {
      debugPrint('there was an unexpected error');
    }
  }

  // remove user from db table
  Future<void> removeUser(String userId) async {
    try {
      var response = await _supabase.client
          .from('user')
          .delete()
          .eq('user_id', userId)
          .select();

      if (response.isEmpty) {
        throw Exception('user record not deleted');
      }

      debugPrint('user has been sucessfully deleted from db ');
    } catch (e) {
      debugPrint('there was an unexpected error');
    }
  }
}
