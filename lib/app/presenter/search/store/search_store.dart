import 'package:flutter/material.dart';
import 'package:precificar_app/app/core/state/raw_state.dart';
import 'package:precificar_app/app/data/models/user_search_model.dart';
import 'package:precificar_app/app/domain/usecases/follow_user_use_case.dart';
import 'package:precificar_app/app/domain/usecases/search_users_use_case.dart';
import 'package:precificar_app/app/domain/usecases/unfollow_user_use_case.dart';
import 'package:precificar_app/app/presenter/search/state/search_state.dart';

class SearchStore extends ValueNotifier<RawState> {
  final SearchUsersUseCase searchUsersUseCase;
  final FollowUserUseCase followUserUseCase;
  final UnfollowUserUseCase unfollowUserUseCase;

  SearchStore({
    required this.searchUsersUseCase,
    required this.followUserUseCase,
    required this.unfollowUserUseCase,
  }) : super(const IdleState());

  Future<void> fetchUser({required int idUser}) async {
    value = const LoadingState();

    final List<SearchUserModel> usersModel = await searchUsersUseCase.execute(
      id: idUser,
    );

    value = SuccessState<SearchState>(
      output: SearchState.fetchUsers(
        users: usersModel,
      ),
    );
  }

  Future<void> followUser({
    required int idUser,
    required int followId,
    required int index,
  }) async {
    final state = value as SuccessState<SearchState>;

    if (value is SuccessState<SearchState>) {
      final searchUser = await followUserUseCase.execute(
        id: idUser,
        followId: followId,
      );

      final List<SearchUserModel> users = state.output.users;

      users[index] = searchUser;

      value = SuccessState(
        output: state.output.copyWith(
          users: users,
        ),
      );
    }
  }

  Future<void> unfollowUser({
    required int idUser,
    required int unfollowId,
    required int index,
  }) async {
    final state = value as SuccessState<SearchState>;

    if (value is SuccessState<SearchState>) {
      final searchUser = await unfollowUserUseCase.execute(
        id: idUser,
        unfollowId: unfollowId,
      );

      final List<SearchUserModel> users = state.output.users;

      users[index] = searchUser;

      value = SuccessState(
        output: state.output.copyWith(
          users: users,
        ),
      );
    }
  }
}
