import 'package:flutter/material.dart';
import 'package:project/SettingDetailStateful.dart';

class SettingDetail extends State<SettingDetailStateful> {
  static var appbarTitle = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(appbarTitle, style: const TextStyle(color: Colors.black),),
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back_sharp, color: Colors.black)),
          actions: [
            IconButton(onPressed: () {

            }, icon: const Icon(Icons.menu, color: Colors.black)),
          ],
          backgroundColor: Colors.white,
        ),
        body: getBody(),
      ),
    );
  }

  ListView getBody() {
    if(true){
      //스와이프 관련 세팅인 경우
      var swipeData = [["오른쪽으로 스와이프", "보관처리"], ["왼쪽으로 스와이프", "보관처리"]];
      var swipeBody = ListView.builder(
        itemCount: swipeData.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {

            },
            child: Column(  //Row 사용 불가
              children: [
                ListTile(
                  title: Text(swipeData[index][0]),
                  subtitle: Text(swipeData[index][1]),
                  trailing: TextButton(
                    onPressed: () {

                    },
                    child: Text("변경"),
                  ),
                ),
                Icon(Icons.add_box),
              ],
            ),
          );
        },
      );

      return swipeBody;
    }

  }

  /*
  void showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('My Dialog'),
            content: Text('This is a custom dialog.'),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        }
    );
  }
   */
}