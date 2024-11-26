import 'package:dio/dio.dart';
import '../models/user_model.dart';

class RemoteUserDataSource {
  final Dio dio;

  RemoteUserDataSource(this.dio);

  Future<List<UserModel>> getUsers() async {
    try {
      final response = await dio
          .get('https://randomuser.me/api/', queryParameters: {'results': 10});
      final List results = response.data['results'];
      return results.map((user) => UserModel.fromJson(user)).toList();
    } catch (e) {
      throw Exception('Failed to get users: $e');
    }
  }
}
