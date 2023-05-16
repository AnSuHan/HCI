import 'dart:convert';
import 'dart:io';

import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Mail.dart';

class JsonParsing {
  Future<void> saveData(List<Mail> data) async {
    String jsonData = jsonEncode(data.map((item) => item.toJson()).toList());

    //웹에서 실행하는 환경인 경우 (gpt) (안드로이드에서 사용 불가)
    if(kIsWeb) {
      html.window.localStorage['mails'] = jsonData;
    }

    /*
    if(Platform.isWindows) {

    }
    else {
      await saveJsonToFile(jsonData);
    }
     */
  }
  Future<List<Mail>> getData() async {
    var sp = await SharedPreferences.getInstance();
    var jsonData = sp.getString('mails');

    if(kIsWeb) {
      jsonData = html.window.localStorage['mails'];
    }

    if(jsonData == null) {
      return <Mail>[];
    }

    List<dynamic> myList = json.decode(jsonData!);
    List<Mail> mailObj = <Mail>[];

    for(int i = 0 ; i < myList.length ; i++) {
      var sender = myList[0]["sender"].toString();
      var title = myList[0]["title"].toString();
      var message = myList[0]["message"].toString();
      var time = myList[0]["time"].toString();
      var isStar = myList[0]["isStar"] as bool;
      var label = myList[0]["label"].toString();
      var isRead = myList[0]["isRead"] as bool;
      var isReceiverOpen = myList[0]["isReceiverOpen"] as bool;

      var temp = Mail(sender, title, message, time, isStar, label, isRead, isReceiverOpen);

      mailObj.add(temp);
    }
    debugPrint("fut ${mailObj}");
    return mailObj;
  }
  Future<void> saveJsonToFile(String jsonData) async {
    var sp = await SharedPreferences.getInstance();
    await sp.setString('mails', jsonData);
    debugPrint("save sp");
  }
}