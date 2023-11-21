import 'package:precificar_app/app/data/models/user_search_model.dart';

class SearchState {
  final List<SearchUserModel> users;

  SearchState({
    required this.users,
  });

  factory SearchState.initial() {
    return SearchState(
      users: [],
    );
  }

  factory SearchState.fetchUsers({required List<SearchUserModel> users}) {
    return SearchState(
      users: users,
    );
  }

  SearchState copyWith({List<SearchUserModel>? users}) {
    return SearchState(
      users: users ?? this.users,
    );
  }
}

