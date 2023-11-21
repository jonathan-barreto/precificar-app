import 'package:precificar_app/app/data/models/user_search_model.dart';
import 'package:precificar_app/app/domain/repositories/search_repository.dart';

class SearchUsersUseCase {
  final SearchRepository searchRepository;

  SearchUsersUseCase({
    required this.searchRepository,
  });

  Future<List<SearchUserModel>> execute({
    required int id,
  }) async {
    final response = await searchRepository.fetchUsers(
      idUser: id,
    );

    return response;
  }
}
