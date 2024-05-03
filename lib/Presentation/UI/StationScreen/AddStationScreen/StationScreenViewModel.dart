import 'package:flutter/material.dart';
import 'package:sbsr_admin_panel/Data/Firebase/StationDatabse.dart';
import 'package:sbsr_admin_panel/Data/Model/Station.dart';

class AddStationScreenViewModel {
  StationDatabse database;
  TextEditingController stationIDController = TextEditingController();
  TextEditingController stationNameController = TextEditingController();
  AddStationScreenViewModel({required this.database});
  final formKey = GlobalKey<FormState>();

  String? validateStationID(String value) {
    if (value.isEmpty) {
      return "Bus ID cannot be empty";
    }
    return null; // Input is valid
  }

  String? stationNameValidation(String stationName) {
    if (stationName.isEmpty) {
      return "bus name Can't be Empty";
    } else {
      return null;
    }
  }

  Future<void> addStationToFirebase() async {
    String stationID = stationIDController.text;
    String stationName = stationNameController.text;
    Station station = Station(uid: stationID, stationName: stationName);
    try {
      await database.addStation(station, stationID);
    } catch (e) {
      print(e);
    }
  }
}
