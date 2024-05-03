import 'package:flutter/material.dart';
import 'package:sbsr_admin_panel/Core/Theme/Theme.dart';
import 'package:sbsr_admin_panel/Data/Firebase/StationDatabse.dart';
import 'package:sbsr_admin_panel/Presentation/UI/StationScreen/RemoveStationScreen/RemoveStationScreenViewModel.dart';
import 'package:sbsr_admin_panel/Presentation/UI/Widgets/CustomTextFormField.dart';

class RemoveStationScreen extends StatefulWidget {
  static const String routeName = 'removeStation';
  const RemoveStationScreen({super.key});

  @override
  State<RemoveStationScreen> createState() => _RemoveStationScreenState();
}

class _RemoveStationScreenState extends State<RemoveStationScreen> {
  var viewModel =
      RemoveStationScreenViewModel(database: StationDatabse.getInstance());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                AppBar(
                  title: Text(
                    "Add Bus To Database",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
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
                    hintText: "Bus ID",
                    prefixIcon: const Icon(Icons.numbers),
                    validator: viewModel.validateStationID,
                    inputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.lightGreen)),
                    onPressed: () {
                      if (viewModel.formKey.currentState!.validate()) {
                        viewModel.deleteStationFromDatabase();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(seconds: 3),
                                showCloseIcon: true,
                                backgroundColor: MyTheme.lightGreen,
                                content: Text('Station Deleted Successfully')));
                      } else {
                        // Show an error message or visual cue to the user
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              duration: Duration(seconds: 3),
                              showCloseIcon: true,
                              backgroundColor: MyTheme.red,
                              content: Text('Please Check ID Validation')),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Remove Bus",
                            style: Theme.of(context).textTheme.displayLarge,
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
