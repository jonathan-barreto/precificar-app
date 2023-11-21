import 'package:precificar_app/app/data/datasource/storie/story_remote_datasource.dart';
import 'package:precificar_app/app/data/models/story_model.dart';
import 'package:precificar_app/app/domain/repositories/story_repository.dart';

class StoryRepositoryImpl implements StoryRepository {
  final StoryDataSource storyDataSource;

  StoryRepositoryImpl({required this.storyDataSource});

  @override
  Future<List<StoryModel>> fetchStories({required int id}) async {
    final response = await storyDataSource.getStories(
      id: id,
    );

    return response;
  }
}
