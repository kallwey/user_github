import 'package:dio/dio.dart';
import 'package:user_github/module/data/model/user_model.dart';
import 'package:user_github/module/data/remote/user_remote_interface.dart';

class UserRemote implements UserRemoteInterface {
  final dio = Dio();

  @override
  Future<List<UserModel>> getUserList({required String token}) async {
    final response = await dio.get('https://api.github.com/users');
    print(response);
    return [];
  }
}
