import 'package:precificar_app/app/data/models/user_model.dart';

class HomeState {
  final List<User> users;

  HomeState({
    required this.users,
  });

  factory HomeState.initial() {
    return HomeState(
      users: <User>[],
    );
  }

  factory HomeState.fetchUsers({required List<User> users}) {
    return HomeState(
      users: users,
    );
  }

  HomeState copyWith({int? index, List<User>? users}) {
    return HomeState(
      users: users ?? this.users,
    );
  }
}
