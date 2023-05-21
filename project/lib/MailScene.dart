import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/JsonParsing.dart';
import 'package:project/MailInnerSceneStateful.dart';
import 'package:project/MailWrite.dart';
import 'package:project/MailWriteStateful.dart';

import 'Drawer.dart';
import 'Mail.dart';
import 'MailInnerScene.dart';
import 'MailSceneStateful.dart';

//https://velog.io/@dosilv/Flutter-StatelessWidget-StatefulWidget
class MailScene extends State<MailSceneStateful> with RouteAware {
  static var mails = [Mail("AAA@gmail.com",
      "A-mail Title",
      "MessageMessageMessageMessageMessageMessageMessageMessage", "21:00", false, "받은편지함", true, false),
    Mail("BBB@gmail.com",
        "B-mail Title",
        "MessageMessageMessageMessageMessageMessageMessageMessage", "10:30", false, "받은편지함", false, true),
    Mail("CCC@gmail.com",
        "C-mail Title",
        "starMessagestarMessagestarMessagestarMessagestarMessage", "12:50", true, "별표편지함", false, false)];

  static var changes = Mail("", "", "", "", false, "", false, false);
  var nowLabel = "";
  static var inMailNum = -1;
  static var newData = Mail("", "", "", "", false, "", false, false);

  List<Mail> items = [];
  Future<List<Mail>> getFutureData() async {
    return await JsonParsing().getData();
  }

  static List<Color> mailsColor = [Colors.white, Colors.white, Colors.white];
  static var sendMails = [];
  static var sendMailsColor = [];
  var isSelect = false;
  var listview;

  static var flag_rebuild_Dismissible = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint("build mail class");
    debugPrint("MailWrite : ${MailWrite.getInput()}");

    //JsonParsing().saveData(mails);

    //라벨에 맞는 메일만 필터링
    setState(() {
      //MailInnewrScene의 변경 내용 적용
      if(inMailNum != -1) {
        //isStar는 항상 재설정
        mails[inMailNum].isStar = changes.isStar;

        //변경 사항이 있을 때
        if(changes != Mail("", "", "", "", false, "", false, false)) {

        }
      }
      changes = Mail("", "", "", "", false, "", false, false);
      items = setLabel(nowLabel, mails);
      debugPrint("len : ${items.length}");
    });

    listview = getListView();


    var appbar = !isSelect ? AppBar(title: Row(
      children: [
        Text("메일"),
        Text((nowLabel == "") ? "" : " : "),
        Text(nowLabel)
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
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: appbar,
          drawer: !isSelect ? MyDrawer(onItemSelected: onDrawerItemSelected) : null,
          floatingActionButton: SizedBox(
            width: 200,
            height: 50,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MailWriteStateful())
                );
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
          body: getListView(),

          /*
          bottomNavigationBar: SizedBox(
            height: 100,
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /*
                Visibility(
                  //visible이 false이면 child가 동작하지 않음
                  visible: true,
                  child: FutureBuilder(
                  future: getFutureData(),
                  builder: (context, snapshot) {
                    mails = snapshot.data!;
                    debugPrint("exec FutureBuilder");
                    return Text("");
                  },),
                ),
                 */

                InkWell(  //GestureDetector
                  onTap: () {
                  },
                  child: const SizedBox(
                    height: 200,
                    width: 100,
                    child: Icon(Icons.mail),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChatScene())
                    );

                    //Navigator.pop(context);
                  },
                  child: const SizedBox(
                    height: 200,
                    width: 100,
                    child: Icon(Icons.messenger_outline),
                  ),
                ),
                InkWell(
                  onTap: () {
                    addMail(Mail("tempSender",
                        "tempTitle",
                        "tempMessage", "tempTime", false, "받은편지함", false));
                    //changeLabel("별표편지함");
                  },
                  child: const SizedBox(
                    height: 200,
                    width: 100,
                    child: Icon(Icons.person_3),
                  ),
                ),
              ],
            ),
          ),
          */
        )
    );
  }

  List<Mail> setLabel(String targetLabel, List<Mail> item) {
    if(targetLabel == "") {
      return item;
    }

    List<Mail> all = [];

    for(int i = 0 ; i < item.length ; i++) {
      if(item[i].label == targetLabel) {
        debugPrint("add");
        all.add(item[i]);
      }
    }

    return all;
  }

  void onDrawerItemSelected(String selected) {
    debugPrint("onDrawerItemSelected : $nowLabel");
    setState(() {
      nowLabel = selected;
    });
  }

  static Mail getMail() {
    return mails[inMailNum];
  }
  static void deleteMail() {
    mails.removeAt(inMailNum);
    //@@this prevent "RangeError (index): Index out of range: no indices are valid: 0"
    inMailNum = -1;
  }
  ListView getSendListView() {
    debugPrint("sendMails : $sendMails");

    var listView = ListView.builder(
      itemCount: sendMails.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              if(!isSelect) {
                debugPrint("mailScene$index");
                inMailNum = index;
                setState(() {
                  isSelect = false;
                });
                sendMails[inMailNum].isRead = true;
                MailInnerScene.from = 0;
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MailInnerSceneStateful())
                );
              }
              else {
                setState(() {
                  if(sendMailsColor[index] == Colors.red) {
                    //이미 선택된 경우 해제
                    sendMailsColor[index] = Colors.white;
                  }
                  else {
                    sendMailsColor[index] = Colors.red;
                  }
                });
              }
            },
            //선택 및 강조 (appBar의 back버튼을 클릭 시에만 isSelect를 false로 세팅)
            onLongPress: () {
              setState(() {
                sendMailsColor[index] = Colors.red;
                inMailNum = index;
                isSelect = true;
              });
            },
            child: Container(
              color: !isSelect ? (!sendMails[index].isRead ? sendMailsColor[index] = Colors.white : sendMailsColor[index] = Colors.black12) : sendMailsColor[index],
              child: ListTile(
                  leading: const FlutterLogo(size: 50.0),
                  title: Text(sendMails[index].sender),
                  subtitle: SizedBox(
                    height: 50,
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 1000,
                          child: Text(
                            sendMails[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 1000,
                          child: Text(
                            sendMails[index].message.substring(0, 10),
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
                      (sendMails[index].isReceiverOpen) ? const Icon(Icons.mail_outline) : const Icon(Icons.mail),
                      SizedBox(
                        width: 100,
                        child: Column(
                          children: [
                            Text(sendMails[index].time),
                            StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      sendMails[index].isStar = !sendMails[index].isStar;
                                    });
                                    debugPrint("item-index : ${sendMails[index].toJson()}");
                                    /*
                                    if(sendMails[index].isStar) {
                                      sendMails[index].label = "별표편지함";
                                    }
                                    else {
                                      sendMails[index].label = "받은편지함";
                                    }
                                     */
                                  },
                                  child: sendMails[index].isStar ? const Icon(Icons.star, color: Colors.yellowAccent)
                                      : const Icon(Icons.star, color: Colors.grey),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            )
        );
    });
    return listView;
  }
  ListView getListView() {
    var listView;

    setState(() {
      listView = ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          var ink = InkWell(
              onTap: () {
                if(!isSelect) {
                  debugPrint("mailScene$index");
                  inMailNum = index;
                  setState(() {
                    isSelect = false;
                  });
                  mails[inMailNum].isRead = true;
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MailInnerSceneStateful())
                  );
                }
                else {
                  setState(() {
                    if(mailsColor[index] == Colors.red) {
                      //이미 선택된 경우 해제
                      mailsColor[index] = Colors.white;
                    }
                    else {
                      mailsColor[index] = Colors.red;
                    }
                  });
                }
              },
              //선택 및 강조 (appBar의 back버튼을 클릭 시에만 isSelect를 false로 세팅)
              onLongPress: () {
                setState(() {
                  mailsColor[index] = Colors.red;
                  inMailNum = index;
                  isSelect = true;
                });
              },
              child: Container(
                color: !isSelect ? (!items[index].isRead ? mailsColor[index] = Colors.white : mailsColor[index] = Colors.black12) : mailsColor[index],
                child: ListTile(
                  leading: const FlutterLogo(size: 50.0),
                  title: Text(items[index].sender),
                  subtitle: SizedBox(
                    height: 50,
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 1000,
                          child: Text(
                            items[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 1000,
                          child: Text(
                            items[index].message.substring(0, 10),
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
                      (items[index].isReceiverOpen) ? const Icon(Icons.mail_outline) : const Icon(Icons.mail),
                      SizedBox(
                        width: 100,
                        child: Column(
                          children: [
                            Text(items[index].time),
                            StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      items[index].isStar = !items[index].isStar;
                                    });
                                    debugPrint("item-index : ${items[index].toJson()}");
                                    if(items[index].isStar) {
                                      items[index].label = "별표편지함";
                                    }
                                    else {
                                      items[index].label = "받은편지함";
                                    }
                                  },
                                  child: items[index].isStar ? const Icon(Icons.star, color: Colors.yellowAccent)
                                      : const Icon(Icons.star, color: Colors.grey),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              )
          );
          final thisItem = items[index].toString();
          var dismiss = Dismissible(
              key: Key(thisItem),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                if(direction == DismissDirection.startToEnd) {
                  //왼쪽으로 슬라이드
                  setState(() {
                    //삭제 이벤트 세팅
                    //items.removeAt(index);
                    //items.removeWhere((element) => element.message == mails[index].message && element.sender == mails[index].sender);
                    //items.removeWhere((element) => element == mails[index]);
                  });
                }
                else if(direction == DismissDirection.endToStart) {
                  //오른쪽으로 슬라이드
                  setState(() {
                    //삭제 이벤트 세팅
                    //조건이 하나면 동작 함
                    //items.removeWhere((element) => element.message == mails[index].message);
                    //items.removeWhere((element) => element.message == items[index].message);



                    //inMailNum = index; deleteMail();
                    //items.removeWhere((element) => element.message + element.sender == mails[index].message + mails[index].sender);
                    //items.removeAt(index);
                    //items.removeWhere((element) => compareObject(element, mails[index]));
                    //items.removeWhere((element) => element == mails[index]);
                    //items.removeWhere((element) => compareObject(element, mails[index]));
                    //items.removeWhere((element) => (element.message.compareTo(mails[index].message) == 0 && element.title.compareTo(mails[index].title) == 0));
                    //items.removeWhere((element) => element.toJson() == mails[index].toJson());
                    //mails.remove(mails[index]);
                    //mails.remove(items[index]);
                  });
                }

                /*
                //화면 하단에 메시지 출력
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('제거됨')),
                );
                 */
              },
              /*
              //스와이프 한 뒤 Dialog로 confirm 받음
              confirmDismiss: (direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirm'),
                      content: Text('Are you sure you want to remove?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
              */
              child: ink);

          return dismiss;
        },
      );
    });

    return listView;
  }
}