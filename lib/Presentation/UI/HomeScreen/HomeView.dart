import 'package:flutter/material.dart';
import 'package:sbsr_admin_panel/Core/Theme/Theme.dart';
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
                    MainContainer(title: "Add Bus To Database",
                        buttonTitle: "buttonTitle",
                        callBackFunction: () {}),
                    MainContainer(title: "Add Bus To Database",
                        buttonTitle: "buttonTitle",
                        callBackFunction: () {}),

                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainContainer(title: "Add Bus To Database",
                        buttonTitle: "buttonTitle",
                        callBackFunction: () {}),
                    MainContainer(title: "Add Bus To Database",
                        buttonTitle: "buttonTitle",
                        callBackFunction: () {}),

                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
