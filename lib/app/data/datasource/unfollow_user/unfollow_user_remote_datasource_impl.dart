import 'package:precificar_app/app/core/utils/constants/app_constants.dart';
import 'package:precificar_app/app/data/datasource/clients/http_client.dart';
import 'package:precificar_app/app/data/datasource/unfollow_user/unfollow_user_remote_datasource.dart';
import 'package:precificar_app/app/data/models/user_search_model.dart';

class UnfollowUserDataSourceImpl implements UnfollowUserDataSource {
  final HttpClient http;

  UnfollowUserDataSourceImpl({
    required this.http,
  });

  @override
  Future<SearchUserModel> unfollowUser({
    required int id,
    required int unfollowId,
  }) async {
    final Map<String, int> json = {
      "follower_id": id,
      "followed_id": unfollowId,
    };

    final response = await http.post(
      endpoint: AppConstants.unfollowUser,
      data: json,
    );

    final user = SearchUserModel.fromJson(
      response.data,
    ); 

    return user;
  }
}
