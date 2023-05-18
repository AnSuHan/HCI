class Mail {
  var sender = "";
  var title = "";
  var message = "";
  var time = "";
  var isStar = false;
  var label = "";
  var isRead = false;
  var isReceiverOpen = false;

  Mail(this.sender, this.title, this.message, this.time, this.isStar, this.label, this.isRead, this.isReceiverOpen);

  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'title': title,
      'message': message,
      'time': time,
      'isStar': isStar,
      'label' : label,
      'isRead' : isRead,
      "isReceiverOpen" : isReceiverOpen
    };
  }
}