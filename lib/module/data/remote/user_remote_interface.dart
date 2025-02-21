import 'package:user_github/module/data/model/user_model.dart';

abstract class UserRemoteInterface {
  Future<List<UserModel>> getUserList({required String token});
}
