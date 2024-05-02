import 'package:flutter/material.dart';
import 'package:sbsr_admin_panel/Core/Theme/Theme.dart';

class MainContainer extends StatelessWidget {
  String title;
  String buttonTitle;
  Function callBackFunction;

  MainContainer(
      {super.key,
      required this.title,
      required this.buttonTitle,
      required this.callBackFunction});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyTheme.offWhite),
            child: Column(
              children: [
                Text(title),
              ],
            )),
        ElevatedButton(
            onPressed: callBackFunction(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    buttonTitle,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
