import 'package:precificar_app/app/core/utils/constants/app_constants.dart';
import 'package:precificar_app/app/data/datasource/clients/http_client.dart';
import 'package:precificar_app/app/data/datasource/followed_users/followed_users_remote_datasource.dart';
import 'package:precificar_app/app/data/models/user_model.dart';

class FollowedUserDataSourceImpl implements FollowedUserDataSource {
  final HttpClient _http;

  FollowedUserDataSourceImpl({required HttpClient http}) : _http = http;

  @override
  Future<UserModel> getFollowingUser({required int id}) async {
    final response = await _http.get(
      endpoint: '${AppConstants.getFollowingUsers}/$id',
    );

    final UserModel userModel = UserModel.fromJson(response.data);

    return userModel;
  }
}
