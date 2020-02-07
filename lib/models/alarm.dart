
class Alarm {
  int id;
  String label;
  DateTime time;
  DateTime created; 

  Alarm({this.id, this.label, this.time});
  

  Alarm.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.label = map['label'];
    this.time = DateTime.fromMicrosecondsSinceEpoch(map['time']);
    this.created = DateTime.fromMicrosecondsSinceEpoch(map['created']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': this.id,
      'label': this.label,
      'time': this.time.millisecondsSinceEpoch,
      'created': this.created.millisecondsSinceEpoch
    };
  }




}