import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/data_source/user_data_source.dart';
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
          UserRepositoryImpl(RemoteUserDataSource(Dio())),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de usuários')),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
        itemCount: controller.users.length,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 16,
        ),
        itemBuilder: (context, index) {
          UserEntity user = controller.users[index];
          return ListTile(
            onTap: () {
              Get.to(() => UserDetailsPage(user: user, index: index));
            },
            leading: Hero(
              tag: 'avatar-$index',
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.avatarUrl ?? ''),
              ),
            ),
            title: Hero(
                tag: 'name-$index',
                child: Text(
                  user.name ?? 'name',
                  style: Theme.of(context).textTheme.bodyMedium,
                )),
            subtitle: Hero(
                tag: 'email-$index',
                child: Text(
                  user.email ?? 'email',
                  style: Theme.of(context).textTheme.bodyMedium,
                )),
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
