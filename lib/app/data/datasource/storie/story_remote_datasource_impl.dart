import 'package:precificar_app/app/core/utils/constants/app_constants.dart';
import 'package:precificar_app/app/data/datasource/clients/http_client.dart';

import 'package:precificar_app/app/data/datasource/storie/story_remote_datasource.dart';
import 'package:precificar_app/app/data/models/story_model.dart';

class StoryDataSourceImpl implements StoryDataSource {
  final HttpClient _http;

  StoryDataSourceImpl({required HttpClient http}) : _http = http;

  @override
  Future<List<StoryModel>> getStories({required int id}) async {
    final response = await _http.get(
      endpoint: '${AppConstants.getUserStories}/$id',
    );

    final List json = response.data["stories"];

    final List<StoryModel> stories = [];

    if (json.isNotEmpty) {
      stories.addAll(
        json.map(
          (e) => StoryModel.fromJson(e),
        ),
      );
    }

    return stories;
  }
}
