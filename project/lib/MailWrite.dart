import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/MailScene.dart';

import 'Mail.dart';
import 'MailSceneWrite.dart';
import 'MailWriteStateful.dart';
import 'Temp.dart';

class MailWrite extends State<MailWriteStateful> {
  final _receiverController = TextEditingController();
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();

  final MYACCOUNT = "temp@gmail.com";
  var writeMe = false;
  var isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
          children: [IconButton(onPressed: () { Navigator.pop(context); }, icon: const Icon(Icons.backspace, color: Colors.grey,)),
            Text(
              "편지쓰기",
              style: TextStyle(
                color: Colors.black, // Set the desired color here
              ),
            )
          ],
        ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.file_present_outlined, color: Colors.grey,)),
            IconButton(onPressed: () {
              var newobj = Mail(MYACCOUNT, parsingData(_titleController.toString()),
                  parsingData(_messageController.toString()), "230406_11:00", false, "보낸편지함", false, false);

              MailSceneWrite.mails.insert(0, newobj);

              Navigator.pop(context, newobj);
            }, icon: const Icon(Icons.send_outlined, color: Colors.grey,)),
            IconButton(onPressed: () {
              //gpt
              final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
              final RelativeRect position = RelativeRect.fromLTRB(
                MediaQuery.of(context).size.width - 100, // right
                MediaQuery.of(context).padding.top + kToolbarHeight, // top
                0, // left
                0, // bottom
              );
              showMenu(
                context: context,
                position: position,
                items: [
                  PopupMenuItem(
                    child: const Text("보내기 예약"),
                    onTap: () {
                      debugPrint("click schedule");
                      scheduleSending(context);
                      debugPrint("end of showDialog");
                    },
                  ),
                  PopupMenuItem(
                    child: const Text("라벨 변경"),
                    onTap: () {

                    },
                  ),
                  PopupMenuItem(
                    child: const Text("주소록에서 추가"),
                    onTap: () {

                    },
                  ),
                  PopupMenuItem(
                    child: const Text("비밀 모드"),
                    onTap: () {

                    },
                  ),
                  PopupMenuItem(
                    child: const Text("임시보관함에 저장"),
                    onTap: () {

                    },
                  ),
                  PopupMenuItem(
                    child: const Text("삭제"),
                    onTap: () {

                    },
                  ),
                  PopupMenuItem(
                    child: const Text("설정"),
                    onTap: () {

                    },
                  ),
                  PopupMenuItem(
                    child: const Text("고객센터"),
                    onTap: () {

                    },
                  ),
                ],
              );

              setState(() {
                isMenuOpen = !isMenuOpen;
              });
            }, icon: const Icon(Icons.menu_open, color: Colors.grey,))
          ],
        ),
        body: ListView(
          children: [
            const ListTile(
              leading: Text("보낸사람"),
              title: Text("temp@gmail.com"),
              trailing: Icon(Icons.arrow_drop_down, color: Colors.grey,),
            ),
            ListTile(
              leading: Text("받는사람"),
              title: TextField(
                controller: _receiverController,
              ),
              trailing: Container(
                width: 80.0,
                height: 50.0,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          writeMe = !writeMe;
                          _receiverController.text = textControl();
                        });
                      },
                      child: Container(
                        color: writeMe ? Colors.blue : Colors.white,
                        child: const Text("내게쓰기"),
                      ),
                    ),
                  ],
                ),
              ),
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

  String textControl() {
    var rtValue = "";
    var originText = _receiverController.text;
    if(originText == "") {
      if(writeMe) {
        rtValue = MYACCOUNT;
      }
      else {
        rtValue = "";
      }
      return rtValue;
    }

    //receiver를 배열로 관리하며 컴마로 구분
    var origin;
    if(originText.contains(",")) {
      origin = _receiverController.text.split(",");
    }
    else {
      origin = [_receiverController.text];
    }

    //컴마 이후 메일을 작성하지 않은 경우 처리
    for(var i = origin.length - 1 ; i >= 0 ; i--) {
      if(origin[i] == "") {
        origin.removeAt(i);
      }
    }

    for(var i = 0 ; i < origin.length ; i++) {
      origin[i] = origin[i].trim();
      origin[i] = origin[i].replaceAll(",", "");
    }

    if(writeMe) {
      origin.add(MYACCOUNT);
    }
    else {
      origin.remove(MYACCOUNT);
    }

    for(var i = 0 ; i < origin.length ; i++) {
      rtValue += origin[i];

      if(i < origin.length - 1) {
        rtValue += ", ";
      }
    }
    return rtValue;
  }

  static List<String> getInput() {
    var list = [""];//[parsingData(_messageController.toString())];
    return list;
  }

  void scheduleSending(ctx) {
    showDialog(
        context: ctx,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Column(
                children: const <Widget>[
                  Text("라벨 적용"),
                ],
              ),
            );
          });
        }
    );
  }
}