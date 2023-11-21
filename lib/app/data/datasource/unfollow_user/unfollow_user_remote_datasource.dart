import 'package:precificar_app/app/data/models/user_search_model.dart';

abstract class UnfollowUserDataSource {
  Future<SearchUserModel> unfollowUser({
    required int id,
    required int unfollowId,
  });
}
