import 'package:precificar_app/app/data/models/story_model.dart';

class StoryState {
  final List<StoryModel> stories;

  StoryState({
    required this.stories,
  });

  factory StoryState.initial() {
    return StoryState(
      stories: [],
    );
  }

  factory StoryState.fetchStories({required List<StoryModel> stories}) {
    return StoryState(
      stories: stories,
    );
  }

  StoryState copyWith(List<StoryModel>? stories) {
    return StoryState(
      stories: stories ?? this.stories,
    );
  }
}
