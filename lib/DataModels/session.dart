class Session {
  final DateTime time;
  final int stressLevel;

  Session({this.time, this.stressLevel});

  Map<String, dynamic> toMap() {
    return {'time': time.toString(), 'stressLevel': stressLevel};
  }
}
