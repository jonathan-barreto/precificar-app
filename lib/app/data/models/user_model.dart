class UserModel {
  final User currentUser;
  final List<User> users;

  UserModel({
    required this.currentUser,
    required this.users,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      currentUser: User.fromJson(
        json["current_user"],
      ),
      users: List<User>.from(
        json["users"].map(
          (user) => User.fromJson(user),
        ),
      ),
    );
  }
}

class User {
  final int id;
  final String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
