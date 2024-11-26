import 'package:get/get.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_users_usecase.dart';

class UserListController extends GetxController {
  final GetUsersUseCase getUsersUseCase;

  var users = <UserEntity>[];

  UserListController(this.getUsersUseCase);

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
    update();
  }

  void fetchUsers() async {
    users = await getUsersUseCase();
  }
}
