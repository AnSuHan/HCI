import 'dart:html';

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
              var newobj = Mail("temp@gmail.com", parsingData(_titleController.toString()),
                  parsingData(_messageController.toString()), "230406", false, "받은편지함");

              debugPrint("newobj : ${newobj.toJson()}");
              debugPrint("inWrite : ${MailScene.mails.toList()}");
              //MailScene.mails.add(newobj);        //range error
              //MailScene().addMail(newobj);        //not adding
              MailScene.addMailStatic(newobj);    //range error

              setState(() {
                //MailScene.mails.add(newobj);      //range error
                //MailScene().addMail(newobj);      //not adding
                //MailScene.addMailStatic(newobj);  //range error
              });

              debugPrint("inWrite : ${MailScene.mails.toList()}");

              Navigator.pop(context, newobj);
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

  String parsingData(String raw) {
    int start = -1, end = -1;

    for(int i = 0 ; i < raw.length ; i++) {
      if(raw[i] == '┤') {
        start = i;
      }
      else if(raw[i] == '├') {
        end = i;
      }
    }

    if(start != -1 || end != -1) {
      return raw.substring(start + 1, end);
    }

    return "";
  }
}