import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:user_github/di/user_locator.dart';
import 'package:user_github/module/domain/entity/user.dart';
import 'package:user_github/module/domain/enum/status_enum.dart';
import 'package:user_github/module/presentation/view/widgets/item_list.dart';
import 'package:user_github/module/presentation/view_model/home_view_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String token = 'insert here your Fine-grained personal access token';

  bool isSetupLoaded = false;

  late HomeViewModel viewModel;

  List<User> userList = [];

  @override
  void initState() {
    super.initState();
    UserLocator.setupHomeDependencies();
    viewModel = locator.get<HomeViewModel>();
    loadScreen();
  }

  Future<void> loadScreen() async {
    userList = await getUserList();
    isSetupLoaded = true;
    setState(() {});
  }

  Future<List<User>> getUserList() async {
    await viewModel.getUserList(
      token,
    );
    if (viewModel.status.value.runtimeType == List<User>) {
      return viewModel.status.value;
    } else {
      return [];
    }
  }

  @override
  void dispose() {
    super.dispose();
    UserLocator.unregisterHomeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'User List',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black87,
        ),
        body: Observer(
          builder: (context) {
            if (!isSetupLoaded) {
              return getBodyLoading();
            }
            switch (viewModel.status) {
              case StatusEnum.none:
              case StatusEnum.success:
                return getBody();
              case StatusEnum.loading:
                return getBodyLoading();
              case StatusEnum.error:
                return getBodyError();
            }
          },
        ),
      ),
    );
  }

  Widget getBodyLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getBodyError() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error,
              size: MediaQuery.of(context).size.width / 3,
            ),
            Text(
              'An error has ocurred, please try again later!',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Reload Screen',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: getUserListWidget(),
      ),
    );
  }

  List<Widget> getUserListWidget() {
    List<Widget> list = [];
    for (User user in userList) {
      list.add(
        ItemList(
          htmlUrl: user.htmlUrl ?? '',
          login: user.login ?? '',
          id: user.id?.toString() ?? '',
          avatarUrl: user.avatarUrl ?? '',
        ),
      );
    }
    return list;
  }
}
