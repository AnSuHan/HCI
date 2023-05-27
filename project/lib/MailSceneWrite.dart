import 'package:flutter/material.dart';

import 'Drawer.dart';
import 'Mail.dart';
import 'MailInnerScene.dart';
import 'MailInnerSceneStateful.dart';
import 'MailSceneWriteStateful.dart';
import 'MailWriteStateful.dart';

class MailSceneWrite extends State<MailSceneWriteStateful>{
  var isSelect = false;
  static var inMailNum = -1;

  static var mails = [
    Mail("John",
      "RE: 프로젝트 회의 안건 및 준비물 안내",
      "안녕하세요 John님,\n회의 안건과 준비물에 대한 안내 감사드립니다. 회의를 원활하게 진행하기 위해 준비하도록 하겠습니다.\n회의 장소와 시간에 대해서는 확인하였으며, 20년 6월 2일 (목요일) 오후 2시에 회의실 3호에서 만나기로 하겠습니다.\n제가 추가로 논의하고 싶은 주제가 생기면 회의 시작 전에 미리 알려드리겠습니다.\n그 외에 필요한 사항이 있거나 회의 준비에 필요한 자료가 있다면 말씀해주세요.\n감사합니다.\n--\nEmily Johnson\n프로젝트 팀원\nABC Company\nemily@example.com\n", "0407_14:00", false, "받은편지함", false, true),
    Mail("John",
      "제목: RE: 프로젝트 회의 일정 조정에 관한 안내",
      "안녕하세요 John님,\n회의 일정 조정에 관해 메일을 주셔서 감사합니다. 제안하신 변경된 일정으로 회의를 진행하는 것에 동의합니다.\n20년 6월 2일 (목요일) 오후 2시에 회의를 진행하도록 하겠습니다. 회의실 3호도 예약되어 있는 것으로 알고 있습니다. 따로 장소 변경이 필요하지 않으므로 그대로 진행하도록 하겠습니다.\n더 필요한 사항이나 안건이 있다면 미리 말씀해주시기 바랍니다.\n감사합니다.\n--\nEmily Johnson\n프로젝트 팀원\nABC Company\nemily@example.com", "0407_13:15", false, "받은편지함", false, true),
    Mail("아이린패션",
        "RE: 문의하신 제품에 대한 기술 지원 안내",
        "안녕하세요,\n저의 문의에 대한 빠른 답변에 감사드립니다. 제품 X에 대한 기술적인 지원을 원하고 있습니다.\n기술적인 문제: 제품 X를 사용하면서 발생하는 문제는 [상세한 문제 내용]입니다. 어떻게 해결할 수 있는지 가이드라인이나 조치 방법을 알려주시면 감사하겠습니다.\n기능 사용법: 제품 X의 [특정 기능]에 대해 자세한 설명을 원합니다. 해당 기능을 어떻게 활용하고 설정할 수 있는지 자세한 안내를 부탁드립니다.\n빠른 도움이 필요한 만큼 신속한 답변을 부탁드립니다.\n감사합니다.\n고객님", "0403_:50", false, "받은편지함", true, false),
    Mail("글로벌테크",
        "제품 A 판매량 증대를 위한 회의 일정 조율",
        "안녕하세요,\n마케팅 팀의 이메일을 확인했습니다. 제품 A의 추가 판매 전략에 대해 논의하고자 하는데, 가능한 회의 일정을 제안드립니다.\n제안 사항에 대한 회의 일정:\n날짜: 6월 2일 (목요일)\n시간: 오전 11시\n장소: 회의실 B\n위 일정이 가능하시면 회의 일정을 확인하신 후 답변 부탁드립니다. 추가로 논의할 사항이 있다면 미리 알려주시기 바랍니다.\n감사합니다.\nSales Team\nCompany Inc.", "0403_04:20", false, "받은편지함", true, true),
    Mail("동아모터스",
        "RE: 신제품 출시 기념 할인 이벤트 아이디어 회의 요청",
        "안녕하세요,\n마케팅 팀 여러분께서 보내주신 이메일을 확인했습니다. 신제품 출시 기념 할인 이벤트에 대한 아이디어 회의에 참석하겠습니다.\n제안한 회의 일정인 6월 5일 (토요일) 오후 3시에 참석이 가능합니다. 온라인 비디오 회의를 통해 회의를 진행할 예정이라고 알고 있습니다.\n추가적인 아이디어나 회의 전 준비물에 대한 안내가 있다면 미리 알려주시기 바랍니다.\n회의를 통해 효과적인 할인 이벤트 아이디어를 도출해내기 위해 노력하겠습니다. 감사합니다.\n마케팅 팀\nCompany Inc.", "0402_14:01", false, "받은편지함", true, true),
    Mail("에코그린에너지",
        "제품 문의 및 견적 요청",
        "안녕하세요,\n저는 ABC Company의 매니저입니다. 저희 회사에서는 귀사의 제품에 대해 관심을 갖고 있습니다. 따라서 몇 가지 문의사항과 견적을 요청드리고자 이메일을 보내드립니다.\n제품에 대한 기능과 사양에 대해 자세히 알려주세요.\n가격 정보와 할인 가능 여부를 안내해주세요.\n배송 및 납기 일정에 대해 알고 싶습니다.\n기술 지원 및 보증 정책에 대한 정보를 부탁드립니다.\n가능하시다면, 저희에게 최신 카탈로그나 제품 브로셔를 제공해주시면 감사하겠습니다.\n빠른 회신을 부탁드리며, 귀사의 제품에 대한 자세한 정보를 기다리고 있겠습니다.\n감사합니다.\n매니저\nABC Company", "0401_17:30", false, "받은편지함", true, true)];
  var mailsColor = [];

  var listView;

  @override
  Widget build(BuildContext context) {
    //setting colors
    if(mailsColor.isEmpty) {
      for(var i = 0 ; i < mails.length ; i++) {
        mailsColor.add(Colors.white);
      }
    }

    var appbar = !isSelect ? AppBar(title: Row(
      children: [
        Text("메일"),
      ],
    ), backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),)  //Text('메일 : $nowLabel')
        : AppBar(title: IconButton(onPressed: () {
      setState(() {
        isSelect = false;
        for(int i = 0 ; i < mailsColor.length ; i++) {
          mailsColor[i] = Colors.white;
        }
      });
    }, icon: const Icon(Icons.arrow_back_sharp),),
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      actions: [
        IconButton(onPressed: () {
          //원래는 보관이지만 전체 선택으로 변경 (네이버 메일 앱 참조)
          setState(() {
            if(mailsColor.contains(Colors.white)) {
              //선택되지 않은 메일이 하나라도 있는 경우
              for(int i = 0 ; i < mailsColor.length ; i++) {
                mailsColor[i] = Colors.red;
              }
            }
            else {
              for(int i = 0 ; i < mailsColor.length ; i++) {
                mailsColor[i] = Colors.white;
              }
            }
          });
        }, icon: const Icon(Icons.checklist)),
        IconButton(onPressed: () {
          //삭제
          setState(() {
            //인덱스가 큰 것 부터 삭제
            for(int i = mails.length - 1 ; i >= 0 ; i--) {
              if(mailsColor[i] == Colors.red) {
                mails.removeAt(i);
                mailsColor.removeAt(i);
              }
            }
            inMailNum = -1;
            isSelect = false;
          });
        }, icon: const Icon(Icons.delete)),
        IconButton(onPressed: () {
          //읽지 않음 상태
        }, icon: const Icon(Icons.mail)),
        IconButton(onPressed: () {

        }, icon: const Icon(Icons.menu_open)),
      ],
    );

    return MaterialApp(
      home: Scaffold(
        appBar: appbar,
        drawer: !isSelect ? MyDrawer(onItemSelected: onDrawerItemSelected) : null,
        body: getListViewNotWidget(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 290.0),
          child: SizedBox(
            width: 200,
            height: 70,
            child: FloatingActionButton(
              backgroundColor: Colors.grey,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MailWriteStateful())
                );
              },
              child: Stack(
                children: [
                  Image.asset("assets/images/pencil_new.png"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onDrawerItemSelected(String selected) {
    if(selected != "보낸편지함") {
      Navigator.pop(context);
    }
  }
  static Mail getMail() {
    debugPrint("in getMail : ${inMailNum}");
    return mails[inMailNum];
  }
  static void deleteMail() {
    mails.removeAt(inMailNum);
    //@@this prevent "RangeError (index): Index out of range: no indices are valid: 0"
    inMailNum = -1;
  }
  Map<String, String> senderImageMap = {
    '글로벌테크': 'assets/contact/blue.png',
    '아이린패션': 'assets/contact/green.png',
    '동아모터스': 'assets/contact/purple.png',
    '에코그린에너지': 'assets/contact/red.png',
    'John' : 'assets/contact/brown.png',

    // Add more mappings for each sender/email and image asset
  };
  ListView getListViewNotWidget() {
    var listview = ListView.builder(
        itemCount: mails.length,
        itemBuilder: (context, index) {
          var ink = InkWell(
            onTap: () {
              debugPrint("click ${index}");
              if(!isSelect) {
                MailInnerScene.from = 1;
                inMailNum = index;
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MailInnerSceneStateful())
                );
              }
              else {
                setState(() {
                  if(mailsColor[index] == Colors.red) {
                    //이미 선택된 경우 해제
                    mailsColor[index] = Colors.white;
                  }
                  else {
                    mailsColor[index] = Colors.red;
                  }
                });
              }
            },
            onLongPress: () {
              setState(() {
                mailsColor[index] = Colors.red;
                inMailNum = index;
                isSelect = true;
              });
            },
            child: Container(
              color: isSelect ? mailsColor[index] : (!mails[index].isReceiverOpen ? Colors.white : Colors.black12),
              child: ListTile(
                leading: Image.asset(
                  senderImageMap[mails[index].sender] ?? 'assets/contact/blue.png',
                  width: 50.0,
                ),
                title: Text(mails[index].sender),
                subtitle: SizedBox(
                  height: 50,
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 1000,
                        child: Text(
                          mails[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 1000,
                        child: Text(
                          mails[index].message.substring(0, (mails[index].message.length >= 10) ? 10 : mails[index].message.length),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (mails[index].isReceiverOpen) ? const Icon(Icons.mail_outline) : const Icon(Icons.mail),
                    SizedBox(
                      width: 100,
                      child: Column(
                        children: [
                          Text(mails[index].time.split("_")[0]),
                          StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    mails[index].isStar = !mails[index].isStar;
                                  });
                                  //debugPrint("item-index : ${mails[index.toJson()}");
                                  if(mails[index].isStar) {
                                    //mails[i].label = "별표편지함";
                                  }
                                  else {
                                    //mails[i].label = "받은편지함";
                                  }
                                },
                                child: mails[index].isStar ? const Icon(Icons.star, color: Colors.yellowAccent)
                                    : const Icon(Icons.star, color: Colors.grey),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
          var dismiss = Dismissible(
              key: Key(mails[index].toString()),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                if(direction == DismissDirection.startToEnd) {
                  //왼쪽으로 슬라이드
                  swipeDelete(index);
                }
                else if(direction == DismissDirection.endToStart) {
                  swipeDelete(index);
                }
              }, child: ink);

          return dismiss;
        });

    return listview;
  }

  void swipeDelete(index) {//Navigator를 사용하여 해결하였지만 화면 전환으로 인한 깜빡임이 생긴다
    //다른 방법으로 수정이 필요하다
    setItem(index);
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MailSceneWriteStateful(),)
    );
  }

  void setItem(index) {
    setState(() {
      //삭제 수행
      mails.removeAt(index);
      mailsColor.removeAt(index);
      getListViewNotWidget();
    });
  }
}