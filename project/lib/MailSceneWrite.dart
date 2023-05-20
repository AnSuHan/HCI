import 'package:flutter/material.dart';

import 'Drawer.dart';
import 'Mail.dart';
import 'MailInnerScene.dart';
import 'MailInnerSceneStateful.dart';
import 'MailSceneWriteStateful.dart';

class MailSceneWrite extends State<MailSceneWriteStateful>{
  var isSelect = false;
  static var inMailNum = -1;

  static var mails = [Mail("AAA@gmail.com",
        "A-mail Title",
        "MessageMessageMessageMessageMessageMessageMessageMessage", "04:20", false, "받은편지함", true, false),
    Mail("BBB@gmail.com",
        "B-mail Title",
        "MessageMessageMessageMessageMessageMessageMessageMessage", "23:50", false, "받은편지함", true, true),
    Mail("CCC@gmail.com",
        "C-mail Title",
        "MessageMessageMessageMessageMessageMessageMessageMessage", "14:01", false, "받은편지함", true, false),
    Mail("DDD@gmail.com",
        "D-mail Title",
        "MessageMessageMessageMessageMessageMessageMessageMessage", "17:30", false, "받은편지함", true, false)];
  var mailsColor = [Colors.white, Colors.white, Colors.white, Colors.white];

  static var mailWidgetStatic = [];
  static var mailWidgetColorStatic = [];
  var listView;

  @override
  Widget build(BuildContext context) {
    var appbar = !isSelect ? AppBar(title: Row(
      children: [
        Text("메일"),
      ],
    ))  //Text('메일 : $nowLabel')
        : AppBar(title: IconButton(onPressed: () {
      setState(() {
        isSelect = false;
        for(int i = 0 ; i < mailsColor.length ; i++) {
          mailsColor[i] = Colors.white;
        }
      });
    }, icon: const Icon(Icons.arrow_back_sharp),),
      actions: [
        IconButton(onPressed: () {
          //원래는 보관이지만 전체 선택으로 변경 (네이버 메일 앱 참조)
          setState(() {
            if(mailsColor.contains(Colors.white)) {
              //선택되지 않은 메일이 하나라도 있는 경우
              for(int i = 0 ; i < mailsColor.length ; i++) {
                mailsColor[i] = Colors.red;
              }
            }
            else {
              for(int i = 0 ; i < mailsColor.length ; i++) {
                mailsColor[i] = Colors.white;
              }
            }
          });
        }, icon: const Icon(Icons.checklist)),
        IconButton(onPressed: () {
          //삭제
          setState(() {
            //인덱스가 큰 것 부터 삭제
            for(int i = mails.length - 1 ; i >= 0 ; i--) {
              if(mailsColor[i] == Colors.red) {
                mails.removeAt(i);
                mailsColor.removeAt(i);
              }
            }
            inMailNum = -1;
            isSelect = false;
          });
        }, icon: const Icon(Icons.delete)),
        IconButton(onPressed: () {
          //읽지 않음 상태
        }, icon: const Icon(Icons.mail)),
        IconButton(onPressed: () {

        }, icon: const Icon(Icons.menu_open)),
      ],
    );

    return MaterialApp(
      home: Scaffold(
        appBar: appbar,
        drawer: !isSelect ? MyDrawer(onItemSelected: onDrawerItemSelected) : null,
        body: getListView(),
        floatingActionButton: SizedBox(
          width: 200,
          height: 50,
          child: FloatingActionButton(
            onPressed: () {
              //addDynamic();
            },
            child: Stack(
              children: const [
                Icon(Icons.abc),
                Positioned(
                  left: 24,
                  child: Text("편지쓰기"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDrawerItemSelected(String selected) {
    if(selected != "보낸편지함") {
      Navigator.pop(context);
    }
  }
  static Mail getMail() {
    debugPrint("in getMail : ${inMailNum}");
    return mails[inMailNum];
  }
  static void deleteMail() {
    mails.removeAt(inMailNum);
    //@@this prevent "RangeError (index): Index out of range: no indices are valid: 0"
    inMailNum = -1;
  }
  ListView getListView() {
    var newWidget;
    mailWidgetStatic = [];
    mailWidgetColorStatic = [];
    debugPrint("length widget : ${mails.length}");

    for(var i = 0 ; i < mails.length ; i++) {
      newWidget = Container(
        //color: !isSelect ? (!mails[i].isRead ? mailsColor[i] = Colors.white : mailsColor[i] = Colors.black12) : mailsColor[i],
        child: ListTile(
            leading: const FlutterLogo(size: 50.0),
            title: Text(mails[i].sender),
            subtitle: SizedBox(
              height: 50,
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 1000,
                    child: Text(
                      mails[i].title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 1000,
                    child: Text(
                      mails[i].message.substring(0, (mails[i].message.length >= 10) ? 10 : mails[i].message.length),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              (mails[i].isReceiverOpen) ? const Icon(Icons.mail_outline) : const Icon(Icons.mail),
              SizedBox(
                width: 100,
                child: Column(
                  children: [
                    Text(mails[i].time),
                    StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              mails[i].isStar = !mails[i].isStar;
                            });
                            debugPrint("item-index : ${mails[i].toJson()}");
                            if(mails[i].isStar) {
                              //mails[i].label = "별표편지함";
                            }
                            else {
                              //mails[i].label = "받은편지함";
                            }
                          },
                          child: mails[i].isStar ? const Icon(Icons.star, color: Colors.yellowAccent)
                              : const Icon(Icons.star, color: Colors.grey),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      
      mailWidgetStatic.add(newWidget);
      mailWidgetColorStatic.add(Colors.white);
    }
    var listview = ListView.builder(
        itemCount: mailWidgetStatic.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              MailInnerScene.from = 1;
              inMailNum = index;
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MailInnerSceneStateful())
              );
            },
            child: mailWidgetStatic[index],
          );
        });

    return listview;
  }
}