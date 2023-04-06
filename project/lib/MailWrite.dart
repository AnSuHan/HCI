import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/MailScene.dart';

import 'Mail.dart';
import 'MailWriteStateful.dart';

class MailWrite extends State<MailWriteStateful> {
  final _receiverController = TextEditingController();
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();

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
            IconButton(onPressed: () {
              var newobj = Mail("temp@gmail.com", _titleController.toString(),
                  _messageController.toString(), "230406", false, "받은편지함");
              //MailScene().addMail(newobj);

              debugPrint("newobj : $newobj");
              debugPrint("newobj : ${newobj.message}"); /* TextEditingController#3ed1a(TextEditingValue(text: ┤qwerty├, selection: TextSelection.collapsed(offset: 6, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))*/

              Navigator.pop(context);
              debugPrint("after pop");
            }, icon: const Icon(Icons.send_outlined)),
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
            ListTile(
              leading: Text("받는사람"),
              title: TextField(
                controller: _receiverController,
              ),
              trailing: Icon(Icons.arrow_drop_down),
            ),
            ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _titleController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      hintText: '제목',
                    ),
                  ),
                  TextField(
                    controller: _messageController,
                    maxLines: 20,
                    decoration: const InputDecoration(
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