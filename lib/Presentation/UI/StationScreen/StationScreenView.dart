import 'package:flutter/material.dart';
import 'package:sbsr_admin_panel/Core/Theme/Theme.dart';
import 'package:sbsr_admin_panel/Presentation/UI/Widgets/MainContainer.dart';

class StationScreenView extends StatefulWidget {
  static const String routeName = 'Station_Screen';
  const StationScreenView({super.key});

  @override
  State<StationScreenView> createState() => _StationScreenViewState();
}

class _StationScreenViewState extends State<StationScreenView> {
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
                    child: MainContainer(
                        title: "Add Station",
                        containerImage: "assets/images/bus.png"),
                  ),
                  InkWell(
                    child: MainContainer(
                        title: "Delete Station",
                        containerImage: "assets/images/bus.png"),
                  ),
                  InkWell(
                    child: MainContainer(
                        title: "Update Station",
                        containerImage: "assets/images/bus.png"),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
