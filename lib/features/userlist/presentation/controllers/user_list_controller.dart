import 'package:get/get.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_users_usecase.dart';

class UserListController extends GetxController {
  final GetUsersUseCase getUsersUseCase;

  var users = <UserEntity>[].obs;
  var isLoading = true.obs;

  UserListController(this.getUsersUseCase);

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
    update();
  }

  void fetchUsers() async {
    try {
      isLoading.value = true;
      users.value = await getUsersUseCase();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load remote users: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
