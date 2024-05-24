class UserModel {
  final String? uid;
  final String email;
  final String? name;

  UserModel({
    this.uid,
    required this.email,
    this.name,
  });

  factory UserModel.fromjson(data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      name: data['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }
}
