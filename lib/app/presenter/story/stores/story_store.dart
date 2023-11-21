import 'package:flutter/material.dart';
import 'package:precificar_app/app/core/state/raw_state.dart';
import 'package:precificar_app/app/domain/usecases/fetch_stories_use_case.dart';
import 'package:precificar_app/app/presenter/story/states/story_state.dart';

class StoryStore extends ValueNotifier<RawState> {
  final FetchStoriesUseCase fetchStoriesUseCase;

  StoryStore({required this.fetchStoriesUseCase}) : super(const IdleState());

  Future<void> fetchStories({required int id}) async {
    final stories = await fetchStoriesUseCase.execute(
      id: id,
    );

    value = SuccessState<StoryState>(
      output: StoryState.fetchStories(
        stories: stories,
      ),
    );
  }
}
