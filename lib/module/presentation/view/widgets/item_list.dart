import 'package:flutter/material.dart';
import 'package:user_github/module/presentation/view/user_data.dart';

class ItemList extends StatelessWidget {
  final String htmlUrl;
  final String login;
  final String id;
  final String avatarUrl;

  const ItemList({
    super.key,
    required this.htmlUrl,
    required this.login,
    required this.id,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserData(
              htmlUrl: htmlUrl,
              login: login,
              id: id,
              avatarUrl: avatarUrl,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.045),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              child: ClipOval(
                child: Image.network(
                  avatarUrl,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.645,
              child: Text(
                login,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 12,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
