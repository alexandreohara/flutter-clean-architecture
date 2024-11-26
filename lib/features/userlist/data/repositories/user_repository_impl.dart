import 'package:users_list/features/userlist/data/data_source/user_data_source.dart';
import 'package:users_list/features/userlist/domain/repositories/user_repository.dart';
import '../../domain/entities/user_entity.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteUserDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<List<UserEntity>> getUsers() async {
    return dataSource.getUsers();
  }
}
