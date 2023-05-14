class Mail {
  var sender = "";
  var title = "";
  var message = "";
  var time = "";
  var isStar = false;
  var label = "";
  var isRead = false;

  Mail(this.sender, this.title, this.message, this.time, this.isStar, this.label, this.isRead);

  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'title': title,
      'message': message,
      'time': time,
      'isStar': isStar,
      'label' : label,
      'isRead' : isRead
    };
  }
}