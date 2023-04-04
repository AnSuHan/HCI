import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MailWrite extends StatelessWidget {
  const MailWrite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( title: Row(
          children: [IconButton(onPressed: () { Navigator.pop(context); }, icon: const Icon(Icons.arrow_left)),
            Text("편지쓰기")],
        ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.file_present_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.send_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu_open))
          ],
        ),
        body: ListView(
          children: [
            const ListTile(
              leading: Text("보낸사람"),
              title: Text("temp@gmail.com"),
              trailing: Icon(Icons.arrow_drop_down),
            ),
            const ListTile(
              leading: Text("받는사람"),
              title: TextField(

              ),
              trailing: Icon(Icons.arrow_drop_down),
            ),
            ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: '제목',
                    ),
                  ),
                  TextField(
                    maxLines: 20,
                    decoration: InputDecoration(
                      hintText: '이메일 작성',
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      )
    );
  }
}