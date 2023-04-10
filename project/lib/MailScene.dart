import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/MailInnerSceneStateful.dart';
import 'package:project/MailWriteStateful.dart';

import 'ChatScene.dart';
import 'Drawer.dart';
import 'JsonParsing.dart';
import 'Mail.dart';
import 'MailInnerScene.dart';
import 'MailSceneStateful.dart';
import 'Temp.dart';

//https://velog.io/@dosilv/Flutter-StatelessWidget-StatefulWidget
class MailScene extends State<MailSceneStateful> with RouteAware {
  static var mails = [Mail("tempSender",
      "tempTitle",
      "tempMessage", "tempTime", false, "받은편지함"),
    Mail("tempSender",
        "tempTitle",
        "tempMessage", "tempTime", false, "받은편지함"),
    Mail("starSender",
        "starTitle",
        "starMessage", "starTime", true, "별표편지함")];
  var nowLabel = "";
  static var inMailNum = -1;
  List<Mail> newData = [];

  List<Mail> items = [];

  @override
  void initState() {
    super.initState();
    items = setLabel(nowLabel, mails);

    setState(() {
      debugPrint("initState");
    });
  }
  @override
  void didUpdateWidget(covariant MailSceneStateful oldWidget) {
    setState(() {
      items = setLabel(nowLabel, mails);
      debugPrint("len : ${items.length}");
    });
    super.didUpdateWidget(oldWidget);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint("build mail class");

    //JsonParsing().saveData(mails);

    List<Mail> item = [];
    //JsonParsing().getData(item);
    //debugPrint("item from param : $item");

    //라벨에 맞는 메일만 필터링
    setState(() {
      items = setLabel(nowLabel, mails);
      debugPrint("len : ${items.length}");
    });


    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar( title: Text('메일 : $nowLabel') ),
          drawer: MyDrawer(onItemSelected: onDrawerItemSelected),
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
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  debugPrint("mailScene$index");
                  inMailNum = index;
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MailInnerSceneStateful())
                  );
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
                            items[index].message.substring(0, 10),
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
                    child: Icon(Icons.messenger_outline),
                  ),
                ),
                InkWell(
                  onTap: () {
                    addMail(Mail("tempSender",
                        "tempTitle",
                        "tempMessage", "tempTime", false, "받은편지함"));
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
    });
  }
  static void addMailStatic(Mail mail) {
    mails.add(mail);
    debugPrint("static mails : ${mails.toList()}");
  }
  void changeLabel(String newLabel) {
    setState(() {
      nowLabel = newLabel;
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