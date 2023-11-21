import 'package:precificar_app/app/data/models/user_search_model.dart';
import 'package:precificar_app/app/domain/repositories/search_repository.dart';

class FollowUserUseCase {
  final SearchRepository searchRepository;

  FollowUserUseCase({
    required this.searchRepository,
  });

  Future<SearchUserModel> execute({
    required int id,
    required int followId,
  }) async {
    final response = await searchRepository.followUser(
      idUser: id,
      followId: followId,
    );

    return response;
  }
}
