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

  var mailWidget = [];
  var mailWidgetColor = [];
  static var mailWidgetStatic = [];
  static var mailWidgetColorStatic = [];
  List<DynamicWidget> listDynamic = [];
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

  /*
  ListView getWidget() {
    setWidget();
    debugPrint("in getWidget : ${mailWidget}");
    return ListView.builder(
        itemCount: mailWidget.length,
        itemBuilder: (context, index) {
          return mailWidget[index];
        });
  }
  //https://rrtutors.com/tutorials/How-to-add-Widget-dynamically-on-button-click-flutter
  void setWidget() {
    mailWidget = [];
    mailWidgetColor = [];
    var newWidget;
    var index;

    setState(() {
      for(var i = 0 ; i < mails.length ; i++) {
        index = i;
        newWidget = InkWell(
            onTap: () {
              if(!isSelect) {
                debugPrint("mailSceneWrite $index");
                inMailNum = index;
                debugPrint("mailSceneWrite inMailNum $inMailNum");
                setState(() {
                  isSelect = false;
                });
                mails[inMailNum].isRead = true;
                MailInnerScene.from = 1;
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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (mails[index].isReceiverOpen) ? const Icon(Icons.mail_outline) : const Icon(Icons.mail),
                      SizedBox(
                        width: 100,
                        child: Column(
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
                                    if(mails[index].isStar) {
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
                    ],
                  )
              ),
            )
        );
        mailWidget.add(newWidget);
      }

      for(var i = 0 ; i < mailWidget.length ; i++) {
        mailWidgetColor.add(Colors.white);
      }
    });
  }
  ListView getListView() {
    setListView();
    return listView;
  }
  void setListView() {
    debugPrint("in setListView length : ${mails.length}");
    debugPrint("in setListView mail : ${mails.toString()}");
    setState(() {
      listView = ListView.builder(
        itemCount: mails.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                if(!isSelect) {
                  debugPrint("mailSceneWrite $index");
                  inMailNum = index;
                  debugPrint("mailSceneWrite inMailNum $inMailNum");
                  setState(() {
                    isSelect = false;
                  });
                  mails[inMailNum].isRead = true;
                  MailInnerScene.from = 1;
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        (mails[index].isReceiverOpen) ? const Icon(Icons.mail_outline) : const Icon(Icons.mail),
                        SizedBox(
                          width: 100,
                          child: Column(
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
                                      if(mails[index].isStar) {
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
                      ],
                    )
                ),
              )
          );
        },
      );
    });
    return listView;
  }
   */
  void onDrawerItemSelected(String selected) {
    if(selected != "보낸편지함") {
      Navigator.pop(context);
    }
  }
  static Mail getMail() {
    return mails[inMailNum];
  }
  void addDynamic() {
    setState(() {
      listDynamic.add(DynamicWidget());
    });
  }
  static void addDynamicStatic() {
    mailWidgetStatic.add(DynamicWidget());
  }
  ListView getListView() {
    var newWidget;
    mailWidgetStatic = [];
    mailWidgetColorStatic = [];
    debugPrint("length widget : ${mails.length}");

    for(var i = 0 ; i < mails.length ; i++) {
      newWidget = Text("aa");
      mailWidgetStatic.add(newWidget);
      mailWidgetColorStatic.add(Colors.white);
    }
    var listview = ListView.builder(
        itemCount: mailWidgetStatic.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Text("aa"),
          );
        });

    return listview;
  }
}
//https://www.youtube.com/watch?v=xPW1vtDDlt4
class DynamicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("aa")
    );
  }

}