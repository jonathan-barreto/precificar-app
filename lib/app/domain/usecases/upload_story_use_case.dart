import 'dart:typed_data';

import 'package:precificar_app/app/domain/repositories/home_repository.dart';

class UploadStoryUseCase {
  final HomeRepository homeRepository;

  UploadStoryUseCase({
    required this.homeRepository,
  });

  Future<void> execute({
    required int id,
    required Uint8List image,
    String? caption,
  }) async {
    await homeRepository.uploadStory(
      id,
      image,
      caption,
    );
  }
}
