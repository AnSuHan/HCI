import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/MailInnerSceneStateful.dart';

import 'ChatScene.dart';
import 'Mail.dart';
import 'MailScene.dart';

class MailInnerScene extends State<MailInnerSceneStateful> {
  bool isMenuOpen = false;
  var mailReceiveLabel = true;
  var mailStarLabel = false;
  Mail data = MailScene.getMail();

  @override
  Widget build(BuildContext context) {
    var isStar = MailScene.mails[MailScene.inMailNum].isStar;
    final screenWidth = MediaQuery.of(context).size.width;
    final textWidth = screenWidth * 0.8;

    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar( title: IconButton(onPressed: () {
                /*
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MailSceneStateful()));
                */
                Navigator.pop(context);
                //Navigator.popAndPushNamed(context, "MailScene_screen");

            }, icon: const Icon(Icons.backspace)),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add_box)),
              IconButton(onPressed: () {
                MailScene.deleteMail();
                Navigator.pop(context);
              }, icon: const Icon(Icons.cancel)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.mail)),
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
          body: Column(
            children: [
              /*
              //this code have space, not locating above
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: isMenuOpen ? 200 : 0,
                child: ListView(
                  children: [
                    ListTile(
                      title: Text("Menu Item 1"),
                    ),
                    ListTile(
                      title: Text("Menu Item 2"),
                    ),
                    ListTile(
                      title: Text("Menu Item 3"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text("Main Content"),
                  ),
                ),
              ),
               */
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
}