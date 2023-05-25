import 'package:flutter/material.dart';
import 'package:project/SettingDetailStateful.dart';

class SettingDetail extends State<SettingDetailStateful> {
  static var appbarTitle = "";
  static var swipeData = [["오른쪽으로 스와이프", "보관처리"], ["왼쪽으로 스와이프", "보관처리"]];

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
      var options = ["보관처리", "삭제", "읽음/읽지않음으로 표시", "이동", "다시 알림", "없음"];

      //기본으로 체크되어 있는 값
      int? selectedRadio = 1;
      
      var swipeBody = ListView.builder(
        itemCount: swipeData.length,
        itemBuilder: (context, index) {
          var subtitleText = swipeData[index][1];

          return InkWell(
            onTap: () {
              selectedRadio = findDefaultSelection(options, swipeData[index][1]);

              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("${(index == 0) ? "오른쪽" : "왼쪽"} 스와이프를 사용할 항목"),
                  content: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      // Wrap the content in a StatefulBuilder to update the selectedRadio value
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          RadioListTile(
                            title: Text(options[0]),
                            value: 1,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                selectedRadio = value;
                                swipeData[index][1] = options[value! - 1];
                                subtitleText = options[0];
                                Navigator.pop(context);
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(options[1]),
                            value: 2,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                selectedRadio = value;
                                swipeData[index][1] = options[value! - 1];
                                subtitleText = options[1];
                                Navigator.pop(context);
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(options[2]),
                            value: 3,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                selectedRadio = value;
                                swipeData[index][1] = options[value! - 1];
                                subtitleText = options[2];
                                Navigator.pop(context);
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(options[3]),
                            value: 4,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                selectedRadio = value;
                                swipeData[index][1] = options[value! - 1];
                                subtitleText = options[3];
                                Navigator.pop(context);
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(options[4]),
                            value: 5,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                selectedRadio = value;
                                swipeData[index][1] = options[value! - 1];
                                subtitleText = options[4];
                                Navigator.pop(context);
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(options[5]),
                            value: 6,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                selectedRadio = value;
                                swipeData[index][1] = options[value! - 1];
                                subtitleText = options[5];
                                Navigator.pop(context);
                              });
                            },
                          ),
                        ],
                      );
                    },
                  ),
              ),
              );

              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingDetailStateful(),)
              );
            },
            child: Column(  //Row 사용 불가
              children: [
                ListTile(
                  title: Text(swipeData[index][0]),
                  subtitle: Text(subtitleText),
                  trailing: const Text("변경")
                ),
                Container(
                  child: getAssetPath(swipeData[index][1], index),
                )

              ],
            ),
          );
        },
      );

      return swipeBody;
    }

  }

  Widget getAssetPath(String swipeData, index) {
    var path = "";

    if(index == 0) {
      switch (swipeData) {
        case "보관처리":
          path = 'assets/images/right_save.png';
          break;
        case "삭제":
          path = 'assets/images/right_delete.png';
          break;
        case "읽음/읽지않음으로 표시":
          path = 'assets/images/right_readState.png';
          break;
        case "이동":
          path = 'assets/images/right_move.png';
          break;
        case "다시 알림":
          path = 'assets/images/right_remind.png';
          break;
        case "없음":
          path = '';
          break;
        default:
          path = 'assets/images/right_save.png';
      }
    }
    else {
      switch (swipeData) {
        case "보관처리":
          path = 'assets/images/left_save.png';
          break;
        case "삭제":
          path = 'assets/images/left_delete.png';
          break;
        case "읽음/읽지않음으로 표시":
          path = 'assets/images/left_readState.png';
          break;
        case "이동":
          path = 'assets/images/left_move.png';
          break;
        case "다시 알림":
          path = 'assets/images/left_remind.png';
          break;
        case "없음":
          path = '';
          break;
        default:
          path = 'assets/images/left_save.png';
      }
    }

    if(path != '') {
      return Container(
        height: 120,
        width: 400,
        child: Image.asset(path),
      );
    }
    else {
      return Container(
        alignment: Alignment.center,
        height: 120,
        width: 400,
        child: Text("없음"),
      );
    }
  }


  int? findDefaultSelection(List options, value) {
    return options.indexOf(value) + 1;
  }
}