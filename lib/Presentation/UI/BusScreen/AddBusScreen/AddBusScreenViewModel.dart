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

  String? busFromValidation(String busName) {
    if (busName.isEmpty) {
      return "bus name Can't be Empty";
    } else {
      return null;
    }
  }

  String? busToValidation(String busName) {
    if (busName.isEmpty) {
      return "bus name Can't be Empty";
    } else {
      return null;
    }
  }

  Future<void> addBusToDataBase(Bus bus) async {
    try{
      await database.addBus(Bus(
        uid: busIDController.text,
        busName: busNameController.text,
        from: busFromController.text,
        nextStation: "",
        to: busToController.text,
      ),bus.uid);
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> addBusToFirebase() async {
    // Get values from text editing controllers
    String busID = busIDController.text;
    String busName = busNameController.text;
    String busFrom = busFromController.text;
    String busTo = busToController.text;

    // Create a Bus object (assuming you have a Bus class)
    Bus bus = Bus(
      uid: busID, // Assuming uid is the bus ID
      busName: busName,
      from: busFrom,
      to: busTo,
      nextStation: '',
    );

    // Call the addBus function from your database
    try{
      await database.addBus(bus, busID);// Assuming database is a property holding the database object
    }catch(e){
      print(e);
    }

  }
}
