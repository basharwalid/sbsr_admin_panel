import 'package:flutter/material.dart';
import 'package:sbsr_admin_panel/Core/Theme/Theme.dart';

class MainContainer extends StatelessWidget {
  String title;
  String containerImage;

  MainContainer(
      {super.key,
      required this.title, required this.containerImage});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  containerImage,
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.2,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 32, color: MyTheme.darkGrey),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
