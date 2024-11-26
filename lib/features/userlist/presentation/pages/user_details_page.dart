import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../domain/entities/user_entity.dart';

class UserDetailsPage extends StatelessWidget {
  final UserEntity user;
  final int index;

  const UserDetailsPage({super.key, required this.user, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark),
            expandedHeight: 350,
            pinned: true,
            stretch: true,
            leading: InkWell(
              onTap: () => Get.back(),
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
              background: Hero(
                tag: 'avatar-$index',
                child: Image.network(
                  user.avatarUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                height: 32,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'name-$index',
                    child: Text(
                      user.name ?? 'Name',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Hero(
                    tag: 'email-$index',
                    child: Text(
                      user.email ?? 'Email',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Text(user.phone ?? 'Phone',
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text(user.city ?? 'City',
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text(user.state ?? 'State',
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text(user.country ?? 'Country',
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text(user.birthday ?? 'Birthday',
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
