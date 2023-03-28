class Mail {
  var sender = "";
  var title = "";
  var subTitle = "";
  var message = "";
  var time = "";
  var isStar = false;

  Mail(this.sender, this.title, this.subTitle, this.message, this.time, this.isStar);

  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'title': title,
      'subtitle': subTitle,
      'message': message,
      'time': time,
      'isStar': isStar,
    };
  }
}