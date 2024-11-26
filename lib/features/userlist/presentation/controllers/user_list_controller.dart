import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
      final rawUsers = await getUsersUseCase();
      users.value = rawUsers.map((user) {
        final dateTimeBirthday = DateTime.parse(user.birthday!);
        final formattedBirthday =
            DateFormat('MMMM dd, yyyy').format(dateTimeBirthday);
        return UserEntity(
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
          phone: user.phone,
          city: user.city,
          state: user.state,
          country: user.country,
          birthday: formattedBirthday,
        );
      }).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load remote users: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
