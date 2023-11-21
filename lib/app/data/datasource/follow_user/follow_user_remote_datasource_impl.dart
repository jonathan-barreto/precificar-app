import 'package:precificar_app/app/core/utils/constants/app_constants.dart';
import 'package:precificar_app/app/data/datasource/clients/http_client.dart';
import 'package:precificar_app/app/data/datasource/follow_user/follow_user_remote_datasource.dart';
import 'package:precificar_app/app/data/models/user_search_model.dart';

class FollowUserDataSourceImpl implements FollowUserDataSource {
  final HttpClient http;

  FollowUserDataSourceImpl({
    required this.http,
  });

  @override
  Future<SearchUserModel> followUser({
    required int id,
    required int followId,
  }) async {
    final Map<String, int> json = {
      "follower_id": id,
      "followed_id": followId,
    };

    final response = await http.post(
      endpoint: AppConstants.followUser,
      data: json,
    );

    final user = SearchUserModel.fromJson(
      response.data,
    );

    return user;
  }
}
