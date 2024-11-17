import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

String generateId(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  var random = Random();
  return List.generate(length, (index) => chars[random.nextInt(chars.length)])
      .join();
}

String hashRandomId(String randomId) {
  return md5.convert(utf8.encode(randomId)).toString();
}

String generatePhotoRoomId() {
  var id = generateId(16);
  var result = hashRandomId(id);
  return result;
}

String generateUserId() {
  var id = generateId(12);
  var result = hashRandomId(id);
  return result;
}
