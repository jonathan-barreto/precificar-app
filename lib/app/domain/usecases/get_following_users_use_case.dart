import 'package:precificar_app/app/data/models/user_model.dart';
import 'package:precificar_app/app/domain/repositories/home_repository.dart';

class GetFollowinhUsersUseCase {
  final HomeRepository homeRepository;

  GetFollowinhUsersUseCase({
    required this.homeRepository,
  });

  Future<List<User>> execute({required int id}) async {
    final UserModel response = await homeRepository.getFollowedUsers(
      userId: id,
    );

    final List<User> newListUsers = [
      response.currentUser,
      ...response.users,
    ];

    return newListUsers;
  }
}
