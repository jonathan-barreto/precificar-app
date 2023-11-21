import 'dart:typed_data';

abstract class UploadStoryDataSouce {
  Future<void> postUploadStory({
    required int id,
    required Uint8List image,
    required String? caption,
  });
}
