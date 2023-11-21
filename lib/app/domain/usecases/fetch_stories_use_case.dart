import 'package:precificar_app/app/data/models/story_model.dart';
import 'package:precificar_app/app/domain/repositories/story_repository.dart';

class FetchStoriesUseCase {
  final StoryRepository storyRepository;

  FetchStoriesUseCase({
    required this.storyRepository,
  });

  Future<List<StoryModel>> execute({required id}) async {
    final List<StoryModel> stories = await storyRepository.fetchStories(
      id: id,
    );

    return stories;
  }
}
