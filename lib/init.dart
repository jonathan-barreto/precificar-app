import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:precificar_app/app/core/utils/constants/app_constants.dart';
import 'package:precificar_app/app/data/datasource/clients/http_client.dart';
import 'package:precificar_app/app/data/datasource/follow_user/follow_user_remote_datasource.dart';
import 'package:precificar_app/app/data/datasource/follow_user/follow_user_remote_datasource_impl.dart';
import 'package:precificar_app/app/data/datasource/followed_users/followed_users_remote_datasource.dart';
import 'package:precificar_app/app/data/datasource/followed_users/followed_users_remote_datasource_impl.dart';
import 'package:precificar_app/app/data/datasource/search_users/search_user_remote_datasource.dart';
import 'package:precificar_app/app/data/datasource/search_users/search_user_remote_datasource_impl.dart';
import 'package:precificar_app/app/data/datasource/storie/story_remote_datasource.dart';
import 'package:precificar_app/app/data/datasource/storie/story_remote_datasource_impl.dart';
import 'package:precificar_app/app/data/datasource/unfollow_user/unfollow_user_remote_datasource.dart';
import 'package:precificar_app/app/data/datasource/unfollow_user/unfollow_user_remote_datasource_impl.dart';
import 'package:precificar_app/app/data/datasource/upload_story/upload_story_remote_datasouce.dart';
import 'package:precificar_app/app/data/datasource/upload_story/upload_story_remote_datasouce_impl.dart';
import 'package:precificar_app/app/data/repositories/home_repository_impl.dart';
import 'package:precificar_app/app/data/repositories/search_repository_impl.dart';
import 'package:precificar_app/app/data/repositories/story_repository_impl.dart';
import 'package:precificar_app/app/domain/repositories/home_repository.dart';
import 'package:precificar_app/app/domain/repositories/search_repository.dart';
import 'package:precificar_app/app/domain/repositories/story_repository.dart';
import 'package:precificar_app/app/domain/usecases/fetch_stories_use_case.dart';
import 'package:precificar_app/app/domain/usecases/follow_user_use_case.dart';
import 'package:precificar_app/app/domain/usecases/get_following_users_use_case.dart';
import 'package:precificar_app/app/domain/usecases/search_users_use_case.dart';
import 'package:precificar_app/app/domain/usecases/unfollow_user_use_case.dart';
import 'package:precificar_app/app/domain/usecases/upload_story_use_case.dart';
import 'package:precificar_app/app/presenter/home/store/home_store.dart';
import 'package:precificar_app/app/presenter/initial/store/initial_store.dart';
import 'package:precificar_app/app/presenter/search/store/search_store.dart';
import 'package:precificar_app/app/presenter/story/stores/story_store.dart';

GetIt getIt = GetIt.instance;

void init() {
  getIt.registerFactory<Dio>(
    () => Dio(
      BaseOptions(baseUrl: AppConstants.baseUrl),
    ),
  );

  getIt.registerFactory<HttpClient>(
    () => HttpClient(
      dio: getIt<Dio>(),
    ),
  );

  getIt.registerFactory<InitialStore>(
    () => InitialStore(),
  );

  getIt.registerFactory<FollowedUserDataSource>(
    () => FollowedUserDataSourceImpl(
      http: getIt<HttpClient>(),
    ),
  );

  getIt.registerFactory<UploadStoryDataSouce>(
    () => UploadStoryDataSouceImpl(
      http: getIt<HttpClient>(),
    ),
  );

  getIt.registerFactory<HomeRepository>(
    () => HomeRepositoryImpl(
      followed: getIt<FollowedUserDataSource>(),
      uploadStoryData: getIt<UploadStoryDataSouce>(),
    ),
  );

  getIt.registerFactory<GetFollowinhUsersUseCase>(
    () => GetFollowinhUsersUseCase(
      homeRepository: getIt<HomeRepository>(),
    ),
  );

  getIt.registerFactory<UploadStoryUseCase>(
    () => UploadStoryUseCase(
      homeRepository: getIt<HomeRepository>(),
    ),
  );

  getIt.registerFactory<HomeStore>(
    () => HomeStore(
      getFollowinhUsersUseCase: getIt<GetFollowinhUsersUseCase>(),
      uploadStoryUseCase: getIt<UploadStoryUseCase>(),
    ),
  );

  getIt.registerFactory<SeachUserDataSouce>(
    () => SeachUserDataSouceImpl(
      http: getIt<HttpClient>(),
    ),
  );

  getIt.registerFactory<FollowUserDataSource>(
    () => FollowUserDataSourceImpl(
      http: getIt<HttpClient>(),
    ),
  );

  getIt.registerFactory<UnfollowUserDataSource>(
    () => UnfollowUserDataSourceImpl(
      http: getIt<HttpClient>(),
    ),
  );

  getIt.registerFactory<SearchRepository>(
    () => SearchRespositoryImpl(
      seachUserData: getIt<SeachUserDataSouce>(),
      followUserData: getIt<FollowUserDataSource>(),
      unfollowUserData: getIt<UnfollowUserDataSource>(),
    ),
  );

  getIt.registerFactory<SearchUsersUseCase>(
    () => SearchUsersUseCase(
      searchRepository: getIt<SearchRepository>(),
    ),
  );

  getIt.registerFactory<FollowUserUseCase>(
    () => FollowUserUseCase(
      searchRepository: getIt<SearchRepository>(),
    ),
  );

  getIt.registerFactory<UnfollowUserUseCase>(
    () => UnfollowUserUseCase(
      searchRepository: getIt<SearchRepository>(),
    ),
  );

  getIt.registerFactory<SearchStore>(
    () => SearchStore(
      searchUsersUseCase: getIt<SearchUsersUseCase>(),
      followUserUseCase: getIt<FollowUserUseCase>(),
      unfollowUserUseCase: getIt<UnfollowUserUseCase>(),
    ),
  );

  getIt.registerFactory<StoryDataSource>(
    () => StoryDataSourceImpl(
      http: getIt<HttpClient>(),
    ),
  );

  getIt.registerFactory<StoryRepository>(
    () => StoryRepositoryImpl(
      storyDataSource: getIt<StoryDataSource>(),
    ),
  );

  getIt.registerFactory<FetchStoriesUseCase>(
    () => FetchStoriesUseCase(
      storyRepository: getIt<StoryRepository>(),
    ),
  );

  getIt.registerFactory<StoryStore>(
    () => StoryStore(
      fetchStoriesUseCase: getIt<FetchStoriesUseCase>(),
    ),
  );
}
