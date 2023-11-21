class AppConstants {
  static const String baseUrl = "http://192.168.0.109:8000/";

  static const String getUserList = "api/users/list";

  static const String getFollowingUsers = "api/users/following";

  static const String getUserStories = "api/users/stories";

  static const String uploadStory = "api/users/stories";

  static const String followUser = "api/follow-user";

  static const String unfollowUser = "api/unfollow-user";

  static const String getImageUrl =
      "${AppConstants.baseUrl}storage/stories-images/";
}
