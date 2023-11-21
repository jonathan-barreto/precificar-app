import 'package:precificar_app/app/data/models/story_model.dart';

abstract class StoryRepository {
  Future<List<StoryModel>> fetchStories({required int id});
}
