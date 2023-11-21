import 'package:precificar_app/app/data/models/user_search_model.dart';
import 'package:precificar_app/app/domain/repositories/search_repository.dart';

class UnfollowUserUseCase {
  final SearchRepository searchRepository;

  UnfollowUserUseCase({
    required this.searchRepository,
  });

  Future<SearchUserModel> execute({
    required int id,
    required int unfollowId,
  }) async {
    final response = await searchRepository.unfollowUser(
      idUser: id,
      unfollowId: unfollowId,
    );

    return response;
  }
}
