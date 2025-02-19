import 'package:flutter/material.dart';
import 'package:user_github/module/presentation/view/widgets/item_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ItemList(
                htmlUrl: 'https://github.com/mojombo',
                login: 'mojombo',
                id: '1',
                avatarUrl: 'https://avatars.githubusercontent.com/u/1?v=4',
              ),
              ItemList(
                htmlUrl: 'https://github.com/defunkt',
                login: 'defunkt',
                id: '2',
                avatarUrl: 'https://avatars.githubusercontent.com/u/2?v=4',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
