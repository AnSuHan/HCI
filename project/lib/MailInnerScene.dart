import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/MailInnerSceneStateful.dart';

import 'ChatScene.dart';
import 'Mail.dart';
import 'MailScene.dart';
import 'MailSceneWrite.dart';

class MailInnerScene extends State<MailInnerSceneStateful> {
  bool isMenuOpen = false;
  var mailReceiveLabel = true;
  var mailStarLabel = false;
  static var from = 0;  //0 : MailScene, 1 : MailSceneWrite
  var data;
  var isRead;
  var mailList = [];
  var listExpanded = [];

  @override
  Widget build(BuildContext context) {
    var isStar;
    final screenWidth = MediaQuery.of(context).size.width;
    final textWidth = screenWidth * 0.8;
    debugPrint("from value : $from");

    switch(from) {
      case 0:
        isStar = MailScene.mails[MailScene.inMailNum].isStar;
        data = MailScene.getMail();
        mailList = gatherMails();
        isRead = MailScene.mails[MailScene.inMailNum].isRead;
        break;
      case 1:
        isStar = MailSceneWrite.mails[MailSceneWrite.inMailNum].isStar;
        data = MailSceneWrite.getMail();
        mailList = gatherMails();
        debugPrint("after getMail");
        isRead = MailSceneWrite.mails[MailSceneWrite.inMailNum].isRead;
    }
    debugPrint("after switch");
    for(var i = 0 ; i < mailList.length ; i++) {
      listExpanded.add(true);
    }

    var listview = ListView.separated(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      itemCount: mailList.length,
      itemBuilder: (BuildContext context, int index) {
        //수신한 메일 출력
        if(mailList[index][1] == "recv") {
          return Column(
            children: [
              ListTile(
                leading: const FlutterLogo(size: 50.0),
                title: Row(children: [
                  Text("${mailList[index][0].title}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                ]),
                subtitle: Text("${mailList[index][0].time}"),
              ),
              Visibility(
                  visible: listExpanded[index],
                  child: Text(mailList[index][0].message)
              ),
              //for margin
              const SizedBox(
                height: 20,
              )
            ],
          );
        }
        //송신한 메일 출력
        else {
          return Column(
            children: [
              ListTile(
                //title의 위치 정렬 위해 사용
                leading: const Visibility(
                  visible: false,
                  child: FlutterLogo(size: 50.0,),
                ),
                trailing: const Icon(Icons.add_alert, size: 50.0),
                title: Text("${mailList[index][0].title}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: Text("${mailList[index][0].time}"),
              ),
              Visibility(
                  visible: listExpanded[index],
                  child: Text(mailList[index][0].message)
              ),
              //for margin
              const SizedBox(
                height: 20,
              )
            ],
          );
        }
      }, separatorBuilder: (BuildContext context, int index)=> const Divider(
            color: Colors.grey,
            thickness: 1.0,
          ),
    );

    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar( title: IconButton(onPressed: () {
                //MailScene에서 메일을 선택할 때 from을 세팅하는데 세팅이 되지 않아
                //나갈 때 0으로 세팅
                from = 0;
                Navigator.pop(context);
            }, icon: const Icon(Icons.backspace)),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add_box)),
              IconButton(onPressed: () {
                switch(from) {
                  case 0:
                    MailScene.deleteMail();
                    break;
                  case 1:
                    MailSceneWrite.deleteMail();
                }
                Navigator.pop(context);
              }, icon: const Icon(Icons.cancel)),
              IconButton(onPressed: () {
                //읽지 않음 또는 읽음 상태로 변경
                switch(from) {
                  case 0:
                    setState(() {
                      isRead = !isRead;
                      MailScene.mails[MailScene.inMailNum].isRead = isRead;
                    });
                    break;
                  case 1:
                    setState(() {
                      isRead = !isRead;
                      MailSceneWrite.mails[MailSceneWrite.inMailNum].isRead = isRead;
                    });
                }
              }, icon: isRead ? const Icon(Icons.mail_outline) : const Icon(Icons.mail)),
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
                          child: const Text("이동"),
                          onTap: () {
                            debugPrint("asd");
                          },
                        ),
                        PopupMenuItem(
                          child: const Text("다시 알림"),
                          onTap: () {
                            debugPrint("asd");
                          },
                        ),
                        PopupMenuItem(
                          child: const Text("라벨 변경"),
                          onTap: () {
                            dialogLayout();
                          },
                        ),
                        PopupMenuItem(
                          child: const Text("중요 표시"),
                          onTap: () {
                            debugPrint("asd");
                          },
                        ),
                        PopupMenuItem(
                          child: const Text("숨기기"),
                          onTap: () {
                            debugPrint("asd");
                          },
                        ),
                        PopupMenuItem(
                          child: const Text("인쇄"),
                          onTap: () {
                            debugPrint("asd");
                          },
                        ),
                        PopupMenuItem(
                          child: const Text("자동 크기 조정 되돌리기"),
                          onTap: () {
                            debugPrint("asd");
                          },
                        ),
                        PopupMenuItem(
                          child: const Text("스팸 신고"),
                          onTap: () {
                            debugPrint("asd");
                          },
                        ),
                        PopupMenuItem(
                          child: const Text("고객센터"),
                          onTap: () {
                            debugPrint("asd");
                          },
                        ),
                    ],
                );

                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              }, icon: const Icon(Icons.menu_open))
            ],

          ),
          body: listview,

          /*
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: textWidth,
                    child: Column(
                      children: [
                        Text(data.title, style: const TextStyle(fontSize: 30)),
                        Text(data.label),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth - textWidth,
                    child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              isStar = !isStar;
                              MailScene.changes.isStar = isStar;
                              MailScene.mails[MailScene.inMailNum].isStar = isStar;
                              if(MailScene.mails[MailScene.inMailNum].isStar) {
                                MailScene.mails[MailScene.inMailNum].label = "별표편지함";
                              }
                              else {
                                MailScene.mails[MailScene.inMailNum].label = "받은편지함";
                              }
                            });
                          },
                          child: isStar ? const Icon(Icons.star, color: Colors.yellowAccent)
                              : const Icon(Icons.star, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                ],
              ),
              //보낸사람의 정보
              ListTile(
                  leading: const FlutterLogo(size: 50.0),
                  title: Row(children: [
                    Text("${data.sender} ", maxLines: 1, overflow: TextOverflow.ellipsis),
                    Text(data.time),
                  ]),
                  subtitle: Row(
                    children: const [
                      Text("receiver:"),
                      Text("name")
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [Icon(Icons.arrow_back_sharp),
                          Icon(Icons.menu)],
                  )
              ),
              Text(data.message),
            ],
          ),
          */
          bottomSheet: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {

                },
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.reply),
                        Text("답장")
                      ],
                    )
                ),
              ),
              InkWell(
                onTap: () {

                },
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.reply_all),
                        Text("전체답장")
                      ],
                    )
                ),
              ),
              InkWell(
                onTap: () {

                },
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.shortcut),
                        Text("전달")
                      ],
                    )
                ),
              ),
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: 100,
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(  //GestureDetector
                  onTap: () {
                    Navigator.pop;
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
        )
    );
  }
  void dialogLayout() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: true,
        builder: (BuildContext context) {
          //https://bit.ly/3LIK02d
          return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //Dialog Main Title
              title: Column(
                children: const <Widget>[
                  Text("라벨 적용"),
                ],
              ),
              //
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Icon(Icons.indeterminate_check_box),
                      const Text("받은편지함"),
                      Checkbox(
                        value: mailReceiveLabel,
                        onChanged: (value) {
                          setState(() {
                            //mailReceiveLabel = value!;
                            mailReceiveLabel = !mailReceiveLabel;
                            value = mailReceiveLabel;
                          });
                        },
                      ),
                      /*
                      //radio button
                      RadioMenuButton(
                          value: mailReceiveLabel,
                          groupValue: "label",
                          onChanged: (value) {
                            setState(() {
                              //mailReceiveLabel = value!;
                              mailReceiveLabel = !mailReceiveLabel;
                              value = mailReceiveLabel;
                            });
                          },
                          child: Text("asd"))
                       */
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Icon(Icons.indeterminate_check_box),
                      const Text("별표편지함"),
                      Checkbox(
                        value: mailStarLabel,
                        onChanged: (value) {
                          setState(() {
                            mailStarLabel = !mailStarLabel;
                            value = mailStarLabel;
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                  },
                  child: const Text('취소'),
                ),
                TextButton(
                  onPressed: () {
                    //라벨의 변경을 실제로 적용
                    setState(() {
                      if(mailStarLabel) {
                        MailScene.mails[MailScene.inMailNum].label = "별표편지함";
                      }
                      else {
                        MailScene.mails[MailScene.inMailNum].label = "받은편지함";
                      }
                    });
                    MailScene.inMailNum = -1;
                    Navigator.pop(context); // Close dialog
                  },
                  child: const Text('확인'),
                ),
              ],
            );
          });
        });
  }

  List gatherMails() {
    var recv = MailScene.mails;
    var send = MailSceneWrite.mails;
    var filter = [];

    var target = data.sender;
    var i;

    //받은 메일 수집
    for(i = 0 ; i < recv.length ; i++) {
      if(recv[i].sender == target) {
        filter.add([recv[i], "recv"]);
      }
    }
    //보낸 메일 수집
    for(i = 0 ; i < send.length ; i++) {
      if (send[i].sender == target) {
        filter.add([send[i], "send"]);
      }
    }

    //시간 순서대로 정렬렬
    filter.sort((a, b) => a[0].time.compareTo(b[0].time));

    return filter;
  }
}