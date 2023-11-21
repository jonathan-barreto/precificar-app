import 'package:precificar_app/app/data/models/user_model.dart';

abstract class FollowedUserDataSource {
  Future<UserModel> getFollowingUser({required int id});
}