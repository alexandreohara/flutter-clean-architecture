import '../../domain/entities/user_entity.dart';

abstract class UserRepository {
  List<UserEntity> getUsers();
}
