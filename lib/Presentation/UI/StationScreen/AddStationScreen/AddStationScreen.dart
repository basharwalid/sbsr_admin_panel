import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sbsr_admin_panel/Core/Theme/Theme.dart';
import 'package:sbsr_admin_panel/Data/Firebase/StationDatabse.dart';
import 'package:sbsr_admin_panel/Presentation/UI/StationScreen/AddStationScreen/StationScreenViewModel.dart';
import 'package:sbsr_admin_panel/Presentation/UI/Widgets/CustomTextFormField.dart';

class AddStationScreen extends StatefulWidget {
  static const String routeName = 'AddStation';
  const AddStationScreen({super.key});

  @override
  State<AddStationScreen> createState() => _AddStationScreenState();
}

class _AddStationScreenState extends State<AddStationScreen> {
  @override
  Widget build(BuildContext context) {
    var viewModel = AddStationScreenViewModel(database: StationDatabse.getInstance());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                AppBar(
                  title: Text(
                    "Add Station To Database",
                    style: Theme
                        .of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                    controller: viewModel.stationIDController,
                    hintText: "Station ID",
                    prefixIcon: const Icon(Icons.numbers),
                    validator: viewModel.validateStationID,
                    inputType: TextInputType.text),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    controller: viewModel.stationNameController,
                    hintText: "Station name",
                    prefixIcon: const Icon(Clarity.namespace_line),
                    validator: viewModel.stationNameValidation,
                    inputType: TextInputType.text),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            MyTheme.lightGreen)),
                    onPressed: () {
                      if (viewModel.formKey.currentState!.validate()) {
                        viewModel.addStationToFirebase();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(seconds: 3),
                                showCloseIcon: true,
                                backgroundColor: MyTheme.lightGreen,
                                content: Text('Station Added Successfully')));
                      } else {
                        // Show an error message or visual cue to the user
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              duration: Duration(seconds: 3),
                              showCloseIcon: true,
                              backgroundColor: MyTheme.red,
                              content: Text('Please Check Input Validation')),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Add Station",
                            style:
                            Theme
                                .of(context)
                                .textTheme
                                .displayLarge,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
