import 'package:flutter/material.dart';
import 'package:sbsr_admin_panel/Data/Firebase/AddBusFirebase.dart';
import 'package:sbsr_admin_panel/Data/Model/Bus.dart';

class AddBusScreenViewModel {
  BusDatabase database;

  AddBusScreenViewModel({required this.database});

  final formKey = GlobalKey<FormState>();
  TextEditingController busIDController = TextEditingController();
  TextEditingController busNameController = TextEditingController();
  TextEditingController busFromController = TextEditingController();
  TextEditingController busToController = TextEditingController();

  String? validateBusID(String value) {
    if (value.isEmpty) {
      return "Bus ID cannot be empty";
    }
    return null; // Input is valid
  }

  String? busNameValidation(String busName) {
    if (busName.isEmpty) {
      return "bus name Can't be Empty";
    } else {
      return null;
    }
  }

  String? busFromValidation(String busFrom) {
    if (busFrom.isEmpty) {
      return "bus name Can't be Empty";
    } else {
      return null;
    }
  }

  String? busToValidation(String busTo) {
    if (busTo.isEmpty) {
      return "bus name Can't be Empty";
    } else {
      return null;
    }
  }

  Future<void> addBusToFirebase() async {
    String busID = busIDController.text;
    String busName = busNameController.text;
    String busFrom = busFromController.text;
    String busTo = busToController.text;
    Bus bus = Bus(
      uid: busID,
      busName: busName,
      from: busFrom,
      to: busTo,
      nextStation: '',
    );
    try {
      await database.addBus(bus, busID);
    } catch (e) {
      print(e);
    }
  }
}
