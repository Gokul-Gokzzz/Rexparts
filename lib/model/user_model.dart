class UserModel {
  String? name;
  String? userId;
  String? email;

  UserModel({
    this.email,
    this.name,
    this.userId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      userId: json['userid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'userid': userId,
    };
  }
}
