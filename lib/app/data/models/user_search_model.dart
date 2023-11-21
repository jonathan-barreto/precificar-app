class SearchUserModel {
  final int id;
  final String name;
  final bool following;

  SearchUserModel({
    required this.id,
    required this.name,
    required this.following,
  });

  factory SearchUserModel.fromJson(Map<String, dynamic> json) {
    return SearchUserModel(
      id: json["id"],
      name: json["name"],
      following: json["following"],
    );
  }
}
