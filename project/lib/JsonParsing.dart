import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Mail.dart';

class JsonParsing {
  Future<void> saveData(List<Mail> data) async {
    debugPrint("origin : $data");
    debugPrint("origin : ${data[0].title}");

    String jsonData = jsonEncode(data.map((item) => item.toJson()).toList());

    debugPrint("jsonData : $jsonData");

    await saveJsonToFile(jsonData);

    /*
      var file = File('$_localPath/mail.json');
      file.writeAsStringSync(jsonData);
      debugPrint("file : $file");
       */
    //getData(jsonData);  //working well
  }
  Future<List<Mail>> getData(List<Mail> ret) async {
    var sp = await SharedPreferences.getInstance();
    var jsonData = sp.getString('mails');

    List<dynamic> myList = json.decode(jsonData!);
    List<Mail> mailObj = <Mail>[];

    for(int i = 0 ; i < myList.length ; i++) {
      var sender = myList[0]["sender"].toString();
      var title = myList[0]["title"].toString();
      var message = myList[0]["message"].toString();
      var time = myList[0]["time"].toString();
      var isStar = myList[0]["isStar"] as bool;
      var label = myList[0]["label"].toString();

      var temp = Mail(sender, title, message, time, isStar, label);

      mailObj.add(temp);
    }

    ret = mailObj;
    debugPrint("ret : $ret");
    //debugPrint("obj : ${mailObj[0].title}");
    return mailObj;
  }
  Future<void> saveJsonToFile(String jsonData) async {
    var fileName = 'mail.json';
    //const directory = "/data/user/0/project/app_flutter/";
    //var directory = await getApplicationDocumentsDirectory();
    //debugPrint("directory : $directory");

    var sp = await SharedPreferences.getInstance();
    await sp.setString('mails', jsonData);
    debugPrint("save sp");

    /*
    var appDocDir = await getApplicationDocumentsDirectory();
    var appDocPath = appDocDir.path;
    debugPrint("doc : $appDocPath");

    var path = 'assets/mail/$fileName';

    final file = File(path);
    debugPrint("asd");
    if (await file.exists()) {
      debugPrint("true");
      // File exists, open it using the platform's default app
      await file.open();
    } else {
      debugPrint("else");
      // File does not exist, create it
      await file.create(recursive: true);
      debugPrint('File created: $path');
    }

    debugPrint("file : $file");

    //var filePath = path.join(directory.path, fileName);
    //var file = File(path);

    var sink = file.openWrite();

    sink.write(jsonData);
    debugPrint("jsonData after write");

    await sink.flush();
    await sink.close();
  */

  }
}