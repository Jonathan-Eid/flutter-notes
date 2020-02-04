class Notes {
  int id;
  String header;
  String content;
  DateTime date;

  Notes({this.id, this.header, this.content, this.date});
  

  Notes.fromMap(Map<String, dynamic> map) {
    this.id = map['_id'];
    this.header = map['header'];
    this.content = map['content'];
    this.date = DateTime.parse(map['date']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': this.id,
      'header': this.header,
      'content': this.content,
      'date': this.date.millisecondsSinceEpoch
    };
  }

  

}

