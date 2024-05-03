import 'package:flutter/material.dart';
import 'package:sbsr_admin_panel/Data/Firebase/StationDatabse.dart';

class RemoveStationScreenViewModel{
  StationDatabse database;
  RemoveStationScreenViewModel({required this.database});
  final formKey = GlobalKey<FormState>();
  TextEditingController stationIDController = TextEditingController();

  String? validateStationID(String value) {
    if (value.isEmpty) {
      return "Bus ID cannot be empty";
    }
    return null; // Input is valid
  }

  Future<void> deleteStationFromDatabase()async{
    await database.deleteStation(stationIDController.text);
  }
}