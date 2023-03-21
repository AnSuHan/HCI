import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var items = [Mail("tempSender",
        "tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_tempTitle_",
        "tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_tempSubtitle_",
        "tempMessage", "tempTime"),
      Mail("tempSender",
          "tempTitle",
          "tempSubtitle",
          "tempMessage", "tempTime")];

    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar( title: Text('앱제목') ),
          drawer: MyDrawer(),
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  debugPrint("item$index");
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
                        Container(
                          width: 1000,
                          child: Text(
                            items[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
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
                      Icon(Icons.star),
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
                    debugPrint("mail");
                  },
                  child: Icon(Icons.mail),
                ),
                InkWell(
                  onTap: () {
                    debugPrint("message");
                  },
                  child: Icon(Icons.chat),
                ),
                InkWell(
                  onTap: () {
                    debugPrint("person");
                  },
                  child: Icon(Icons.person_3),
                ),
              ],
            ),
          ),
        )
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100,
            child: SizedBox(
              child: Container(
                color: Colors.blue,
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

          InkWell(
            onTap: () {

            },
            child: ListTile(
              title: Text('Item 1'),
              onTap: () {
                debugPrint("drawer item1");
              },
            ),
          ),
          InkWell(
            onTap: () {

            },
            child: ListTile(
              title: Text('Item 2'),
              onTap: () {
                debugPrint("drawer item2");
              },
            ),
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

  Mail(this.sender, this.title, this.subTitle, this.message, this.time);
}