import 'package:dartz/dartz.dart';
import 'package:user_github/module/domain/entity/user.dart';
import 'package:user_github/module/domain/error/error_get_user_list.dart';
import 'package:user_github/module/domain/repository/user_repository_interface.dart';
import 'package:user_github/module/domain/usecase/get_user_list_usecase_interface.dart';

class GetUserListUsecase implements GetUserListUsecaseInterface {
  final UserRepositoryInterface repository;

  GetUserListUsecase(this.repository);

  @override
  Future<Either<FailureGetUserList, List<User>>> call(
    String token,
  ) async {
    if (token.trim().isEmpty) {
      return left(InvalidGetUserListDataError());
    } else {
      return await repository.getUserList(token);
    }
  }
}
