import 'package:precificar_app/app/data/datasource/follow_user/follow_user_remote_datasource.dart';
import 'package:precificar_app/app/data/datasource/search_users/search_user_remote_datasource.dart';
import 'package:precificar_app/app/data/datasource/unfollow_user/unfollow_user_remote_datasource.dart';
import 'package:precificar_app/app/data/models/user_search_model.dart';
import 'package:precificar_app/app/domain/repositories/search_repository.dart';

class SearchRespositoryImpl implements SearchRepository {
  final SeachUserDataSouce seachUserData;
  final FollowUserDataSource followUserData;
  final UnfollowUserDataSource unfollowUserData;

  SearchRespositoryImpl({
    required this.seachUserData,
    required this.followUserData,
    required this.unfollowUserData,
  });

  @override
  Future<List<SearchUserModel>> fetchUsers({required int idUser}) async {
    final response = await seachUserData.searchUsers(
      id: idUser,
    );

    return response;
  }

  @override
  Future<SearchUserModel> followUser({
    required int idUser,
    required int followId,
  }) async {
    final response = await followUserData.followUser(
      id: idUser,
      followId: followId,
    );

    return response;
  }

  @override
  Future<SearchUserModel> unfollowUser({
    required int idUser,
    required int unfollowId,
  }) async {
    final response = await unfollowUserData.unfollowUser(
      id: idUser,
      unfollowId: unfollowId,
    );

    return response;
  }
}
