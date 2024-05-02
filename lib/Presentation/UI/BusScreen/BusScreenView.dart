import 'package:flutter/material.dart';
import 'package:sbsr_admin_panel/Core/Theme/Theme.dart';
import 'package:sbsr_admin_panel/Presentation/UI/BusScreen/AddBusScreen/AddBusScreenView.dart';
import 'package:sbsr_admin_panel/Presentation/UI/Widgets/MainContainer.dart';

class BusScreenView extends StatefulWidget {
  static const String routeName = 'BusScreen';

  const BusScreenView({super.key});

  @override
  State<BusScreenView> createState() => _BusScreenViewState();
}

class _BusScreenViewState extends State<BusScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: MyTheme.offWhite,
          ),
          onPressed: () => Navigator.pop(context, false),
        )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: goToAddBusScreen,
                    child: MainContainer(
                        title: "Add Bus",
                        containerImage: "assets/images/bus.png"),
                  ),
                  InkWell(
                    child: MainContainer(
                        title: "Delete Bus",
                        containerImage: "assets/images/bus.png"),
                  ),
                  InkWell(
                    child: MainContainer(
                        title: "Update Bus",
                        containerImage: "assets/images/bus.png"),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
  void goToAddBusScreen(){
    Navigator.pushNamed(context, AddBusScreenView.routeName);
  }
}
