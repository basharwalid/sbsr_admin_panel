import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sbsr_admin_panel/Core/Theme/Theme.dart';
import 'package:sbsr_admin_panel/Data/Firebase/AddBusFirebase.dart';
import 'package:sbsr_admin_panel/Presentation/UI/BusScreen/AddBusScreen/AddBusScreenViewModel.dart';
import 'package:sbsr_admin_panel/Presentation/UI/Widgets/CustomTextFormField.dart';

class AddBusScreenView extends StatefulWidget {
  static const String routeName = 'AddBusScreen';

  const AddBusScreenView({super.key});

  @override
  State<AddBusScreenView> createState() => _AddBusScreenViewState();
}

class _AddBusScreenViewState extends State<AddBusScreenView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = AddBusScreenViewModel(database: BusDatabase.getInstance());
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
                    inputType: TextInputType.text),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    controller: viewModel.busNameController,
                    hintText: "Bus name",
                    prefixIcon: const Icon(Clarity.namespace_line),
                    validator: viewModel.busNameValidation,
                    inputType: TextInputType.text),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    controller: viewModel.busFromController,
                    hintText: "Bus Source",
                    prefixIcon: const Icon(Icons.call_rounded),
                    validator: viewModel.busFromValidation,
                    inputType: TextInputType.text),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    controller: viewModel.busToController,
                    hintText: "Bus Destination",
                    prefixIcon: const Icon(Icons.call_rounded),
                    validator: viewModel.busToValidation,
                    inputType: TextInputType.text),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.lightGreen)),
                    onPressed: () {
                      if (viewModel.formKey.currentState!.validate()) {
                        viewModel.addBusToFirebase();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(seconds: 3),
                                showCloseIcon: true,
                                backgroundColor: MyTheme.lightGreen,
                                content: Text('Bus Deleted Successfully')));
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
                            "Add Bus",
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
