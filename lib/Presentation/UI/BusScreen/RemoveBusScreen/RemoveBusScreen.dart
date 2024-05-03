import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sbsr_admin_panel/Core/Theme/Theme.dart';
import 'package:sbsr_admin_panel/Data/Firebase/AddBusFirebase.dart';
import 'package:sbsr_admin_panel/Presentation/UI/BusScreen/RemoveBusScreen/RemoveBusScreenViewModel.dart';
import 'package:sbsr_admin_panel/Presentation/UI/Widgets/CustomTextFormField.dart';

class RemoveBusScreen extends StatefulWidget {
  static const String routeName = 'RemoveBusScreen';

  const RemoveBusScreen({super.key});

  @override
  State<RemoveBusScreen> createState() => _RemoveBusScreenState();
}

class _RemoveBusScreenState extends State<RemoveBusScreen> {
  var viewModel = RemoveBusScreenViewModel(database: BusDatabase.getInstance());

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
                    controller: viewModel.busIDController,
                    hintText: "Bus ID",
                    prefixIcon: const Icon(Icons.numbers),
                    validator: viewModel.validateBusID,
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
                        viewModel.deleteBusFromDatabase();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              duration: Duration(seconds: 3),
                              showCloseIcon: true,
                              backgroundColor: MyTheme.lightGreen,
                              content: Text('Bus Deleted Successfully')),
                        );
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
