import 'package:flutter/material.dart';

import 'package:sbsr_admin_panel/Presentation/UI/BusScreen/BusScreenView.dart';
import 'package:sbsr_admin_panel/Presentation/UI/StationScreen/StationScreenView.dart';
import 'package:sbsr_admin_panel/Presentation/UI/Widgets/MainContainer.dart';

class HomeView extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      onTap: goToBusScreen,
                      child: MainContainer(
                          title: "Bus",
                          containerImage: "assets/images/bus.png"),
                    ),
                    InkWell(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      onTap: goToStationScreen,
                      child: MainContainer(
                          title: "Station",
                          containerImage: "assets/images/busStop.png"),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  void goToStationScreen(){
    Navigator.pushNamed(context, StationScreenView.routeName);
  }
  void goToBusScreen() {
    Navigator.pushNamed(context, BusScreenView.routeName);
  }
}
