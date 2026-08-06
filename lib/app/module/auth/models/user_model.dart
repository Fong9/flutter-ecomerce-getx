class UserModel {

  final String name;
  final String email;
  final String? avatar;


  UserModel({
    required this.name,
    required this.email,
    this.avatar,
  });


  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }
}