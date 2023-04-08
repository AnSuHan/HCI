import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/MailInnerSceneStateful.dart';

import 'ChatScene.dart';

class MailInnerScene extends State<MailInnerSceneStateful> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    var isStar = false;
    final screenWidth = MediaQuery.of(context).size.width;
    final textWidth = screenWidth * 0.8;

    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar( title: IconButton(onPressed: () { Navigator.pop(context); }, icon: const Icon(Icons.backspace)),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add_box)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.cancel)),
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
                            debugPrint("asd");
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
                      children: const [
                        Text("title", style: TextStyle(fontSize: 30)),
                        Text("받은편지함"),
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
                  title: Row(children: const [
                    Text("sender", maxLines: 1, overflow: TextOverflow.ellipsis),
                    Text("time"),
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
              const Text("message"),
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
}