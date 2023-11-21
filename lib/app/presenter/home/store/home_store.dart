import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:precificar_app/app/core/state/raw_state.dart';
import 'package:precificar_app/app/data/models/user_model.dart';
import 'package:precificar_app/app/domain/usecases/get_following_users_use_case.dart';
import 'package:precificar_app/app/domain/usecases/upload_story_use_case.dart';
import 'package:precificar_app/app/presenter/home/state/home_state.dart';

class HomeStore extends ValueNotifier<RawState> {
  final GetFollowinhUsersUseCase getFollowinhUsersUseCase;
  final UploadStoryUseCase uploadStoryUseCase;

  HomeStore({
    required this.getFollowinhUsersUseCase,
    required this.uploadStoryUseCase,
  }) : super(const IdleState());

  Future<void> getFollowedUsers({required int userId}) async {
    value = const LoadingState();

    final List<User> users = await getFollowinhUsersUseCase.execute(
      id: userId,
    );

    value = SuccessState<HomeState>(
      output: HomeState.fetchUsers(
        users: users,
      ),
    );
  }

  Future<void> uploadStory(int id, MemoryImage image, String? caption) async {
    final Uint8List finalImage = image.bytes.buffer.asUint8List();

    await uploadStoryUseCase.execute(
      id: id,
      image: finalImage,
      caption: caption,
    );
  }
}
