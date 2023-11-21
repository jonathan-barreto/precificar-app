import 'package:precificar_app/app/core/utils/constants/app_constants.dart';
import 'package:precificar_app/app/data/datasource/clients/http_client.dart';
import 'package:precificar_app/app/data/datasource/search_users/search_user_remote_datasource.dart';
import 'package:precificar_app/app/data/models/user_search_model.dart';

class SeachUserDataSouceImpl implements SeachUserDataSouce {
  final HttpClient http;

  SeachUserDataSouceImpl({
    required this.http,
  });

  @override
  Future<List<SearchUserModel>> searchUsers({required int id}) async {
    final response = await http.get(
      endpoint: '${AppConstants.getUserList}/$id',
    );

    final List json = response.data as List;

    final List<SearchUserModel> users = [];

    users.addAll(
      json.map(
        (e) => SearchUserModel.fromJson(e),
      ),
    );

    return users;
  }
}
