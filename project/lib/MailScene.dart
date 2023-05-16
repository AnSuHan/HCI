import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/JsonParsing.dart';
import 'package:project/MailInnerSceneStateful.dart';
import 'package:project/MailWrite.dart';
import 'package:project/MailWriteStateful.dart';

import 'ChatScene.dart';
import 'Drawer.dart';
import 'Mail.dart';
import 'MailSceneStateful.dart';

//https://velog.io/@dosilv/Flutter-StatelessWidget-StatefulWidget
class MailScene extends State<MailSceneStateful> with RouteAware {
  static var mails = [Mail("tempSender",
      "tempTitle",
      "tempMessage", "tempTime", false, "받은편지함", true),
    Mail("tempSender",
        "tempTitle",
        "tempMessage", "tempTime", false, "받은편지함", false),
    Mail("starSender",
        "starTitle",
        "starMessage", "starTime", true, "별표편지함", false)];
  /*
  static var mails = [Mail("LoadingSender",
      "LoadingTitle",
      "LoadingMessage", "LoadingTime", false, "받은편지함")];
   */
  //new
  //forceMerge2
  //forceMerge3
  //forceMerge to main

  static var changes = Mail("", "", "", "", false, "", false);
  var nowLabel = "";
  static var inMailNum = -1;
  var newData = Mail("", "", "", "", false, "", false);
  var newMail;
  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      newMail = MailWrite.newMail;
      mails.add(newMail);
      mailsColor.add(Colors.white);
    });
  }
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  List<Mail> items = [];
  Future<List<Mail>> getFutureData() async {
    return await JsonParsing().getData();
  }

  static List<Color> mailsColor = [Colors.white, Colors.white, Colors.white];
  var isSelect = false;

  var listview;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint("build mail class");
    /*
    newMail = MailWrite.newMail;
    debugPrint("Static Write : ${newMail}");

    if(newMail != null) {
      setState(() {
        mails.add(newMail);
        mailsColor.add(Colors.white);
        newMail = null;
      });
    }
     */
    refreshKey.currentState?.show();

    //JsonParsing().saveData(mails);

    //라벨에 맞는 메일만 필터링
    setState(() {
      //MailInnewrScene의 변경 내용 적용
      if(inMailNum != -1) {
        //isStar는 항상 재설정
        mails[inMailNum].isStar = changes.isStar;

        //변경 사항이 있을 때
        if(changes != Mail("", "", "", "", false, "", false)) {

        }
      }
      changes = Mail("", "", "", "", false, "", false);
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
          body: getIndicator(),

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

  void addMail(Mail mail) {
    setState(() {
      mails.add(mail);
      mailsColor.add(Colors.white);
    });
  }
  static void addMailStatic(Mail mail) {
    mails.add(mail);
    mailsColor.add(Colors.white);
    //newData = mail;
    debugPrint("static mails : ${mails.toList()}");
  }
  void changeLabel(String newLabel) {
    setState(() {
      nowLabel = newLabel;
    });
  }

  void update() {
    setState(() {
      //MailInnewrScene의 변경 내용 적용
      if(inMailNum != -1) {
        //isStar는 항상 재설정
        mails[inMailNum].isStar = changes.isStar;

        //변경 사항이 있을 때
        if(changes != Mail("", "", "", "", false, "", false)) {

        }
      }

      items = setLabel(nowLabel, mails);
      debugPrint("len : ${items.length}");
    });
  }
  void onDrawerItemSelected(String selected) {
    debugPrint("onDrawerItemSelected : $nowLabel");
    setState(() {
      nowLabel = selected;
    });
  }
  /*
  void setItems(Future<List<Mail>> mails) async {
    var temp = JsonParsing().getData();
    var item = await temp;

    //값 접근 가능
    debugPrint("item in set : ${item[0].title}");
    bridge.addAll(item);
    //ret = item;
  }
   */
  static Mail getMail() {
    return mails[inMailNum];
  }
  static void deleteMail() {
    mails.removeAt(inMailNum);
    //@@this prevent "RangeError (index): Index out of range: no indices are valid: 0"
    inMailNum = -1;
  }
  //gpt & https://dev-yakuza.posstree.com/ko/flutter/widget/RefreshIndicator/
  RefreshIndicator getIndicator() {
    var indicator = RefreshIndicator(key: refreshKey, onRefresh: _refreshData, child: ListView.builder(
      itemCount: mails.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              if (!isSelect) {
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
                  if (mailsColor[index] == Colors.red) {
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
              color: !isSelect ? (!mails[index].isRead ? mailsColor[index] = Colors.white : mailsColor[index] = Colors.black12) : mailsColor[index],
              child: ListTile(
                leading: const FlutterLogo(size: 50.0),
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
                          mails[index].message.substring(0, 10),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: Column(
                  children: [
                    Text(mails[index].time),
                    StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              mails[index].isStar = !mails[index].isStar;
                            });
                            debugPrint("item-index : ${mails[index].toJson()}");
                            if (mails[index].isStar) {
                              mails[index].label = "별표편지함";
                            }
                            else {
                              mails[index].label = "받은편지함";
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
            )
        );
      },
    )
    );

    return indicator;
  }
  ListView getListView() {
    debugPrint("------getListView---------");
    debugPrint("mails : ${mails}");
    debugPrint("mailsColor : ${mailsColor}");
    debugPrint("getListView-newData : ${newData.toJson()}");
    debugPrint("need to update : ${newData.sender != ""}");

    var localItems = mails;

    /*
    if(newData.sender != "") {
      setState(() {
        localItems.add(newData);
        newData = Mail("", "", "", "", false, "", false);
        //개수는 늘어남
        debugPrint("getListView-mails : ${mails.toList()}");
      });
    }
     */

    var listView;

    setState(() {
      listView = ListView.builder(
        itemCount: localItems.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                if (!isSelect) {
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
                    if (mailsColor[index] == Colors.red) {
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
                color: !isSelect ? (!localItems[index].isRead ? mailsColor[index] = Colors.white : mailsColor[index] = Colors.black12) : mailsColor[index],
                child: ListTile(
                  leading: const FlutterLogo(size: 50.0),
                  title: Text(localItems[index].sender),
                  subtitle: SizedBox(
                    height: 50,
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 1000,
                          child: Text(
                            localItems[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 1000,
                          child: Text(
                            localItems[index].message.substring(0, 10),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Column(
                    children: [
                      Text(localItems[index].time),
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                localItems[index].isStar = !localItems[index].isStar;
                              });
                              debugPrint("item-index : ${localItems[index].toJson()}");
                              if (localItems[index].isStar) {
                                localItems[index].label = "별표편지함";
                              }
                              else {
                                localItems[index].label = "받은편지함";
                              }
                            },
                            child: localItems[index].isStar ? const Icon(Icons.star, color: Colors.yellowAccent)
                                : const Icon(Icons.star, color: Colors.grey),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
          );
        },
      );
    });
    return listView;
  }
  void setListView(newList) {
    listview = newList;
  }
}
class MyModalRoute extends MaterialPageRoute<void> {
  MyModalRoute({required super.builder});

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is a modal route'),
          ElevatedButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Text('The name of this route is ${settings.name}'),
        ],
      ),
    );
  }
}