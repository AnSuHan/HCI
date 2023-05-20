import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SettingBasicStateful.dart';

class Setting extends StatelessWidget {
  static var options = ["기본설정", "temp@gmail.com", "계정추가"];
  static var selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("설정", style: TextStyle(color: Colors.black),),
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back_sharp, color: Colors.black)),
          actions: [
            IconButton(onPressed: () {

            }, icon: const Icon(Icons.menu, color: Colors.black)),
          ],
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: options.length,
            itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                selectIndex = index;
                if(index != options.length - 1) {
                  //기본설정
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingBasicStateful())
                  );
                }
                else if(index == options.length - 1) {
                  //계정추가
                }
              },
              child: Text(options[index], style: const TextStyle(fontSize: 30),),
            );
        })
      ),
    );
  }
}