import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:precificar_app/app/core/utils/constants/app_constants.dart';
import 'package:precificar_app/app/data/datasource/clients/http_client.dart';
import 'package:precificar_app/app/data/datasource/upload_story/upload_story_remote_datasouce.dart';

class UploadStoryDataSouceImpl implements UploadStoryDataSouce {
  final HttpClient http;

  UploadStoryDataSouceImpl({
    required this.http,
  });

  @override
  Future<void> postUploadStory({
    required int id,
    required Uint8List image,
    String? caption,
  }) async {
    final FormData formData = FormData.fromMap({
      'id': id,
      'subtitle_story': caption ?? '',
      'image': MultipartFile.fromBytes(
        image,
        filename: 'nome_da_imagem.jpg',
      ),
    });

    await http.post(
      endpoint: AppConstants.uploadStory,
      data: formData,
    );
  }
}
