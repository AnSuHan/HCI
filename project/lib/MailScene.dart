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
import 'SettingBasic.dart';
import 'searchbar.dart';

//https://velog.io/@dosilv/Flutter-StatelessWidget-StatefulWidget
class MailScene extends State<MailSceneStateful> with RouteAware {
  static var mails = [
    Mail("John",
      "프로젝트 회의 안건 및 준비물 안내",
      "안녕하세요 Emily님,\n이번 주에 예정된 프로젝트 회의를 앞두고, 회의 안건과 준비물에 대해 안내드립니다.\n회의 안건:\n프로젝트 진행 상황 업데이트\n이슈 및 문제점 공유\n다음 단계 계획 및 일정 조정\n업무 분담 및 역할 재확인\n준비물:\n프로젝트 관련 문서 및 자료\n작업 진행 상황 보고서\n이슈 및 문제점 정리\n개선 방안 및 제안 사항\n회의 준비에 앞서 위 안건에 대해 사전에 준비하시면 좋을 것 같습니다. 추가로 회의 도중에 논의하고 싶은 주제나 다른 안건이 있다면 미리 알려주시기 바랍니다.\n회의 장소와 시간은 이전에 조정한 대로 20년 6월 2일 (목요일) 오후 2시, 회의실 3호에서 진행하겠습니다.\n추가 문의 사항이 있으시면 언제든지 말씀해주세요.\n감사합니다.\n--\nJohn Smith\n프로젝트 매니저\nABC Company\njohn@example.com", "0407_13:35", false, "받은편지함", true, true),
    Mail("스토어 팀",
      "전자제품 할인 특가! 최대 70% 할인된 가격으로 쇼핑하세요!",
      "안녕하세요,\n전자제품을 찾고 계신 여러분께 흥미로운 소식을 전해드립니다! 저희 온라인 스토어에서는 최신 전자제품들을 최대 70% 할인된 가격으로 만나보실 수 있습니다.\n현대 사회에서 전자제품은 우리의 일상에서 필수적인 아이템이 되었습니다. 최신 스마트폰, 노트북, 태블릿, 스마트워치 등 다양한 제품들을 다양한 브랜드에서 준비하였습니다. 또한, 가전제품부터 주방용품까지 다양한 전자제품들을 저렴한 가격에 만나보실 수 있습니다.\n특별 특가로 제공되는 할인은 한정 기간 동안만 유효하니 놓치지 마세요! 지금 바로 저희 온라인 스토어로 방문하여 다양한 전자제품들을 확인하고, 저렴한 가격에 구매하세요. 아래 링크를 클릭하시면 바로 쇼핑을 시작할 수 있습니다.\n링크: [전자제품 할인 특가 스토어 바로가기]\n더 많은 상품과 할인 혜택을 확인하려면 저희 웹사이트를 방문하거나 고객센터로 문의해 주세요. 항상 최상의 서비스로 여러분을 기다리고 있겠습니다.\n즐거운 쇼핑 되세요!\n스토어 팀 드림", "0407_12:52", false, "받은편지함", false, true),
    Mail("John",
      "프로젝트 회의 일정 조정에 관한 안내",
      "안녕하세요 Emily님,\n저희 프로젝트 팀에서는 다음 주에 예정된 회의 일정을 조정하고자 합니다. 아래와 같이 제안드리고자 합니다.\n기존 회의 일정: 20년 6월 1일 (수요일) 오전 10시\n제안 회의 일정: 20년 6월 2일 (목요일) 오후 2시\n변경된 일정으로 회의를 진행하면 좀 더 원활한 커뮤니케이션과 효율적인 업무 진행이 가능할 것으로 예상됩니다. 만약 제안 일정에 어려움이 있다면 다른 시간을 제안해주시면 감사하겠습니다.\n또한, 회의 장소는 이전과 동일하게 회의실 3호를 사용하려고 합니다. 혹시 다른 장소로 변경이 필요하다면 사전에 알려주시기 바랍니다.\n회의 일정 조정에 대한 의견을 주시면 감사하겠습니다. 빠른 회신 부탁드립니다.\n감사합니다.\n--\nJohn Smith\n프로젝트 매니저\nABC Company\njohn@example.com", "0407_12:05", true, "받은편지함", true, true),
    Mail("신상 휴대폰",
      "신상 휴대폰 출시! 놓치지 마세요, 특별 혜택이 가득한 예약 판매 시작!",
      "안녕하세요,\n우리는 여러분에게 흥미로운 소식을 전해드립니다! 최신 휴대폰 모델의 신상 출시가 다가왔습니다. 이번 신제품은 뛰어난 성능과 혁신적인 기능을 갖추고 있어, 여러분의 모바일 경험을 한층 더 향상시켜 줄 것입니다.\n신제품 휴대폰을 더욱 특별하게 만들기 위해 예약 판매를 시작합니다. 예약 구매 시 특별 혜택이 가득합니다! 예약 구매 고객에게는 추가 액세서리 패키지와 확장 보증, 그리고 한정 수량의 선착순 예약자에게는 현금 할인도 제공됩니다!\n이 기회를 놓치지 마세요. 지금 바로 예약 판매에 참여하여 최신 휴대폰 모델을 가장 먼저 만나보세요. 아래 링크를 클릭하여 상세 정보를 확인하고 예약을 진행해주세요.\n링크: [신상 휴대폰 예약 판매 상세 정보]\n문의 사항이 있으시면 언제든지 저희에게 연락 주세요. 고객센터 직원들이 친절하게 답변해 드리겠습니다.\n감사합니다.\n휴대폰 판매 팀 드림", "0407_09:25", false, "받은편지함", false, true),
    Mail("뷰티 서플리먼트 팀",
      "건강과 아름다움을 한 번에! 신제품 뷰티 서플리먼트 출시 안내",
      "안녕하세요,\n건강과 아름다움을 동시에 추구하시는 여러분을 위해 특별한 소식을 전해드립니다. 저희는 최신 연구와 혁신적인 기술을 바탕으로 개발된 신제품 뷰티 서플리먼트를 출시하였습니다.\n이 뷰티 서플리먼트는 다양한 비타민, 미네랄, 항산화제 등의 영양소로 구성되어 있어 피부, 머리, 네일 등 아름다움을 총괄적으로 케어해줍니다. 또한, 천연 원료를 사용하여 만들어져 효과적이고 안전한 사용을 보장합니다.\n신제품 출시를 기념하여 첫 구매 고객에게는 추가 할인 혜택을 드리고 있습니다. 더불어 구매 시 포인트도 적립되어 다음 구매 시 사용하실 수 있습니다. 아름다움과 건강을 한 번에 챙길 수 있는 이 특별한 기회를 놓치지 마세요!\n아래 링크를 클릭하여 상세한 제품 정보와 구매 방법을 확인해주세요.\n링크: [신제품 뷰티 서플리먼트 상세 정보]\n추가 문의 사항이 있으시면 언제든지 저희에게 연락해주세요. 고객센터 직원들이 친절하게 도움을 드리겠습니다.\n건강과 아름다움을 위한 저희 제품과 함께 더욱 빛나는 일상을 만들어보세요.\n감사합니다.\n뷰티 서플리먼트 팀 드림", "0406_19:15", false, "받은편지함", false, true),
    Mail("건강식품 팀",
      "건강한 라이프스타일을 위한 신제품 출시! 지금 구매하면 특별 혜택 받으세요!",
      "안녕하세요,\n건강한 라이프스타일을 추구하시는 분들을 위해 특별한 제품을 소개해드립니다! 우리는 신선한 재료와 천연 원료로 만들어진 제품을 제공하여 여러분의 건강을 지원하고자 합니다.\n이번에 출시된 신제품은 영양 가득한 슈퍼푸드로, 비타민, 미네랄, 항산화제 등 다양한 영양소를 함유하고 있습니다. 우리의 제품은 인공 첨가물이나 방부제를 사용하지 않으며, 자연 그대로의 풍미와 영양을 그대로 전달합니다.\n특별한 혜택도 놓치지 마세요! 이번 주문 시 특별 가격으로 제공되며, 구매 고객에게는 추가로 선물 세트와 할인 쿠폰도 제공됩니다. 건강한 라이프스타일을 위한 첫 걸음을 내딛으시려는 분들께 최적의 기회가 될 것입니다.\n지금 바로 저희 웹사이트를 방문하시고 신제품에 대한 상세 정보와 구매 방법을 확인해보세요. 아래 링크를 클릭하시면 바로 이동할 수 있습니다.\n링크: [건강한 라이프스타일 제품 구매하기]\n문의사항이 있으시면 언제든지 저희 고객센터로 연락 주세요. 친절한 상담원들이 여러분을 도와드리겠습니다.\n건강한 삶을 위한 선택, 지금 시작해보세요!\n감사합니다.\n건강식품 팀 드림", "0406_10:45", false, "받은편지함", false, true),
    Mail("현대자동차",
      "현대자동차 신차 출시 이벤트! 특별 혜택을 놓치지 마세요!",
      "안녕하세요,\n현대자동차에서 새로운 모델을 출시하였습니다! 이번에 출시된 신차는 탁월한 디자인과 최신 기술로 가득 차 있어, 여러분의 운전 경험을 한층 업그레이드할 것입니다.\n        특별한 이벤트로 신차 구매 시 특별 혜택을 드리고 있습니다. 구매 고객에게는 추가 액세서리 세트와 무료 정비 서비스 등 다양한 혜택을 제공해 드립니다. 또한, 한정 수량의 선착순 예약 구매자에게는 특별한 기프트 카드도 드립니다!\n이 기회를 놓치지 마세요. 지금 현대자동차의 신차 출시 이벤트에 참여하여, 최신 기술과 스타일을 가진 차량을 만나보세요. 아래 링크를 클릭하여 상세 정보를 확인해주세요.\n링크: [현대자동차 신차 출시 이벤트 상세 정보]\n문의 사항이 있으시면 언제든지 저희에게 연락 주세요. 고객센터 직원들이 친절하게 답변해 드리겠습니다.\n감사합니다.\n현대자동차 영업팀 드림", "0405_14:30", false, "받은편지함", false, true),
    Mail("글로벌테크",
        "RE: 제품 A의 추가 판매 전략 논의 요청",
        "안녕하세요,\n저희 지원팀에서는 문의하신 제품에 대한 기술적인 지원을 제공하기 위해 이메일을 보내드립니다. 문의하신 내용에 대한 답변과 도움을 드리고자 합니다.\n문의하신 제품: 제품 X\n문의하신 내용에 대한 답변:\n기술적인 문제: 문제의 해결을 위해 기술 지원팀이 조치를 취하고 있습니다. 추가적인 정보를 제공해주시면 보다 정확한 답변을 드릴 수 있습니다.\n기능 사용법: 제품 X의 기능에 대한 자세한 설명과 사용법을 안내해드릴 수 있습니다. 필요하신 부분이 있으면 구체적으로 알려주시기 바랍니다.\n도움이 필요하거나 추가적인 질문이 있으시면 언제든지 문의해주세요. 최대한 신속하게 도움을 드리겠습니다.\n감사합니다.\n지원팀\nCompany Inc.", "0404_21:00", false, "받은편지함", true, true),
    Mail("아이린패션",
        "RE: RE: 문의하신 제품에 대한 기술 지원 안내",
        "안녕하세요,\n빠른 회신에 감사드립니다. 문의하신 제품 X에 대한 기술 지원을 제공해드리겠습니다.\n기술적인 문제: [상세한 문제 내용]에 대해 즉시 조치를 취할 수 있도록 기술 지원팀이 액션을 취하고 있습니다. 문제 해결을 위해 필요한 추가 정보가 있는지 알려주시면 보다 정확한 도움을 드릴 수 있습니다.\n기능 사용법: 제품 X의 [특정 기능]에 대한 자세한 설명과 사용법을 안내해드리겠습니다. [기능 활용 방법]을 따라 진행하시면 해당 기능을 원활하게 활용하실 수 있습니다.\n도움이 필요한 경우 언제든지 문의해주세요. 최대한 신속하고 정확한 지원을 제공하겠습니다.\n감사합니다.\n지원팀\nCompany Inc.", "0404_10:30", false, "받은편지함", false, false),
    Mail("쇼핑몰 팀",
        "여름 특별 세일! 최대 50% 할인된 가격으로 쇼핑하세요!",
        "안녕하세요,\n여름이 다가오고 있습니다! 이번 여름을 더욱 뜨겁게 만들어줄 특별 세일 소식을 전해드립니다. 저희 쇼핑몰에서는 다양한 상품들을 최대 50% 할인된 가격으로 만나보실 수 있습니다.\n여름 휴가를 앞두고 특별한 아이템을 찾고 계신가요? 저희 쇼핑몰에서는 비치웨어, 썬그라스, 비치백 등 여름 필수 아이템들을 다양하게 준비하였습니다. 또한, 최신 패션 트렌드를 반영한 의류, 액세서리, 신발 등 다양한 제품들을 저렴한 가격에 만나보실 수 있습니다.\n이번 특별 세일은 한정 기간 동안만 유효하니 놓치지 마세요! 지금 바로 저희 쇼핑몰로 방문하여 여름에 어울리는 다양한 상품들을 찾아보세요. 아래 링크를 클릭하시면 바로 쇼핑을 시작할 수 있습니다.\n링크: [여름 특별 세일 쇼핑몰 바로가기]\n더 많은 정보와 상품을 확인하려면 저희 웹사이트를 방문하거나 고객센터로 문의해 주세요. 항상 최상의 서비스로 여러분을 기다리고 있겠습니다.\n즐거운 여름 보내세요!\n쇼핑몰 팀 드림", "0404_09:30", false, "별표편지함", false, false),
    Mail("동아모터스",
        "RE: RE: 신제품 출시 기념 할인 이벤트 아이디어 회의 요청",
        "안녕하세요,\n회신을 받아서 감사드립니다. 회의 일정으로 6월 5일 (토요일) 오후 3시를 확인했습니다. 온라인 비디오 회의를 통해 아이디어를 공유하고 토론할 수 있도록 준비하겠습니다.\n추가로 회의 전에 필요한 준비물이나 주의사항이 있다면 미리 알려주시기 바랍니다.\n감사합니다.\n마케팅 팀\nCompany Inc.", "0403_12:50", true, "별표편지함", false, false),
    Mail("글로벌테크",
        "제품 A의 추가 판매 전략 논의 요청",
        "안녕하세요,\n저희 마케팅 팀에서는 최근 제품 A의 판매량을 높이기 위한 추가 전략을 고려하고 있습니다. 이에 대해 판매팀과 함께 논의하고자 이메일을 보내드립니다.\n제안 사항:\n가격 조정: 현재 제품 A의 가격이 경쟁사에 비해 높게 책정되어 있습니다. 가격 조정 여부와 조정 방향에 대해 의견을 나누고자 합니다.\n마케팅 캠페인: 제품 A를 대중에 알리기 위한 새로운 마케팅 캠페인을 기획하고 있습니다. 어떤 유형의 캠페인을 실행해볼지 아이디어를 공유해주세요.\n회의 일정 조율을 위해 가능한 날짜와 시간을 알려주시면 감사하겠습니다. 빠른 조율이 필요한 만큼 신속한 회신을 부탁드립니다.도움이 필요하거나 다른 의견이 있으시면 언제든지 연락주세요.\n감사합니다.\n\nMarketing Team\nCompany Inc.", "0402_21:00", false, "받은편지함", true, true),
    Mail("아이린패션",
        "문의하신 제품에 대한 기술 지원 안내",
        "안녕하세요 박지원님,\n 김영희라고 합니다. UI 디자이너로서 귀사에서 일하고 싶어서 이메일을 보내게 되었습니다. 제 경력과 기술이 UI 디자인 역할에 적합하다고 생각합니다.", "0402_10:30", false, "받은편지함", false, false),
    Mail("ABC 매장",
      "세일 특가! 최대 50% 할인된 가을 쇼핑 행사 안내",
      "안녕하세요,\n가을이 찾아왔습니다! 새로운 시즌을 맞아 저희 매장에서는 특별한 가을 쇼핑 행사를 개최합니다. 다양한 제품들이 최대 50%까지 할인된 가격으로 만나실 수 있습니다.\n여러분을 위해 준비한 특별 혜택 중 일부를 소개해드리겠습니다. 첫째, 가을 아우터 컬렉션에서는 모든 아우터 제품이 30% 할인된 가격으로 판매됩니다. 둘째, 시즌 한정 품목으로 제공되는 브랜드 신발은 최대 50% 할인된 가격으로 만나보실 수 있습니다. 셋째, 가을 패션 액세서리는 2개 구매 시 1개 더 추가로 제공되어 드립니다.\n더 많은 혜택과 할인을 받으실 수 있습니다. 저희 매장을 방문하셔서 가을 신상품과 다양한 특가 상품을 만나보세요. 아래 링크를 클릭하여 상세 정보를 확인해주세요.\n링크: [가을 쇼핑 행사 상세 정보]\n이 기회를 놓치지 마세요. 한정된 기간 동안만 진행되는 이벤트이니 서둘러 방문해주세요. 문의 사항이 있으시면 언제든지 저희에게 연락 주세요. 고객센터 직원들이 친절하게 답변해 드리겠습니다.\n감사합니다.\nABC 매장 영업팀 드림", "0402_11:20", false, "받은편지함", true, true),
    Mail("동아모터스",
        "신제품 출시 기념 할인 이벤트 아이디어 회의 요청",
        "안녕하세요,\n마케팅 팀의 여러분께 문의드립니다. 저희가 신제품 출시 기념으로 할인 이벤트를 진행하고자 하는데, 아이디어를 논의하고자 이메일을 보내드립니다.\n각자가 생각하는 할인 이벤트 아이디어를 공유하고, 가장 효과적이고 흥미로운 아이디어를 찾아내기 위해 회의를 개최하고자 합니다.\n가능한 회의 일정은 다음과 같습니다:\n날짜: 6월 5일 (토요일)\n시간: 오후 3시\n장소: 온라인 비디오 회의\n회의에 참석 가능한 시간을 알려주시면 최종 일정을 조율하도록 하겠습니다.\n다른 의견이 있거나 추가적인 아이디어를 공유하고 싶은 경우, 이메일로 알려주세요.\n감사합니다.\n마케팅 팀\nCompany Inc.", "0401_12:50", true, "별표편지함", false, false)];

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
    '글로벌테크': 'assets/contact/blue.png',
    '아이린패션': 'assets/contact/green.png',
    '동아모터스': 'assets/contact/purple.png',
    '에코그린에너지': 'assets/contact/red.png',
    'John' : 'assets/contact/brown.png',

    // Add more mappings for each sender/email and image asset
  };

  var isImportant;  //세팅 - 중요한 사용자 메일만 읽기의 활성화 여부

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint("build mail class");
    debugPrint("MailWrite : ${MailWrite.getInput()}");

    isImportant = SettingBasic.getSettingValue("중요한 사용자 메일만 읽기");
    debugPrint("isImportant : $isImportant");

    //setting Colors
    if(mailsColor.isEmpty) {
      for(var i = 0 ; i < mails.length ; i++) {
        mailsColor.add(Colors.white);
      }
    }

    //JsonParsing().saveData(mails);

    //라벨에 맞는 메일만 필터링
    setState(() {
      //MailInnewrScene의 변경 내용 적용
      items = setLabel(nowLabel, mails);
      debugPrint("len : ${items.length}");
    });

    listview = getListView();


    var appbar = !isSelect ? AppBar(title: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage())
        );
      },
      child: SizedBox(
        width: 1000,
        height: 50,
        child: Row(
          children: [
            Text("메일", style: TextStyle(color: Colors.black),),
            Text((nowLabel == "") ? "" : " : "),
            Text(nowLabel)
          ],
        ),
      ),
    ),
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    actions: [
      IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage())
        );
      },icon: const Icon(Icons.search, color: Colors.grey,),
    )]
      ,)  //Text('메일 : $nowLabel')
        : AppBar(title: IconButton(onPressed: () {
                          setState(() {
                            isSelect = false;
                            for(int i = 0 ; i < mailsColor.length ; i++) {
                              mailsColor[i] = Colors.white;
                            }
                          });
                        }, icon: const Icon(Icons.arrow_back_sharp, color: Colors.black,),),
            backgroundColor: Colors.white,
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


              }, icon: const Icon(Icons.account_balance_wallet, color: Colors.black,)),
              IconButton(onPressed: () {
                //원래는 보관이지만 전체 선택으로 변경 (네이버 메일 앱 참조)
                setState(() {
                  debugPrint("col len : ${mailsColor.length}");
                  debugPrint("col : ${mailsColor.contains(Colors.white)}");
                  for(var i = 0 ; i < mailsColor.length ; i++) {
                    debugPrint("col ${i} : ${mailsColor[i]}");
                  }

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
              }, icon: const Icon(Icons.checklist, color: Colors.black,)),
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
              }, icon: const Icon(Icons.delete, color: Colors.black,)),
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
              }, icon: const Icon(Icons.mail, color: Colors.black,)),
              IconButton(onPressed: () {

              }, icon: const Icon(Icons.menu_open, color: Colors.black,)),
            ],
          );

    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: appbar,
          drawer: !isSelect ? MyDrawer(onItemSelected: onDrawerItemSelected) : null,
          floatingActionButton: SizedBox(
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
                    inMailNum = getRealIndex(concentrateItems[index]);
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
    else if(isImportant) {  //중요한 사용자의 메일만 모아서 보기
      var impListFilter = ["글로벌테크", "아이린패션", "동아모터스"];
      var impMail = [];

      for(var i = 0 ; i < mails.length ; i++) {
        if(impListFilter.contains(mails[i].sender)) {
          impMail.add(mails[i]);
        }
      }
      debugPrint("impMail : ${impMail.length}");

      listView = ListView.builder(
          itemCount: impMail.length,
          itemBuilder: (context, index) {
            var ink = InkWell(
                onTap: () {
                  if(!isSelect) {
                    debugPrint("mailScene$index");
                    inMailNum = getRealIndex(impMail[index]);
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
                      if(mailsColor[getRealIndex(impMail[index])] == Colors.red) {
                        //이미 선택된 경우 해제
                        mailsColor[getRealIndex(impMail[index])] = Colors.white;
                      }
                      else {
                        mailsColor[getRealIndex(impMail[index])] = Colors.red;
                      }
                    });
                  }
                },
                //선택 및 강조 (appBar의 back버튼을 클릭 시에만 isSelect를 false로 세팅)
                onLongPress: () {
                  setState(() {
                    mailsColor[getRealIndex(impMail[index])] = Colors.red;
                    inMailNum = index;
                    isSelect = true;
                  });
                },
                child: Container(
                  //읽었을 때 Container의 색상을 변경
                  color: !isSelect ? (!items[getRealIndex(impMail[index])].isRead ? Colors.white : Colors.black12) : mailsColor[getRealIndex(impMail[index])],
                  child: ListTile(
                      leading: Image.asset(
                        senderImageMap[impMail[index].sender] ?? 'assets/images/file-tzt.png',
                        width: 50.0,
                      ),
                      title: Text(impMail[index].sender),
                      subtitle: SizedBox(
                        height: 50,
                        width: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 1000,
                              child: Text(
                                impMail[index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: 1000,
                              child: Text(
                                impMail[index].message.substring(0, 10),
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
                          //읽음 상태에 따른 아이콘 변경
                          (impMail[index].isRead) ? const Icon(Icons.mail_outline) : const Icon(Icons.mail),
                          SizedBox(
                            width: 100,
                            child: Column(
                              children: [
                                Text(impMail[index].time.split("_")[0]),
                                StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          impMail[index].isStar = !impMail[index].isStar;
                                        });
                                        debugPrint("item-index : ${impMail[index].toJson()}");
                                        if(impMail[index].isStar) {
                                          impMail[index].label = "별표편지함";
                                        }
                                        else {
                                          impMail[index].label = "받은편지함";
                                        }
                                      },
                                      child: impMail[index].isStar ? const Icon(Icons.star, color: Colors.yellowAccent)
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
                },
                child: ink);

            return dismiss;
          });
      return listView;
    }

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
                //읽었을 때 Container의 색상을 변경
                color: !isSelect ? (!items[index].isRead ? Colors.white : Colors.black12) : mailsColor[index],
                child: ListTile(
                    leading: Image.asset(
                      senderImageMap[items[index].sender] ?? 'assets/contact/Not_Important2.png',
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
                      //읽음 상태에 따른 아이콘 변경
                      (items[index].isRead) ? const Icon(Icons.mail_outline) : const Icon(Icons.mail),
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

  int getRealIndex(colObj) {
    var index = -1;

    for(var i = 0 ; i < mails.length ; i++) {
      if(mails[i] == colObj) {
        index = i;
        break;
      }
    }

    return index;
  }
}