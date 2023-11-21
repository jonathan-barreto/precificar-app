import 'dart:typed_data';

import 'package:precificar_app/app/data/models/user_model.dart';

abstract class HomeRepository {
  Future<UserModel> getFollowedUsers({required int userId});
  Future<void> uploadStory(int id, Uint8List image, String? caption);
}