import 'package:users_list/features/userlist/domain/repositories/user_repository.dart';
import '../../domain/entities/user_entity.dart';
import '../data_source/mock_user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final MockUserDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  List<UserEntity> getUsers() {
    return dataSource.getUsers();
  }
}
