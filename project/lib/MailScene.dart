import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ChatScene.dart';
import 'Drawer.dart';
import 'JsonParsing.dart';
import 'Mail.dart';
import 'MailInnerScene.dart';
import 'MailWrite.dart';
import 'Temp.dart';


class MailScene extends StatelessWidget {
  const MailScene({super.key, this.bridge});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint("mail class");
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    var items = [Mail("tempSender",
        "tempTitle",
        "tempSubtitle",
        "tempMessage", "tempTime", false, "받은편지함"),
      Mail("tempSender",
          "tempTitle",
          "tempSubtitle",
          "tempMessage", "tempTime", false, "받은편지함")];

    JsonParsing().saveData(items);

    List<Mail> item = [];
    JsonParsing().getData(item);
    debugPrint("item from param : $item");

    /*
    var temp = JsonParsing().getData();
    debugPrint("temp : $temp");
    setItems(temp);
    debugPrint("bridge : $bridge");
     */

    //라벨 선택
    var nowLabel = thisLabel;
    debugPrint("nowLabel : $nowLabel");
    items = setLabel("받은편지함", items);




    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar( title: const Text('메일') ),
          drawer: const MyDrawer(),
          floatingActionButton: SizedBox(
            width: 200,
            height: 50,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MailWrite())
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MailInnerScene())
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
                            items[index].subTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        /*
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // file2uE (0:65)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5.33*fem, 1*fem),
                              width: 9.33*fem,
                              height: 11.67*fem,
                              child: Image.asset(
                                'assets/page-1/images/file.png',
                                width: 9.33*fem,
                                height: 11.67*fem,
                              ),
                            ),
                            const Text(
                              // message9U4 (0:68)
                              'filename'
                            ),
                          ],
                        ),
                         */
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
  final bridge;

  List<Mail> setLabel(String targetLabel, List<Mail> item) {
    List<Mail> all = [];

    for(int i = 0 ; i < item.length ; i++) {
      if(item[i].label == targetLabel) {
        debugPrint("add");
        all.add(item[i]);
      }
    }

    return all;
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