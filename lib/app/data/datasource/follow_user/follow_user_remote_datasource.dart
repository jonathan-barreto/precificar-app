import 'package:precificar_app/app/data/models/user_search_model.dart';

abstract class FollowUserDataSource {
  Future<SearchUserModel> followUser({required int id, required int followId});
}
