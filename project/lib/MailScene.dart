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
import 'searchbar.dart';

//https://velog.io/@dosilv/Flutter-StatelessWidget-StatefulWidget
class MailScene extends State<MailSceneStateful> with RouteAware {
  static var mails = [Mail("AAA@gmail.com",
      "A-mail Title",
      "MessageMessageMessageMessageMessageMessageMessageMessage", "230404_21:00", false, "받은편지함", true, false),
    Mail("BBB@gmail.com",
        "B-mail Title",
        "MessageMessageMessageMessageMessageMessageMessageMessage", "230404_10:30", false, "받은편지함", false, true),
    Mail("CCC@gmail.com",
        "C-mail Title",
        "starMessagestarMessagestarMessagestarMessagestarMessage", "230403_12:50", true, "별표편지함", false, false),
    Mail("AAA@gmail.com",
        "A-mail Title",
        "MessageMessageMessageMessageMessageMessageMessageMessage", "230402_21:00", false, "받은편지함", true, false),
    Mail("BBB@gmail.com",
        "B-mail Title",
        "MessageMessageMessageMessageMessageMessageMessageMessage", "230402_10:30", false, "받은편지함", false, true),
    Mail("CCC@gmail.com",
        "C-mail Title",
        "starMessagestarMessagestarMessagestarMessagestarMessage", "230401_12:50", true, "별표편지함", false, false)];

  static var changes = Mail("", "", "", "", false, "", false, false);
  var nowLabel = "";
  static var inMailNum = -1;
  static var newData = Mail("", "", "", "", false, "", false, false);

  List<Mail> items = [];
  Future<List<Mail>> getFutureData() async {
    return await JsonParsing().getData();
  }

  static List<Color> mailsColor = [];
  static var sendMails = [];
  static var sendMailsColor = [];
  var isSelect = false;
  var listview;

  static var flag_rebuild_Dismissible = false;
  var removableIndex = [];
  var concentrateItems = [];
  static var isConcentrate = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint("build mail class");
    debugPrint("MailWrite : ${MailWrite.getInput()}");

    //setting Colors
    for(var i = 0 ; i < mails.length ; i++) {
      mailsColor.add(Colors.white);
    }

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
    ),
    actions: [
      IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage())
        );
      },icon: Icon(Icons.add),
    )],)  //Text('메일 : $nowLabel')
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
                if(isConcentrate) {
                  //다시 버튼을 누르면 모아보기 종료
                  isConcentrate = false;
                  setState(() {
                    isSelect = false;
                    for(int i = 0 ; i < mailsColor.length ; i++) {
                      mailsColor[i] = Colors.white;
                    }
                  });
                  return;
                }

                //모아보기 사용한 선택자가 한 명일 때만 동작
                var selected = [];
                var i = 0;
                for(i = 0 ; i < mailsColor.length ; i++) {
                  if(mailsColor[i] == Colors.red) {
                    selected.add(i);
                  }
                }

                var senderName = "";
                for(i = 0 ; i < selected.length ; i++) {
                  if(senderName == "") {
                    senderName = mails[selected[i]].sender;
                  }
                  else if(mails[selected[i]].sender == senderName){
                    continue;
                  }
                  else {
                    //두 명 이상의 사용자가 선택된 경우 취소
                    setState(() {
                      isSelect = false;
                      for(i = 0 ; i < mailsColor.length ; i++) {
                        mailsColor[i] = Colors.white;
                      }
                    });
                    return;
                  }
                }

                setState(() {
                  concentrateItems = [];

                  for(i = 0 ; i < mails.length ; i++) {
                    if(mails[i].sender == senderName) {
                      concentrateItems.add(mails[i]);
                    }
                  }
                  isConcentrate = true;

                  //선택 해제
                  isSelect = false;
                  for(i = 0 ; i < mailsColor.length ; i++) {
                    mailsColor[i] = Colors.white;
                  }
                });


              }, icon: const Icon(Icons.account_balance_wallet)),
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
                var selected = [];
                var i = 0;
                for(i = 0 ; i < mailsColor.length ; i++) {
                  if(mailsColor[i] == Colors.red) {
                    selected.add(i);
                  }
                }

                for(i = 0 ; i < selected.length ; i++) {
                  mails[i].isRead = (mails[i].isRead) ? false : true;
                }
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

    if(isConcentrate) {
      //모아보기 실행하는 경우
      listView = ListView.builder(
          itemCount: concentrateItems.length,
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
                  color: !isSelect ? (!concentrateItems[index].isRead ? mailsColor[index] = Colors.white : mailsColor[index] = Colors.black12) : mailsColor[index],
                  child: ListTile(
                      leading: const FlutterLogo(size: 50.0),
                      title: Text(concentrateItems[index].sender),
                      subtitle: SizedBox(
                        height: 50,
                        width: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 1000,
                              child: Text(
                                concentrateItems[index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: 1000,
                              child: Text(
                                concentrateItems[index].message.substring(0, 10),
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
                          (concentrateItems[index].isReceiverOpen) ? const Icon(Icons.mail_outline) : const Icon(Icons.mail),
                          SizedBox(
                            width: 100,
                            child: Column(
                              children: [
                                Text(concentrateItems[index].time),
                                StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          concentrateItems[index].isStar = !concentrateItems[index].isStar;
                                        });
                                        debugPrint("item-index : ${concentrateItems[index].toJson()}");
                                        if(concentrateItems[index].isStar) {
                                          concentrateItems[index].label = "별표편지함";
                                        }
                                        else {
                                          concentrateItems[index].label = "받은편지함";
                                        }
                                      },
                                      child: concentrateItems[index].isStar ? const Icon(Icons.star, color: Colors.yellowAccent)
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
            final thisItem = concentrateItems[index].toString();
            var dismiss = Dismissible(
                key: Key(thisItem),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                  var ind = -1;
                  for(var i = 0 ; i < mails.length ; i++) {
                    if(mails[i] == concentrateItems[index]) {
                      ind = i;
                      break;
                    }
                  }
                  debugPrint("ind : $ind");
                  if(ind != -1) {
                    removableIndex.add(ind);
                  }
                },
                child: ink);

            return dismiss;
      });

      return listView;
    } //concentrateItems의 마지막

    //setItem();
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
                            Text(items[index].time.split("_")[0]),
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
                  swipeDelete(index);
                }
                else if(direction == DismissDirection.endToStart) {
                  //오른쪽으로 슬라이드
                  swipeDelete(index);
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

  void swipeDelete(index) {
    var ind = -1;
    for(var i = 0 ; i < mails.length ; i++) {
      if(mails[i] == items[index]) {
        ind = i;
        break;
      }
    }
    debugPrint("ind : $ind");
    if(ind != -1) {
      removableIndex.add(ind);
    }

    //Navigator를 사용하여 해결하였지만 화면 전환으로 인한 깜빡임이 생긴다
    //다른 방법으로 수정이 필요하다
    setItem();
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MailSceneStateful(),)
    );
  }

  void setItem() {
    setState(() {
      //삭제 먼저 수행
      if(removableIndex != []) {
        for(var i = removableIndex.length - 1 ; i >= 0 ; i--) {
          mails.removeAt(removableIndex[i]);
          mailsColor.removeAt(removableIndex[i]);
        }
      }
      removableIndex = [];

      items = setLabel(nowLabel, mails);

      debugPrint("in setItem : mails len : ${mails.length}");
      debugPrint("in setItem : color len : ${mailsColor.length}");
    });
  }
}