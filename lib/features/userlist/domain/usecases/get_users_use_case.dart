import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  List<UserEntity> call() {
    return repository.getUsers();
  }
}
