import 'package:dartz/dartz.dart';
import 'package:user_github/module/domain/entity/user.dart';
import 'package:user_github/module/domain/error/error_get_user_list.dart';

abstract class UserRepositoryInterface {
  Future<Either<FailureGetUserList, List<User>>> getUserList(
    String token,
  );
}
