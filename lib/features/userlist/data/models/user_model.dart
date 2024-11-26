import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.avatarUrl,
    required super.phone,
    required super.city,
    required super.state,
    required super.country,
    required super.birthday,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      name: '${json['name']['first']} ${json['name']['last']}',
      email: json['email'],
      avatarUrl: json['picture']['large'],
      phone: json['phone'],
      city: json['location']['city'],
      state: json['location']['state'],
      country: json['location']['country'],
      birthday: json['dob']['date']);
}
