import 'package:precificar_app/app/data/models/user_search_model.dart';

abstract class SeachUserDataSouce {
  Future<List<SearchUserModel>> searchUsers({required int id});
}