import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/JsonParsing.dart';
import 'package:project/MailInnerSceneStateful.dart';
import 'package:project/MailWrite.dart';
import 'package:project/MailWriteStateful.dart';

import 'Drawer.dart';
import 'Mail.dart';
import 'MailInnerScene.dart';
import 'MailSceneStateful.dart';
import 'searchbar.dart';

//https://velog.io/@dosilv/Flutter-StatelessWidget-StatefulWidget
class MailScene extends State<MailSceneStateful> with RouteAware {
  static var mails = [
    Mail("AAA@gmail.com",
        "RE: 제품 A의 추가 판매 전략 논의 요청",
        "안녕하세요,\n저희 지원팀에서는 문의하신 제품에 대한 기술적인 지원을 제공하기 위해 이메일을 보내드립니다. 문의하신 내용에 대한 답변과 도움을 드리고자 합니다.\n문의하신 제품: 제품 X\n문의하신 내용에 대한 답변:\n기술적인 문제: 문제의 해결을 위해 기술 지원팀이 조치를 취하고 있습니다. 추가적인 정보를 제공해주시면 보다 정확한 답변을 드릴 수 있습니다.\n기능 사용법: 제품 X의 기능에 대한 자세한 설명과 사용법을 안내해드릴 수 있습니다. 필요하신 부분이 있으면 구체적으로 알려주시기 바랍니다.\n도움이 필요하거나 추가적인 질문이 있으시면 언제든지 문의해주세요. 최대한 신속하게 도움을 드리겠습니다.\n감사합니다.\n지원팀\nCompany Inc.", "230402_21:00", false, "받은편지함", true, false),
    Mail("BBB@gmail.com",
        "RE: RE: 문의하신 제품에 대한 기술 지원 안내",
        "안녕하세요,\n빠른 회신에 감사드립니다. 문의하신 제품 X에 대한 기술 지원을 제공해드리겠습니다.\n기술적인 문제: [상세한 문제 내용]에 대해 즉시 조치를 취할 수 있도록 기술 지원팀이 액션을 취하고 있습니다. 문제 해결을 위해 필요한 추가 정보가 있는지 알려주시면 보다 정확한 도움을 드릴 수 있습니다.\n기능 사용법: 제품 X의 [특정 기능]에 대한 자세한 설명과 사용법을 안내해드리겠습니다. [기능 활용 방법]을 따라 진행하시면 해당 기능을 원활하게 활용하실 수 있습니다.\n도움이 필요한 경우 언제든지 문의해주세요. 최대한 신속하고 정확한 지원을 제공하겠습니다.\n감사합니다.\n지원팀\nCompany Inc.", "230404_10:30", false, "받은편지함", false, true),
    Mail("CCC@gmail.com",
        "RE: RE: 신제품 출시 기념 할인 이벤트 아이디어 회의 요청",
        "안녕하세요,\n회신을 받아서 감사드립니다. 회의 일정으로 6월 5일 (토요일) 오후 3시를 확인했습니다. 온라인 비디오 회의를 통해 아이디어를 공유하고 토론할 수 있도록 준비하겠습니다.\n추가로 회의 전에 필요한 준비물이나 주의사항이 있다면 미리 알려주시기 바랍니다.\n감사합니다.\n마케팅 팀\nCompany Inc.", "230403_12:50", true, "별표편지함", false, false),
    Mail("AAA@gmail.com",
        "제품 A의 추가 판매 전략 논의 요청",
        "안녕하세요,\n저희 마케팅 팀에서는 최근 제품 A의 판매량을 높이기 위한 추가 전략을 고려하고 있습니다. 이에 대해 판매팀과 함께 논의하고자 이메일을 보내드립니다.\n제안 사항:\n가격 조정: 현재 제품 A의 가격이 경쟁사에 비해 높게 책정되어 있습니다. 가격 조정 여부와 조정 방향에 대해 의견을 나누고자 합니다.\n마케팅 캠페인: 제품 A를 대중에 알리기 위한 새로운 마케팅 캠페인을 기획하고 있습니다. 어떤 유형의 캠페인을 실행해볼지 아이디어를 공유해주세요.\n회의 일정 조율을 위해 가능한 날짜와 시간을 알려주시면 감사하겠습니다. 빠른 조율이 필요한 만큼 신속한 회신을 부탁드립니다.도움이 필요하거나 다른 의견이 있으시면 언제든지 연락주세요.\n감사합니다.\n\nMarketing Team\nCompany Inc.", "230404_21:00", false, "받은편지함", true, false),
    Mail("BBB@gmail.com",
        "문의하신 제품에 대한 기술 지원 안내",
        "안녕하세요 박지원님,\n 김영희라고 합니다. UI 디자이너로서 귀사에서 일하고 싶어서 이메일을 보내게 되었습니다. 제 경력과 기술이 UI 디자인 역할에 적합하다고 생각합니다.", "230402_10:30", false, "받은편지함", false, true),
    Mail("CCC@gmail.com",
        "신제품 출시 기념 할인 이벤트 아이디어 회의 요청",
        "안녕하세요,\n마케팅 팀의 여러분께 문의드립니다. 저희가 신제품 출시 기념으로 할인 이벤트를 진행하고자 하는데, 아이디어를 논의하고자 이메일을 보내드립니다.\n각자가 생각하는 할인 이벤트 아이디어를 공유하고, 가장 효과적이고 흥미로운 아이디어를 찾아내기 위해 회의를 개최하고자 합니다.\n가능한 회의 일정은 다음과 같습니다:\n날짜: 6월 5일 (토요일)\n시간: 오후 3시\n장소: 온라인 비디오 회의\n회의에 참석 가능한 시간을 알려주시면 최종 일정을 조율하도록 하겠습니다.\n다른 의견이 있거나 추가적인 아이디어를 공유하고 싶은 경우, 이메일로 알려주세요.\n감사합니다.\n마케팅 팀\nCompany Inc.", "230401_12:50", true, "별표편지함", false, false)];

  static var changes = Mail("", "", "", "", false, "", false, false);
  var nowLabel = "";
  static var inMailNum = -1;
  static var newData = Mail("", "", "", "", false, "", false, false);

  List<Mail> items = [];
  Future<List<Mail>> getFutureData() async {
    return await JsonParsing().getData();
  }

  static List<Color> mailsColor = [];
  static var sendMails = [];
  static var sendMailsColor = [];
  var isSelect = false;
  var listview;

  static var flag_rebuild_Dismissible = false;
  var removableIndex = [];
  var concentrateItems = [];
  static var isConcentrate = false;

  Map<String, String> senderImageMap = {
    'AAA@gmail.com': 'assets/contact/blue.png',
    'BBB@gmail.com': 'assets/contact/green.png',
    'CCC@gmail.com': 'assets/contact/purple.png',
    'DDD@gmail.com': 'assets/contact/red.png',

    // Add more mappings for each sender/email and image asset
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint("build mail class");
    debugPrint("MailWrite : ${MailWrite.getInput()}");

    //setting Colors
    for(var i = 0 ; i < mails.length ; i++) {
      mailsColor.add(Colors.white);
    }

    //JsonParsing().saveData(mails);

    //라벨에 맞는 메일만 필터링
    setState(() {
      //MailInnewrScene의 변경 내용 적용
      if(inMailNum != -1) {
        //isStar는 항상 재설정
        mails[inMailNum].isStar = changes.isStar;

        //변경 사항이 있을 때
        if(changes != Mail("", "", "", "", false, "", false, false)) {

        }
      }
      changes = Mail("", "", "", "", false, "", false, false);
      items = setLabel(nowLabel, mails);
      debugPrint("len : ${items.length}");
    });

    listview = getListView();


    var appbar = !isSelect ? AppBar(title: Row(
      children: [
        Text("메일"),
        Text((nowLabel == "") ? "" : " : "),
        Text(nowLabel)
      ],
    ),
    actions: [
      IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage())
        );
      },icon: Icon(Icons.add),
    )],)  //Text('메일 : $nowLabel')
        : AppBar(title: IconButton(onPressed: () {
                          setState(() {
                            isSelect = false;
                            for(int i = 0 ; i < mailsColor.length ; i++) {
                              mailsColor[i] = Colors.white;
                            }
                          });
                        }, icon: const Icon(Icons.arrow_back_sharp),),
            actions: [
              IconButton(onPressed: () {
                if(isConcentrate) {
                  //다시 버튼을 누르면 모아보기 종료
                  isConcentrate = false;
                  setState(() {
                    isSelect = false;
                    for(int i = 0 ; i < mailsColor.length ; i++) {
                      mailsColor[i] = Colors.white;
                    }
                  });
                  return;
                }

                //모아보기 사용한 선택자가 한 명일 때만 동작
                var selected = [];
                var i = 0;
                for(i = 0 ; i < mailsColor.length ; i++) {
                  if(mailsColor[i] == Colors.red) {
                    selected.add(i);
                  }
                }

                var senderName = "";
                for(i = 0 ; i < selected.length ; i++) {
                  if(senderName == "") {
                    senderName = mails[selected[i]].sender;
                  }
                  else if(mails[selected[i]].sender == senderName){
                    continue;
                  }
                  else {
                    //두 명 이상의 사용자가 선택된 경우 취소
                    setState(() {
                      isSelect = false;
                      for(i = 0 ; i < mailsColor.length ; i++) {
                        mailsColor[i] = Colors.white;
                      }
                    });
                    return;
                  }
                }

                setState(() {
                  concentrateItems = [];

                  for(i = 0 ; i < mails.length ; i++) {
                    if(mails[i].sender == senderName) {
                      concentrateItems.add(mails[i]);
                    }
                  }
                  isConcentrate = true;

                  //선택 해제
                  isSelect = false;
                  for(i = 0 ; i < mailsColor.length ; i++) {
                    mailsColor[i] = Colors.white;
                  }
                });


              }, icon: const Icon(Icons.account_balance_wallet)),
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
                var selected = [];
                var i = 0;
                for(i = 0 ; i < mailsColor.length ; i++) {
                  if(mailsColor[i] == Colors.red) {
                    selected.add(i);
                  }
                }

                for(i = 0 ; i < selected.length ; i++) {
                  mails[i].isRead = (mails[i].isRead) ? false : true;
                }
              }, icon: const Icon(Icons.mail)),
              IconButton(onPressed: () {

              }, icon: const Icon(Icons.menu_open)),
            ],
          );

    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: appbar,
          drawer: !isSelect ? MyDrawer(onItemSelected: onDrawerItemSelected) : null,
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
                children: [
                  Image.asset("assets/images/pencil2.png"),
                  const Positioned(
                    left: 24,
                    child: Text("편지쓰기"),
                  ),
                ],
              ),
            ),
          ),
          body: getListView(),
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

  void onDrawerItemSelected(String selected) {
    debugPrint("onDrawerItemSelected : $nowLabel");
    setState(() {
      nowLabel = selected;
    });
  }

  static Mail getMail() {
    return mails[inMailNum];
  }
  static void deleteMail() {
    mails.removeAt(inMailNum);
    //@@this prevent "RangeError (index): Index out of range: no indices are valid: 0"
    inMailNum = -1;
  }
  ListView getSendListView() {
    debugPrint("sendMails : $sendMails");

    var listView = ListView.builder(
      itemCount: sendMails.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              if(!isSelect) {
                debugPrint("mailScene$index");
                inMailNum = index;
                setState(() {
                  isSelect = false;
                });
                sendMails[inMailNum].isRead = true;
                MailInnerScene.from = 0;
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MailInnerSceneStateful())
                );
              }
              else {
                setState(() {
                  if(sendMailsColor[index] == Colors.red) {
                    //이미 선택된 경우 해제
                    sendMailsColor[index] = Colors.white;
                  }
                  else {
                    sendMailsColor[index] = Colors.red;
                  }
                });
              }
            },
            //선택 및 강조 (appBar의 back버튼을 클릭 시에만 isSelect를 false로 세팅)
            onLongPress: () {
              setState(() {
                sendMailsColor[index] = Colors.red;
                inMailNum = index;
                isSelect = true;
              });
            },
            child: Container(
              color: !isSelect ? (!sendMails[index].isRead ? sendMailsColor[index] = Colors.white : sendMailsColor[index] = Colors.black12) : sendMailsColor[index],
              child: ListTile(
                  leading: Image.asset(
                    'assets/images/file.png',
                    width: 50.0,
                    ),

                  title: Text(sendMails[index].sender),
                  subtitle: SizedBox(
                    height: 50,
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 1000,
                          child: Text(
                            sendMails[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 1000,
                          child: Text(
                            sendMails[index].message.substring(0, 10),
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
                      (sendMails[index].isReceiverOpen) ? const Icon(Icons.mail_outline) : const Icon(Icons.mail),
                      SizedBox(
                        width: 100,
                        child: Column(
                          children: [
                            Text(sendMails[index].time),
                            StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      sendMails[index].isStar = !sendMails[index].isStar;
                                    });
                                    debugPrint("item-index : ${sendMails[index].toJson()}");
                                    /*
                                    if(sendMails[index].isStar) {
                                      sendMails[index].label = "별표편지함";
                                    }
                                    else {
                                      sendMails[index].label = "받은편지함";
                                    }
                                     */
                                  },
                                  child: sendMails[index].isStar ? const Icon(Icons.star, color: Colors.yellowAccent)
                                      : const Icon(Icons.star, color: Colors.grey),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            )
        );
    });
    return listView;
  }
  ListView getListView() {
    var listView;

    if(isConcentrate) {
      //모아보기 실행하는 경우
      listView = ListView.builder(
          itemCount: concentrateItems.length,
          itemBuilder: (context, index) {
            var ink = InkWell(
                onTap: () {
                  if(!isSelect) {
                    debugPrint("mailScene$index");
                    inMailNum = index;
                    setState(() {
                      isSelect = false;
                    });
                    mails[inMailNum].isRead = true;
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
                //선택 및 강조 (appBar의 back버튼을 클릭 시에만 isSelect를 false로 세팅)
                onLongPress: () {
                  setState(() {
                    mailsColor[index] = Colors.red;
                    inMailNum = index;
                    isSelect = true;
                  });
                },
                child: Container(
                  color: !isSelect ? (!concentrateItems[index].isRead ? mailsColor[index] = Colors.white : mailsColor[index] = Colors.black12) : mailsColor[index],
                  child: ListTile(
                      leading: Image.asset(
                        senderImageMap[concentrateItems[index].sender] ?? 'assets/images/file-tzt.png',
                        width: 50.0,
                      ),
                      title: Text(concentrateItems[index].sender),
                      subtitle: SizedBox(
                        height: 50,
                        width: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 1000,
                              child: Text(
                                concentrateItems[index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: 1000,
                              child: Text(
                                concentrateItems[index].message.substring(0, 10),
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
                          (concentrateItems[index].isReceiverOpen) ? const Icon(Icons.mail_outline) : const Icon(Icons.mail),
                          SizedBox(
                            width: 100,
                            child: Column(
                              children: [
                                Text(concentrateItems[index].time.split("_")[0]),
                                StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          concentrateItems[index].isStar = !concentrateItems[index].isStar;
                                        });
                                        debugPrint("item-index : ${concentrateItems[index].toJson()}");
                                        if(concentrateItems[index].isStar) {
                                          concentrateItems[index].label = "별표편지함";
                                        }
                                        else {
                                          concentrateItems[index].label = "받은편지함";
                                        }
                                      },
                                      child: concentrateItems[index].isStar ? const Icon(Icons.star, color: Colors.yellowAccent)
                                          : const Icon(Icons.star, color: Colors.grey),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                  ),
                )
            );
            final thisItem = concentrateItems[index].toString();
            var dismiss = Dismissible(
                key: Key(thisItem),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                  var ind = -1;
                  for(var i = 0 ; i < mails.length ; i++) {
                    if(mails[i] == concentrateItems[index]) {
                      ind = i;
                      break;
                    }
                  }
                  debugPrint("ind : $ind");
                  if(ind != -1) {
                    removableIndex.add(ind);
                  }
                },
                child: ink);

            return dismiss;
      });

      return listView;
    } //concentrateItems의 마지막

    //setItem();
    setState(() {
      listView = ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          var ink = InkWell(
              onTap: () {
                if(!isSelect) {
                  debugPrint("mailScene$index");
                  inMailNum = index;
                  setState(() {
                    isSelect = false;
                  });
                  mails[inMailNum].isRead = true;
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
              //선택 및 강조 (appBar의 back버튼을 클릭 시에만 isSelect를 false로 세팅)
              onLongPress: () {
                setState(() {
                  mailsColor[index] = Colors.red;
                  inMailNum = index;
                  isSelect = true;
                });
              },
              child: Container(
                color: !isSelect ? (!items[index].isRead ? Colors.white : Colors.black12) : mailsColor[index],
                child: ListTile(
                    leading: Image.asset(
                      senderImageMap[items[index].sender] ?? 'assets/images/file-tzt.png',
                      width: 50.0,
                    ),
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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (items[index].isReceiverOpen) ? const Icon(Icons.mail_outline) : const Icon(Icons.mail),
                      SizedBox(
                        width: 100,
                        child: Column(
                          children: [
                            Text(items[index].time.split("_")[0]),
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
                    ],
                  )
                ),
              )
          );
          final thisItem = items[index].toString();
          var dismiss = Dismissible(
              key: Key(thisItem),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                if(direction == DismissDirection.startToEnd) {
                  //왼쪽으로 슬라이드
                  swipeDelete(index);
                }
                else if(direction == DismissDirection.endToStart) {
                  //오른쪽으로 슬라이드
                  swipeDelete(index);
                }


                /*
                //화면 하단에 메시지 출력
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('제거됨')),
                );
                 */
              },
              /*
              //스와이프 한 뒤 Dialog로 confirm 받음
              confirmDismiss: (direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirm'),
                      content: Text('Are you sure you want to remove?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
              */
              child: ink);

          return dismiss;
        },
      );
    });

    return listView;
  }

  void swipeDelete(index) {
    var ind = -1;
    for(var i = 0 ; i < mails.length ; i++) {
      if(mails[i] == items[index]) {
        ind = i;
        break;
      }
    }
    debugPrint("ind : $ind");
    if(ind != -1) {
      removableIndex.add(ind);
    }

    //Navigator를 사용하여 해결하였지만 화면 전환으로 인한 깜빡임이 생긴다
    //다른 방법으로 수정이 필요하다
    setItem();
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MailSceneStateful(),)
    );
  }

  void setItem() {
    setState(() {
      //삭제 먼저 수행
      if(removableIndex != []) {
        for(var i = removableIndex.length - 1 ; i >= 0 ; i--) {
          mails.removeAt(removableIndex[i]);
          mailsColor.removeAt(removableIndex[i]);
        }
      }
      removableIndex = [];

      items = setLabel(nowLabel, mails);

      debugPrint("in setItem : mails len : ${mails.length}");
      debugPrint("in setItem : color len : ${mailsColor.length}");
    });
  }
}