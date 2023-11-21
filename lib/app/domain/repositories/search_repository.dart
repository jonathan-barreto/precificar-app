import 'package:precificar_app/app/data/models/user_search_model.dart';

abstract class SearchRepository {
  Future<List<SearchUserModel>> fetchUsers({required int idUser});

  Future<SearchUserModel> followUser({
    required int idUser,
    required int followId,
  });

  Future<SearchUserModel> unfollowUser({
    required int idUser,
    required int unfollowId,
  });
}
