class Bus {
  String uid;
  String busName;
  String from;
  String to;
  String nextStation;
  bool isFavorite = false;
  int favoriteIndex = 0;

  Bus(
      {required this.uid,
      required this.busName,
      required this.from,
      required this.nextStation,
      required this.to});

  Bus.fromFireStore(Map<String, dynamic> json)
      : this(
          uid: json["busID"],
          busName: json["busName"],
          from: json["from"],
          to: json["to"],
          nextStation: json["nextStation"],
          // isFavorite: json["isFavorite"]
        );

  Map<String, dynamic> toFireStore() {
    return {
      "busName": busName,
      "from": from,
      "to": to,
      "nextStation": nextStation,
      "busID": uid
    };
  }
}
