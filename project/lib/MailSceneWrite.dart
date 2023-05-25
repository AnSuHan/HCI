import 'package:flutter/material.dart';

import 'Drawer.dart';
import 'Mail.dart';
import 'MailInnerScene.dart';
import 'MailInnerSceneStateful.dart';
import 'MailSceneWriteStateful.dart';

class MailSceneWrite extends State<MailSceneWriteStateful>{
  var isSelect = false;
  static var inMailNum = -1;

  static var mails = [Mail("BBB@gmail.com",
        "dadada",
        "MessageMessageMessageMessageMessageMessageMessageMessage", "230403_23:50", false, "받은편지함", true, true),
    Mail("AAA@gmail.com",
        "A-mail Title",
        "MessageMessageMessageMessageMessageMessageMessageMessage", "230403_04:20", false, "받은편지함", true, false),
    Mail("CCC@gmail.com",
        "C-mail Title",
        "MessageMessageMessageMessageMessageMessageMessageMessage", "230402_14:01", false, "받은편지함", true, false),
    Mail("DDD@gmail.com",
        "D-mail Title",
        "MessageMessageMessageMessageMessageMessageMessageMessage", "230401_17:30", false, "받은편지함", true, false)];
  var mailsColor = [Colors.white, Colors.white, Colors.white, Colors.white];

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
        body: getListViewNotWidget(),
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
  Map<String, String> senderImageMap = {
    'AAA@gmail.com': 'assets/contact/blue.png',
    'BBB@gmail.com': 'assets/contact/green.png',
    'CCC@gmail.com': 'assets/contact/purple.png',
    'DDD@gmail.com': 'assets/contact/red.png',

    // Add more mappings for each sender/email and image asset
  };
  ListView getListViewNotWidget() {
    var listview = ListView.builder(
        itemCount: mails.length,
        itemBuilder: (context, index) {
          var ink = InkWell(
            onTap: () {
              MailInnerScene.from = 1;
              inMailNum = index;
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MailInnerSceneStateful())
              );
            },
            child: Container(
              //color: !isSelect ? (!mails[i].isRead ? mailsColor[i] = Colors.white : mailsColor[i] = Colors.black12) : mailsColor[i],
              child: ListTile(
                leading: Image.asset(
                  senderImageMap[mails[index].sender] ?? 'assets/images/file-tzt.png',
                  width: 50.0,
                ),
                title: Text(mails[index].sender),
                subtitle: SizedBox(
                  height: 50,
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 1000,
                        child: Text(
                          mails[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 1000,
                        child: Text(
                          mails[index].message.substring(0, (mails[index].message.length >= 10) ? 10 : mails[index].message.length),
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
                    (mails[index].isReceiverOpen) ? const Icon(Icons.mail_outline) : const Icon(Icons.mail),
                    SizedBox(
                      width: 100,
                      child: Column(
                        children: [
                          Text(mails[index].time.split("_")[0]),
                          StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    mails[index].isStar = !mails[index].isStar;
                                  });
                                  //debugPrint("item-index : ${mails[index.toJson()}");
                                  if(mails[index].isStar) {
                                    //mails[i].label = "별표편지함";
                                  }
                                  else {
                                    //mails[i].label = "받은편지함";
                                  }
                                },
                                child: mails[index].isStar ? const Icon(Icons.star, color: Colors.yellowAccent)
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
            ),
          );
          var dismiss = Dismissible(
              key: Key(mails[index].toString()),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                if(direction == DismissDirection.startToEnd) {
                  //왼쪽으로 슬라이드
                  swipeDelete(index);
                }
                else if(direction == DismissDirection.endToStart) {
                  swipeDelete(index);
                }
              }, child: ink);

          return dismiss;
        });

    return listview;
  }

  void swipeDelete(index) {//Navigator를 사용하여 해결하였지만 화면 전환으로 인한 깜빡임이 생긴다
    //다른 방법으로 수정이 필요하다
    setItem(index);
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MailSceneWriteStateful(),)
    );
  }

  void setItem(index) {
    setState(() {
      //삭제 수행
      mails.removeAt(index);
      mailsColor.removeAt(index);
      getListViewNotWidget();
    });
  }
}