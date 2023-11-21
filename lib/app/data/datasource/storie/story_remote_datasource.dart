import 'package:precificar_app/app/data/models/story_model.dart';

abstract class StoryDataSource {
  Future<List<StoryModel>> getStories({required int id});
}