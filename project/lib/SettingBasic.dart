import 'package:flutter/material.dart';
import 'package:project/SettingBasicStateful.dart';
import 'package:project/SettingDetailStateful.dart';

import 'Setting.dart';
import 'SettingDetail.dart';

class SettingBasic extends State<SettingBasicStateful> {
  static var itemsBasic = [["테마", "시스템 기본값"], ["기본 이메일 알림 작업", "보관처리"], ["알림 관리", ""],
  ["이메일 대화형식으로 보기", true, "IMAP, POP3 및 Exchange 계정의 경우 동일한 대화의 이메일을 하나로 묶음"],
  ["대화 목록 밀도", "기본"], ["메일 스와이프 동작", "대화 목록에서 이메일 관련 작업을 빠르게 실행할 수 있도록 스와이프 동작을 설정함"],
  ["스크롤할 때 하단 탐색 숨기기", true], ["기본 이메일 답장 작업", "기본 답장 설정 선택"], ["이메일 메시지 자동 맞춤", true, "화면 크기메 맞게 메일 축소"],
  ["Gmail에서 웹 링크 열기", true, "빠른 탐색을 위해 사용"], ["자동 진행", "보관처리 또는 삭제 후 대화 목록 표시"],
  ["TITLE", "작업 확인"],
  ["삭제하기 전에 확인하기", true], ["보관처리하기 전에 확인하기", true], ["보내기 전에 확인하기", true]];
  static var itemsMail = [["TITLE", "계정"], ["Google 계정 관리", ""],
    ["TITLE", "개인설정"], ["중요한 사용자 메일만 읽기", true], ["스팸메일 자동 삭제", false], ["휴지통 자동 비우기", false], ["사용자 차단", ""], ["오래된 메일 자동 삭제", ""],
  ["TITLE", "받은편지함"], ["받은편지함 유형", "기본 받은편지함"], ["받은편지함 카테고리", "기본, 프로모션, 소셜"],
  ["TITLE", "알림"], ["이메일 알림", "모두"], ["받은편지함 알림", "한 번만 알림"],
    ["라벨 관리", ""], ["채팅 알림", true], ["채팅 알림 일시중지", ""], ["알림 소리", ""], ["알림 관리", ""],
  ["TITLE", "기본설정"], ["Chat", true, "채팅 및 채팅방 탭 표시"], ["기본 답장 설정", "답장"], ["모바일 서명", "설정되지 않음"],
    ["대화형식으로 보기", true, "주제가 같은 이메일을 그룹화합니다. 이 설정이 적용되는 데는 약간의 시간이 걸릴 수 있습니다."],
    ["스마트 기능 및 맞춤설정", true, "Gmail, Chat, Meet에서 내 이메일, 채팅, 동영상 콘텐츠를 활용해 사용 환경을 맞춤설정하고 스마트 기능을 제공할 수 있습니다."],
    ["다른 Google 제품의 스마트 기능 및 맞춤설정", true, "Google에서 내 이메일, 채팅, 동영상 콘텐츠를 활용해 사용 환경을 맞춤설정하고 스마트 기능을 제공할 수 있습니다."],
    ["배송 추적", false, "Google이 운송업체와 배송 상품의 운송장 번호를 공유합니다. Gmail로 상태 업데이트가 전송됩니다."],
    ["이메일의 스마트 편지쓰기", true, "예상 추천 단어 표시하기"], ["이메일의 스마트 답장", true, "가능한 경우 제안 답장 표시"],
    ["Chat에서 차단된 사용자 관리", ""], ["차단된 채팅방 및 채팅 관린", ""], ["부재중 자동응답", "사용 안함"],
  ["TITLE", "회의 참여"], ["영상 통화용 회의 참여 탬 표시", false], ["통화 벨소리", true, "전화 수신 시 벨소리 울리기"],
  ["TITLE", "중요한 메일 올리기"], ["답장 및 후속 조치", ""], ["TITLE", "받은편지함 도움말"], ["받은편지함 도움말 설정", ""],
  ["TITLE", "데이터 사용"], ["Gmail 동기화", true], ["메일 동기화 일 수", "30일"], ["첨부파일 다운로드", true, "Wi-Fi를 통해 최근 메일의 첨부파일을 자동으로 다운로드"],
    ["이미지", "항상 외부 이미지 표시"], ["동적 이메일 사용 설정", true, "가능한 경우 동적 이메일 콘텐츠를 표시합니다."],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(getTitle(), style: const TextStyle(color: Colors.black),),
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back_sharp, color: Colors.black)),
          actions: [
            IconButton(onPressed: () {

            }, icon: const Icon(Icons.menu, color: Colors.black)),
          ],
          backgroundColor: Colors.white,
        ),
        body: getListView(Setting.selectIndex),
      ),
    );
  }

  String getTitle() {
    return Setting.options[Setting.selectIndex];
  }
  ListView getListView(int type) {
    var items = [];

    //기본설정
    if(type == 0) {
      items = itemsBasic;
    }
    //계정추가
    else if(type == Setting.options.length - 1) {

    }
    //계정별 설정
    else {
      items = itemsMail;
    }

    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.grey,
        thickness: 1.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return (items[index][0] == "TITLE") ? Text(items[index][1].toString(), style: const TextStyle(color: Colors.blueGrey),) : getListItem(items, index);
      },
    );
  }
  InkWell getListItem(List items, int index) {
    return InkWell(
      onTap: () {
        gotoDetail(items[index][0]);
      },
      child: ListTile(
        title: Text(items[index][0].toString()),
        subtitle: (items[index][1] is! bool)
            ? Text(items[index][1].toString())
            : null,
        trailing: (() {
          if (items[index][1] is bool) {
            return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
              return Checkbox(
                value: items[index][1] as bool,
                onChanged: (value) {
                  setState(() {
                    items[index][1] = !(items[index][1] as bool);
                    value = items[index][1] is bool;
                  });
                },
              );
            });
          }
          else {
            //체크 박스를 사용 하지 않는 경우(예외)와 체크 박스가 인덱스2에 있는 경우
            try {
              return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                return Checkbox(
                    value: items[index][2] as bool,
                    onChanged: (value) {
                      setState(() {
                        items[index][2] = !(items[index][2] as bool);
                        value = items[index][2] as bool;
                      });
                    });
              });
            } finally {
              return const Text("");
            }
          }
        })(),
      ),
    );
  }

  //alertDialog가 아닌 새로운 화면을 구성해야 하는 경우, 다른 클래스로 이동하여 빌드
  bool gotoDetail(title) {
    var type = Setting.selectIndex;
    var itemsBasicGo = ["메일 스와이프 동작"];
    var itemsMail = [];

    if(type == 0) {
      if(itemsBasicGo.contains(title)) {
        SettingDetail.appbarTitle = title;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingDetailStateful())
        );
      }
    }

    return true;
  }
}