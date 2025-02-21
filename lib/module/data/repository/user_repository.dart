import 'package:dartz/dartz.dart';
import 'package:user_github/module/data/remote/user_remote_interface.dart';
import 'package:user_github/module/domain/entity/user.dart';
import 'package:user_github/module/domain/error/error_get_user_list.dart';
import 'package:user_github/module/domain/repository/user_repository_interface.dart';

class UserRepository implements UserRepositoryInterface {
  final UserRemoteInterface userRemote;

  UserRepository(this.userRemote);

  @override
  Future<Either<FailureGetUserList, List<User>>> getUserList(
    String token,
  ) async {
    try {
      final result = await userRemote.getUserList(token: token);

      List<User> list = result.map((e) => e.toEntity()).toList();

      return Right(list);
    } on InvalidGetUserListDataError catch (e) {
      return left(e);
    } on GetUserListRemoteError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GetUserListRemoteError(
        message: e.toString(),
      ));
    }
  }
}
