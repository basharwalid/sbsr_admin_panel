import 'package:flutter/material.dart';
import 'package:sbsr_admin_panel/Data/Firebase/AddBusFirebase.dart';
import 'package:sbsr_admin_panel/Data/Model/Bus.dart';

class RemoveBusScreenViewModel {
  BusDatabase database;

  RemoveBusScreenViewModel({required this.database});

  final formKey = GlobalKey<FormState>();
  TextEditingController busIDController = TextEditingController();

  String? validateBusID(String value) {
    if (value.isEmpty) {
      return "Bus ID cannot be empty";
    }
    return null; // Input is valid
  }

  Future<void> deleteBusFromDatabase()async{
    await database.deleteBus(busIDController.text);
  }
}
