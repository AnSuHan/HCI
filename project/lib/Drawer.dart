import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Temp.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var userState = const Icon(Icons.arrow_drop_down);

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

          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return ListTile(
                  leading: const Icon(Icons.circle, size: 15, color: Colors.green),
                  title: const Text('사용 중', style: TextStyle(fontSize: 20)),
                  trailing: userState,
                  onTap: () {
                    debugPrint("drawer 사용 중");
                    setState(() {
                      if(userState.icon == Icons.arrow_drop_down) {
                        userState = const Icon(Icons.arrow_drop_up);
                      }
                      else {
                        userState = const Icon(Icons.arrow_drop_down);
                      }
                    });

                  }
              );
            },
          ),

          ListTile(
            title: (userState.icon == Icons.arrow_drop_down) ? Text("asd") : Text("qwe")

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
              leading: const Icon(Icons.gif_box),
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
              leading: const Icon(Icons.gif_box),
              title: const Text('기본', style: TextStyle(fontSize: 20)),
              trailing: const Text('1'),
              onTap: () {
                debugPrint("drawer 기본");
              }
          ),
          ListTile(
              leading: const Icon(Icons.label),
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
              leading: const Icon(Icons.person_add_alt_sharp),
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
              leading: const Icon(Icons.star_outline),
              title: const Text('별표편지함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 별표편지함");
                Navigator.pop(context);
                Temp().nowLabel = "별표편지함";
                thisLabel = "별표편지함";
              }
          ),
          ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('다시알림편지함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 다시알림편지함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.label_important),
              title: const Text('중요편지함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 중요편지함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.send),
              title: const Text('보낸편지함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 보낸편지함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.schedule_send),
              title: const Text('예약편지함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 예약편지함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.crop_square),
              title: const Text('보낼편지함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 보낼편지함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.file_present_outlined),
              title: const Text('임시보관함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 임시보관함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.markunread_mailbox),
              title: const Text('전체보관함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 전체보관함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.warning),
              title: const Text('스팸함', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 스팸함");
              }
          ),
          ListTile(
              leading: const Icon(Icons.restore_from_trash),
              title: const Text('휴지통', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 휴지통");
              }
          ),

          const Text("Google 앱"),
          ListTile(
              leading: const Icon(Icons.perm_contact_calendar_outlined),
              title: const Text('Calendar', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer Calendar");
              }
          ),
          ListTile(
              leading: const Icon(Icons.person_add_rounded),
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
              leading: const Icon(Icons.settings),
              title: const Text('설정', style: TextStyle(fontSize: 20)),
              onTap: () {
                debugPrint("drawer 설정");
              }
          ),
          ListTile(
              leading: const Icon(Icons.question_mark_rounded),
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