import 'package:get_it/get_it.dart';
import 'package:user_github/module/data/remote/user_remote.dart';
import 'package:user_github/module/data/repository/user_repository.dart';
import 'package:user_github/module/domain/usecase/get_user_list_usecase.dart';
import 'package:user_github/module/presentation/view_model/home_view_model.dart';

GetIt locator = GetIt.instance;

class UserLocator {
  static void setupUserDependencies() {
    if (!locator.isRegistered<UserRemote>()) {
      locator.registerFactory(
        () => UserRemote(),
      );
    }

    if (!locator.isRegistered<UserRepository>()) {
      locator.registerFactory(
        () => UserRepository(
          locator.get<UserRemote>(),
        ),
      );
    }
  }

  static void unregisterUserDependencies() {
    if (locator.isRegistered<UserRepository>()) {
      locator.unregister<UserRepository>();
    }

    if (locator.isRegistered<UserRemote>()) {
      locator.unregister<UserRemote>();
    }
  }

  static void setupHomeDependencies() {
    UserLocator.setupUserDependencies();

    if (!locator.isRegistered<GetUserListUsecase>()) {
      locator.registerFactory(
        () => GetUserListUsecase(
          locator.get<UserRepository>(),
        ),
      );
    }

    if (!locator.isRegistered<HomeViewModel>()) {
      locator.registerFactory(
        () => HomeViewModel(),
      );
    }
  }

  static void unregisterHomeDependencies() {
    if (locator.isRegistered<HomeViewModel>()) {
      locator.unregister<HomeViewModel>();
    }

    if (locator.isRegistered<GetUserListUsecase>()) {
      locator.unregister<GetUserListUsecase>();
    }

    UserLocator.unregisterUserDependencies();
  }
}
