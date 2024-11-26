import '../models/user_model.dart';

abstract class UsersDataSource {
  List<UserModel> getUsers();
}

class MockUserDataSource extends UsersDataSource {
  @override
  List<UserModel> getUsers() {
    return [
      UserModel(
        name: 'Nome 1',
        email: 'nome1@gmail.com',
        avatarUrl: 'https://randomuser.me/api/portraits/men/34.jpg',
      ),
      UserModel(
        name: 'Nome 2',
        email: 'nome2@gmail.com',
        avatarUrl: 'https://randomuser.me/api/portraits/women/29.jpg',
      ),
      UserModel(
        name: 'Batata',
        email: 'batata@gmail.com',
        avatarUrl: 'https://randomuser.me/api/portraits/women/55.jpg',
      ),
    ];
  }
}
