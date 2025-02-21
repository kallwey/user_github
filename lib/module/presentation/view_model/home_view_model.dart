import 'package:mobx/mobx.dart';
import 'package:user_github/di/user_locator.dart';
import 'package:user_github/module/domain/enum/status_enum.dart';
import 'package:user_github/module/domain/error/error_get_user_list.dart';
import 'package:user_github/module/domain/usecase/get_user_list_usecase.dart';
import 'package:user_github/module/domain/usecase/get_user_list_usecase_interface.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  late GetUserListUsecaseInterface getUserListUsecase;

  HomeViewModelBase();

  @observable
  StatusEnum status = StatusEnum.loading;

  @action
  Future<void> getUserList(String token) async {
    status = StatusEnum.loading;
    try {
      getUserListUsecase = locator.get<GetUserListUsecase>();

      final response = await getUserListUsecase.call(token);

      if (response.isRight()) {
        status = StatusEnum.success
          ..value = response.fold(
            (l) => null,
            (r) => r,
          );
      } else {
        status = StatusEnum.error
          ..value = response.fold(
            (l) => l,
            (r) => null,
          );
      }
    } catch (e) {
      status = StatusEnum.error
        ..value = GetUserListRemoteError(
          message: e.toString(),
        );
    }
  }
}
