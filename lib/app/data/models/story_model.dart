// class StoriesModel {
//   final List<Story> stories;

//   StoriesModel({
//     required this.stories,
//   });

//   factory StoriesModel.fromJson(Map<String, dynamic> json) {
//     return StoriesModel(
//       stories: List<Story>.from(
//         json["stories"].map(
//           (e) => Story.fromJson(e),
//         ),
//       ),
//     );
//   }
// }

class StoryModel {
  final String image;
  final String caption;

  StoryModel({
    required this.image,
    required this.caption,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      image: json["path_image_story"],
      caption: json["subtitle_story"] ?? '',
    );
  }
}
