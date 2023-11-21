import 'dart:typed_data';

import 'package:precificar_app/app/data/datasource/followed_users/followed_users_remote_datasource.dart';
import 'package:precificar_app/app/data/datasource/upload_story/upload_story_remote_datasouce.dart';
import 'package:precificar_app/app/data/models/user_model.dart';
import 'package:precificar_app/app/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final FollowedUserDataSource followed;
  final UploadStoryDataSouce uploadStoryData;

  HomeRepositoryImpl({
    required this.followed,
    required this.uploadStoryData,
  });

  @override
  Future<UserModel> getFollowedUsers({required int userId}) async {
    final response = await followed.getFollowingUser(
      id: userId,
    );

    return response;
  }

  @override
  Future<void> uploadStory(int id, Uint8List image, String? caption) async {
    await uploadStoryData.postUploadStory(
      id: id,
      image: image,
      caption: caption,
    );
  }
}
