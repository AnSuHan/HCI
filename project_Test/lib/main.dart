import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MailScene(),
      ),
    );
  }
}

class MailScene extends StatelessWidget {
  const MailScene({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint("mail class");

    var items = [Mail("tempSender",
        "tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_",
        "tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_",
        "tempMessage", "tempTime", false),
      Mail("tempSender",
          "tempTitle",
          "tempSubtitle",
          "tempMessage", "tempTime", false)];

    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar( title: const Text('메일') ),
          drawer: const MyDrawer(),
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  debugPrint("mailScene$index");
                },
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
                            items[index].subTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Column(
                    children: [
                      Text(items[index].time),
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                items[index].isStar = !items[index].isStar;
                              });
                            },
                            child: items[index].isStar ? const Icon(Icons.star, color: Colors.yellowAccent)
                                : const Icon(Icons.star, color: Colors.grey),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          bottomNavigationBar: SizedBox(
            height: 100,
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                    child: Icon(Icons.chat),
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

class ChatScene extends StatelessWidget {
  const ChatScene({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint("chat class");

    var items = [Mail("tempSender",
        "tempTitle",
        "tempSubtitle",
        "tempMessage", "tempTime", false),
      Mail("tempSender",
          "tempTitle",
          "tempSubtitle",
          "tempMessage", "tempTime", false)];

    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar( title: const Text('채팅') ),
          drawer: const MyDrawer(),
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  debugPrint("chatScene$index");
                },
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
                            items[index].subTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Column(
                    children: [
                      Text(items[index].time),
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                items[index].isStar = !items[index].isStar;
                              });
                            },
                            child: items[index].isStar ? const Icon(Icons.star, color: Colors.yellowAccent)
                                : const Icon(Icons.star, color: Colors.grey),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          bottomNavigationBar: SizedBox(
            height: 100,
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(  //GestureDetector
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const SizedBox(
                    height: 200,
                    width: 100,
                    child: Icon(Icons.mail),
                  ),
                ),
                InkWell(
                  onTap: () {
                  },
                  child: const SizedBox(
                    height: 200,
                    width: 100,
                    child: Icon(Icons.chat),
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




class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 100,
            child: SizedBox(
              child: Container(
                padding: const EdgeInsets.all(20), // Text 위젯에 대해 padding을 지정합니다.
                child: const Text(
                  'Gmail',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),


          Container(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('사용 중', style: TextStyle(fontSize: 20)),
              trailing: const Icon(Icons.star),
              onTap: () {
                debugPrint("drawer 사용 중");
              }
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('상태 추가', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 상태 추가");
              }
          ),


          Container(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('전체 받은편지함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 전체 받은편지함");
              }
          ),


          Container(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('기본', style: TextStyle(fontSize: 20)),
              trailing: const Text('1'),
              onTap: () {
                debugPrint("drawer 기본");
              }
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('프로모션', style: TextStyle(fontSize: 20)),
              trailing: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    /* 이미지를 프로젝트에 추가하거나
                         다른 방식 찾기*/
                    image: AssetImage('assets/background_image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Text(
                  '신규 1',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              onTap: () {
                debugPrint("drawer 프로모션");
              }
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('소셜', style: TextStyle(fontSize: 20)),
              trailing: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    /* 이미지를 프로젝트에 추가하거나
                         다른 방식 찾기*/
                    image: AssetImage('assets/background_image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Text(
                  '신규 1',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              onTap: () {
                debugPrint("drawer 소셜");
              }
          ),


          const Text("모든 라벨"),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('별표편지함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 별표편지함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('다시알림편지함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 다시알림편지함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('중요편지함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 중요편지함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('보낸편지함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 보낸편지함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('예약편지함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 예약편지함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('보낼편지함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 보낼편지함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('임시보관함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 임시보관함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('전체보관함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 전체보관함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('스팸함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 스팸함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('휴지통', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 휴지통");
              }
          ),

          const Text("Google 앱"),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Calendar', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer Calendar");
              }
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('주소록', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 주소록");
              }
          ),


          Container(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('설정', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 설정");
              }
          ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('고객센터', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 고객센터");
              }
          ),
        ],
      ),
    );
  }
}

class Mail {
  var sender = "";
  var title = "";
  var subTitle = "";
  var message = "";
  var time = "";
  var isStar = false;

  Mail(this.sender, this.title, this.subTitle, this.message, this.time, this.isStar);
}