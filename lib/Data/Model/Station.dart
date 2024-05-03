class Station {
  String uid;
  String stationName;

  Station(
      {required this.uid,
        required this.stationName,
        });

  Station.fromFireStore(Map<String, dynamic> json)
      : this(
    uid: json["stationID"],
    stationName: json["stationName"],

  );

  Map<String, dynamic> toFireStore() {
    return {
      "stationID" : uid,
      "stationName" : stationName
    };
  }
}
