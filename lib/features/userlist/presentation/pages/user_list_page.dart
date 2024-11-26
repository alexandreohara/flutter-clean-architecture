import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/data_source/mock_user_data_source.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/usecases/get_users_usecase.dart';
import '../controllers/user_list_controller.dart';
import '../../domain/entities/user_entity.dart';
import 'user_details_page.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      UserListController(
        GetUsersUseCase(
          UserRepositoryImpl(MockUserDataSource()),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de usuários')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: controller.users.length,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 16,
        ),
        itemBuilder: (context, index) {
          UserEntity user = controller.users[index];
          return ListTile(
            onTap: () {
              Get.to(() => UserDetailsPage(user: user));
            },
            leading: Hero(
              tag: user.avatarUrl!,
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.avatarUrl ?? ''),
              ),
            ),
            title: Text(user.name ?? 'name'),
            subtitle: Text(user.email ?? 'email'),
            trailing: const Icon(Icons.navigate_next),
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(16),
            ),
          );
        },
      ),
    );
  }
}
